package friendsgram.a.skw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.skw.service.InfoService;
import friendsgram.member.dto.MemberDto;

@SessionAttributes("user")
@Controller
public class InfoController {
	@Autowired
	InfoService service;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	@GetMapping("/profile/myprofile")
	public String myprofile(@ModelAttribute("user") MemberDto dto ) {
		return "profile/myprofile";
	}
}
