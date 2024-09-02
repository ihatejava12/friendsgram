package friendsgram.a.skw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.skw.service.CorporationService;
import friendsgram.member.dto.Corporation_MemberDto;

@SessionAttributes("user")
@Controller
public class CorporationInfoController {

    @Autowired
    CorporationService cservice;

    // Corporation_MemberDto를 사용하는 기업 프로필 페이지를 반환
    @GetMapping("/corporationprofile")
    public String corporationprofile(@ModelAttribute("user") Corporation_MemberDto dto) {
        return "skw/corporation/corporationprofile";
    }

    // Corporation_MemberDto를 업데이트하고 메인 페이지로 리다이렉트
    @PutMapping("/updatecor")
    public String updateCor(@ModelAttribute("user") Corporation_MemberDto dto) {
    	System.out.println(dto.getPassword());
        cservice.updateCor(dto);
        return "redirect:/corporationprofile";
    }
}