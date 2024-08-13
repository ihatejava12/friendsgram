package friendsgram.a.skw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.skw.service.InfoService;
import friendsgram.a.skw.service.MemberService;
import friendsgram.member.dto.MemberDto;
import friendsgram.member.dto.Member_InfoDto;

@SessionAttributes("user")
@Controller
public class InfoController {
	@Autowired
	InfoService service;
	
	@Autowired
	MemberService mservice;

	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}

	@GetMapping("/myprofile")
	public String myprofile(@ModelAttribute("user") MemberDto dto) {
		return "skw/profile/myprofile";
	}
	
	@PutMapping("/update")
	public String update(@ModelAttribute("user") MemberDto dto) {
		mservice.updateMem(dto);
		return "redirect:/main";
	}

	@GetMapping("/info")
	public String info(@ModelAttribute("user") MemberDto dto) {
		return "skw/profile/info";
	}
	@GetMapping("/review")
	public String review(@ModelAttribute("user") MemberDto dto) {
		return "skw/profile/review";
	}
	@GetMapping("/infowrite")
	public String infowrite(@ModelAttribute("user") MemberDto dto ) {
		return "skw/profile/infowrite";
	}
	
	@PostMapping("/insertInfo")
	public String write(@ModelAttribute("info") @Validated Member_InfoDto dto, BindingResult error) {
		if(error.hasErrors()) {
			error.reject("nocode", "제목이 없습니다");
			return "skw/profile/infowrite";
		}
		service.insertInfo(dto);
		return "skw/profile/infock";
	}
	@GetMapping("/infock")
	public String infock(@ModelAttribute("user") MemberDto dto) {
		return "skw/profile/infock";
	}
}
