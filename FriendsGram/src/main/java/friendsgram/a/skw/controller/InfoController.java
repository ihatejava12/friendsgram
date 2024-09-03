package friendsgram.a.skw.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
    
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
    	System.out.println(dto.getPassword());
        mservice.updateMem(dto);
        return "redirect:/myprofile";
    }

    @GetMapping("/info")
    public String info(@ModelAttribute("user") MemberDto dto) {
        return "skw/profile/info";
    }

    @GetMapping("/infowrite")
    public String writeinfo(@ModelAttribute("user") MemberDto dto) {
        return "skw/profile/infowrite";
    }

    @PostMapping("/insertInfo")
    public String infowrite(@ModelAttribute("user") MemberDto dto, @Validated Member_InfoDto mdto, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "skw/profile/infowrite";
        }
        logger.info("Inserting info for user: {}", dto.getId());
        service.insertInfo(mdto);

        // Member_InfoDto 데이터를 모델에 추가하여 infock.jsp에서 사용할 수 있도록 함
        model.addAttribute("memberInfo", mdto);
        
        return "redirect:/infock";
    }

    @GetMapping("/infock")
    public String infock(@ModelAttribute("user") MemberDto dto, Model model) {
        // Model에서 데이터를 받아서 JSP로 전달
        Member_InfoDto memberInfo = service.midto(dto.getId());
       
        model.addAttribute("memberInfo", memberInfo);
        return "skw/profile/infock";
    }
    
    @PutMapping("/updateinfo")
    public String update(Member_InfoDto dto) {
    	System.out.println(dto);
        service.updateinfo(dto);
        return "redirect:/myprofile";
    }
    
    
}