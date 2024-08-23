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
	public String questionlist(@RequestParam(value = "keyword", required = false) String keyword,Model m ) {
		List<QuestionDto> qlist = service.qlist(keyword);
			m.addAttribute("qlist", qlist );
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

	@GetMapping("/question/search")
	public String searchq(@RequestParam("keyword") String keyword ,Model m) {
		
		List<QuestionDto> qlist = service.qlist(keyword);
		m.addAttribute("qlist", qlist);
		
		return "kyh/question/list";
	}
	
	@GetMapping("/question/{q_no}")
	public String qcontent(@PathVariable("q_no") int q_no , Model m) {
		QuestionDto qdto = service.qcontent(q_no);
		m.addAttribute("qcontent", qdto);
		return ("kyh/question/content");
		
	}
	
}
