package friendsgram.a.kyh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.kyh.service.MainService;
import friendsgram.admin.dto.NoticeDto;
import friendsgram.board04.dto.Board04Dto;
import friendsgram.member.dto.MemberDto;

@Controller
@SessionAttributes("user")
public class MainController {
	
	@Autowired
	MainService mservice;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@GetMapping("/main")
    public String showMainPage(Model model) {
		System.out.println("main이동");
        List<NoticeDto> recentNotices = mservice.getRecentMainNotices();
        List<Board04Dto> b04 = mservice.getRecentMainBoard04();
        model.addAttribute("b04", b04);
        model.addAttribute("notices", recentNotices);
        return "kyh/main/main"; // JSP 파일의 경로
    }
	
	@GetMapping("/")
	public String host() {
		return "redirect:/main";
	}
	

}
