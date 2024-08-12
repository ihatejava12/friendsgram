package friendsgram.a.jhk.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.jhk.admin.service.AdminQuestionService;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.question.dto.QuestionDto;
import friendsgram.question.dto.Question_AnswerDto;

@Controller
public class AdminQuestionController {
	
	@Autowired
	AdminQuestionService service;
	
	@GetMapping("/onequestion/{q_no}")
	public String onequestion(@PathVariable("q_no") int q_no, Model m) {
		QuestionDto qdto = service.oneQuestion(q_no);
		m.addAttribute("dto", qdto);
		
		return "/jhk/question/onequestion";
	}
	
	@PostMapping("/insertanswer")
	public String insertAnswer(@RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("id") String id, @RequestParam("q_no") int q_no) {
		service.insertAnswer(title, content, id, q_no);
		service.updateRequest(q_no);
		
		return "redirect:/adminpage/questionlist";
	}
	
	@GetMapping("/question/writeanswer/{q_no}")
	public String writeAnswer(@PathVariable("q_no") int q_no, Model m) {
		m.addAttribute("q_no", q_no);
		
		return "/jhk/question/writequestion";
	}
	
	@GetMapping("/question/answer/{q_no}")
	public String questionAnswer(@PathVariable("q_no") int q_no, Model m) {
		Question_AnswerDto dto = service.questionAnswer(q_no);
		m.addAttribute("dto", dto);
		
		return "/jhk/question/questionanswer";
	}

	@GetMapping("/adminpage/questionlist")
	public String questionList(@RequestParam(value = "searchn", defaultValue = "3", required = false) int searchn, @RequestParam(value = "content", defaultValue = "", required = false) String content, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.questionCount(searchn,content);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<QuestionDto> qlist = service.questionList(searchn, content, startRow);
		m.addAttribute("qlist", qlist);
		
		int pageNum = 10;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		 m.addAttribute("end", end);
		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", content);
		
		return "/jhk/question/questionlist";
	}
	
}
