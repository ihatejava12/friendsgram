package friendsgram.a.skw.controller;

import java.security.SecureRandom;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import friendsgram.a.skw.service.CorporationService;
import friendsgram.a.skw.service.EmailService;
import friendsgram.a.vo.EmailVO;
import friendsgram.member.dto.Corporation_MemberDto;


@Controller
public class Corporationcontroller {
	@Autowired
	CorporationService service;
	@Autowired
	EmailService emailService;
	
	@ModelAttribute("user")
	public Corporation_MemberDto getDto() {
		return new Corporation_MemberDto();
	}
	
	@GetMapping("/findCorpw")
	public String findpw() {
		return "corporation/findpw";
	}
	@GetMapping("/findCorpwresult")
	public String findpwresult(@ModelAttribute("command") Corporation_MemberDto dto, BindingResult errors, @RequestParam("email") String email) {
		
		String nwPw = createNewPassword(); //새로운 비번 생성
		int count = service.updatePw(dto, nwPw);
		
		if(count == 0) { //id 또는 name 틀림
			errors.reject("nocode", "아이디나 이름이 틀렸습니다.");
			return "corporation/findpw";
		}else { // 이메일 전송, loginform으로 이동
			EmailVO e = new EmailVO();
			
			String receiver = email; // Receiver.

			String subject = "비밀번호가 최기화 되었습니다.";
			
			String content = "초기화된 비밀번호는 "+nwPw+"입니다.";
			
			e.setReceiver(receiver);
			e.setSubject(subject);
			e.setContent(content);

			try {
				//emailService.sendMail(e);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		
		return "corporation/coporationloginform";
	}
	
	private String createNewPassword() {
	      char[] chars = new char[] {
	            '0','1','2','3','4','5','6','7','8','9',
	            'a','b','c','d','e','f','g','h','i','j',
	            'k','l','m','n','o','p','q','r','s','t',
	            'u','v','w','x','y','z'   };
	      
	      StringBuffer stringBuffer = new StringBuffer();
	      SecureRandom secureRandom = new SecureRandom();
	      secureRandom.setSeed(new Date().getTime());

	      int index = 0;
	      int length = chars.length;
	      for(int i = 0; i < 8; i++) {
	         index = secureRandom.nextInt(length);
	         
	         if(index % 2 == 0) {
	            stringBuffer.append(String.valueOf(chars[index]).toUpperCase());
	         }else {
	            stringBuffer.append(String.valueOf(chars[index]).toLowerCase());
	         }
	      }
	      
	      System.out.println("newPASSWORD : " + stringBuffer.toString());
	      
	      return stringBuffer.toString();
	   }
	
	@GetMapping("/corporationinsert")
	public String corporationjoinform() {
		return "corporation/corporationjoinform";
	}
	@GetMapping("/coridCheck")
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) {
		String checkid = service.coridCheck(id);
		return checkid; // text
	}
	
	@PostMapping("/insertCor")
	public String insert(@Validated Corporation_MemberDto dto) {
		service.insertCor(dto);
		return "/corporation/corporationloginform";
	}
	
	@GetMapping("/corporationloginform")
	public String loginform() {
		return "corporation/corporationloginform";
	}
	
	@PostMapping("/corlogin")
	public String corlogin(@ModelAttribute("command") @Validated Corporation_MemberDto dto, BindingResult error, Model m) {
		System.out.println(dto);
		
		
		if(error.hasErrors()) {
			return "corporation/corporationloginform";
		}
		Corporation_MemberDto resultDto = service.corlogin(dto);
		if(resultDto == null) {
			error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림");	
			return "corporation/corporationloginform";
		}else {//로그인 성공
			m.addAttribute("cuser", resultDto);
		}
		return "/corporation/main";
	}
	
	@GetMapping("/corlogout")
	public String logout(SessionStatus statusCor) {
		statusCor.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/updateCor")
	public String updateform() {
		return "corporation/updateform";
	}
	
	@PutMapping("/updateCor")
	public String updateCor(@ModelAttribute("user") Corporation_MemberDto dto) {
		service.updateCor(dto);
		return "redirect:corporation/main";
	}
	
	@GetMapping("/deleteCor")
	public String deleteform(@RequestParam(value="result",required = false) String result, Model m) {
		m.addAttribute("result",result);
		return "corporation/deleteform";
	}
	
	@DeleteMapping("/deleteCor")
	public String deleteCor(@RequestParam(value="formpw",required = false) String formpw, @ModelAttribute("user") Corporation_MemberDto dto, SessionStatus statusCor) {
	
		int i = service.deleteCor(formpw, dto);
		if(i == 0) {
			return "redirect:/delete?result=false";
		}else {
			statusCor.setComplete();
			return "redirect:/main";
		}
	}
	
	@RequestMapping("/Cormain")
	public String main(@ModelAttribute("user") Corporation_MemberDto dto) {
		if(dto.getId() != null) {
			return "corporation/main";
		}else {
			return "corporation/coporationloginform";
		}
	}   
}

