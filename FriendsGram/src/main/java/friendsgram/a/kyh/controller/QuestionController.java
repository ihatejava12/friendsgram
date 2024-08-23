package friendsgram.a.kyh.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.kyh.service.QuestionService;
import friendsgram.member.dto.LoginDto;
import friendsgram.question.dto.QuestionDto;
import friendsgram.question.dto.Question_AnswerDto;

@Controller
@SessionAttributes("user")
public class QuestionController {
	
	@Autowired
	private QuestionService service;
	
	@ModelAttribute("user")
	public LoginDto getDto() {
		return new LoginDto();
	}
	
	@GetMapping("/question")
	public String questionlist(
	    @RequestParam(name="search", required=false, defaultValue="") String search,
	    @RequestParam(name="p", defaultValue = "1") String p,  // 페이지 번호를 String으로 받아서 후처리
	    @ModelAttribute("user") Object member,
	    Model m) {

	    int page;
	    try {
	        page = Integer.parseInt(p);
	    } catch (NumberFormatException e) {
	        page = 1; // 페이지 번호가 숫자가 아닌 경우 기본값 1로 설정
	    }

	    int count = service.count(search);  // 검색어로 필터링된 결과 개수
	    if (count > 0) {
	        int perPage = 10;  // 한 페이지에 보일 글의 갯수
	        int startRow = (page - 1) * perPage;

	        List<QuestionDto> pageList = service.pageList(search, startRow);
	        m.addAttribute("qlist", pageList);

	        int pageNum = 5;
	        int totalPages = (int) Math.ceil((double) count / perPage);  // 전체 페이지 수 계산

	        int begin = (page - 1) / pageNum * pageNum + 1;
	        int end = Math.min(begin + pageNum - 1, totalPages);

	        m.addAttribute("begin", begin);
	        m.addAttribute("end", end);
	        m.addAttribute("pageNum", pageNum);
	        m.addAttribute("totalPages", totalPages);
	    }

	    m.addAttribute("count", count);
	    m.addAttribute("search", search);

	    return "kyh/question/list";
	}






	
	@GetMapping("/question/write")
	public String questionWriteForm() {
		
		
		return "kyh/question/write";
	}
	
	@PostMapping("/question/write")
	public String questionWrite(QuestionDto dto) {
		dto.setDate(new Date());
		service.qinsert(dto);
		
		return "redirect:/question";
	}

//	@GetMapping("/question/search")
//	public String searchq(@RequestParam("keyword") String keyword ,Model m) {
//		
//		List<QuestionDto> qlist = service.qlist(keyword);
//		m.addAttribute("qlist", qlist);
//		
//		return "kyh/question/list";
//	}
	
	@GetMapping("/question/{q_no}")
	public String qcontent(@PathVariable("q_no") int q_no , Model m) {
		Question_AnswerDto qadto = service.qacontent(q_no);
		QuestionDto qdto = service.qcontent(q_no);
		m.addAttribute("qacontent", qadto);
		m.addAttribute("qcontent", qdto);
		return "kyh/question/content";
		
	}
	
	
}
