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
import friendsgram.board05.dto.Board05Dto;
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
        List<NoticeDto> recentNotices = mservice.getRecentMainNotices();
        List<Board05Dto> b05 = mservice.getRecentMainBoard05();
        model.addAttribute("b05", b05);
        model.addAttribute("notices", recentNotices);
        return "kyh/main/main"; // JSP 파일의 경로
    }
	@RequestMapping("/aa")
	public String main(@ModelAttribute("user") MemberDto dto) {
		if(dto.getId() != null) {
			return "mem/main";
		}else {
			return "/kyh/login/login";
		}
	}

	
	
	
	
}
  