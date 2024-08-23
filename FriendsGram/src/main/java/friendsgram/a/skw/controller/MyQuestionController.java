package friendsgram.a.skw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.skw.service.MyQuestionService;
import friendsgram.member.dto.MemberDto;
import friendsgram.question.dto.QuestionDto;

@SessionAttributes("user")
@Controller
public class MyQuestionController {
	
	@Autowired
	MyQuestionService service;
	
	@GetMapping("/myquestion")
	public String myQuestion(@ModelAttribute("user") MemberDto dto, @RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		String id = dto.getId();
		
		//글이 있는지 체크
		int count = service.count();
		if(count > 0) {
				
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
				
		List<QuestionDto> qlist = service.myQuestion(id, startRow);
		m.addAttribute("qlist", qlist);

		int pageNum = 10;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
				
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
					end = totalPages;
		}
		m.addAttribute("begin", begin);
		m.addAttribute("end", end);
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("totalPages", totalPages);
				
		}
		m.addAttribute("count", count);
		
		return "/skw/profile/myquestionlist";
	}
	
}
