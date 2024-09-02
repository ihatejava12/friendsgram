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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import friendsgram.a.skw.service.CorporationService;
import friendsgram.a.skw.service.EmailService;
import friendsgram.a.skw.service.MemberService;
import friendsgram.a.vo.EmailVO;
import friendsgram.member.dto.Corporation_MemberDto;
import friendsgram.member.dto.LoginDto;
import friendsgram.member.dto.MemberDto;

@Controller
@SessionAttributes("user")
public class MemberController {
	@Autowired
	MemberService service;
	@Autowired
	EmailService emailService;
	@Autowired
	CorporationService cservice;

	@ModelAttribute("user")
	public LoginDto getDto() {
		return new LoginDto();
	}

	@GetMapping("/findpw")
	public String findpw() {
		return "skw/member/findpw";
	}

	@GetMapping("/findpwresult")
	public String findpwresult(@ModelAttribute("command") MemberDto dto, BindingResult errors,
			@RequestParam("email") String email) {

		String nwPw = createNewPassword(); // 새로운 비번 생성
		int count = service.updatePw(dto, nwPw);

		if (count == 0) { // id 또는 name 틀림
			errors.reject("nocode", "아이디나 이름이 틀렸습니다.");
			return "skw/login/findpw";
		} else { // 이메일 전송, loginform으로 이동
			EmailVO e = new EmailVO();

			String receiver = email; // Receiver.

			String subject = "비밀번호가 최기화 되었습니다.";

			String content = "초기화된 비밀번호는 " + nwPw + "입니다.";

			e.setReceiver(receiver);
			e.setSubject(subject);
			e.setContent(content);

			try {
				// emailService.sendMail(e);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		return "skw/member/loginform";
	}

	private String createNewPassword() {
		char[] chars = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g',
				'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };

		StringBuffer stringBuffer = new StringBuffer();
		SecureRandom secureRandom = new SecureRandom();
		secureRandom.setSeed(new Date().getTime());

		int index = 0;
		int length = chars.length;
		for (int i = 0; i < 8; i++) {
			index = secureRandom.nextInt(length);

			if (index % 2 == 0) {
				stringBuffer.append(String.valueOf(chars[index]).toUpperCase());
			} else {
				stringBuffer.append(String.valueOf(chars[index]).toLowerCase());
			}
		}

		System.out.println("newPASSWORD : " + stringBuffer.toString());

		return stringBuffer.toString();
	}

	@GetMapping("/insert")
	public String joinform() {
		return "skw/member/joinform";
	}

	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) {
		String checkid = service.idCheck(id);
		return checkid; // text
	}

	@PostMapping("/insert")
	public String insert(@Validated MemberDto dto) {
		service.insertMem(dto);
		return "redirect:loginform";
	}

	@GetMapping("/loginform")
	public String loginform() {
		return "skw/member/loginform";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute("command") @Validated LoginDto dto, BindingResult error, Model m,
			@RequestParam("type") int type) {
		System.out.println("dto="+dto);
		System.out.println(type);

		if (type == 0) {// 일반회원
			MemberDto resultDto = service.login(dto);
			if (resultDto == null) {
				error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림");
				return "skw/member/loginform";
			} else {// 로그인 성공
				m.addAttribute("user", resultDto);// 세션에 저장
				System.out.println(resultDto);
			}
		} else if (type == 1) {// 기업회원
			Corporation_MemberDto resultDto = cservice.corlogin(dto);
			System.out.println(dto);
			if (resultDto == null) {
				error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림");
				return "skw/member/loginform";
			} else {// 로그인 성공
				m.addAttribute("user", resultDto);
				System.out.println(resultDto);
			}
		}

		return "redirect:/main";
	}

	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/main";
	}

	/*
	 * @GetMapping("/update") public String updateform() { return
	 * "skw/member/updateform"; }
	 */

	/*
	 * @PutMapping("/update") public String update(@ModelAttribute("user") MemberDto
	 * dto) { service.updateMem(dto); return "redirect:/main"; }
	 */

	@GetMapping("/delete")
	public String deleteform(@RequestParam(value = "result", required = false) String result, Model m) {
		m.addAttribute("result", result);
		return "skw/member/deleteform";
	}

	@DeleteMapping("/delete")
	public String delete(@RequestParam(value = "formpw", required = false) String formpw,
			@ModelAttribute("user") MemberDto dto, SessionStatus status) {

		int i = service.deleteMem(formpw, dto);
		if (i == 0) {
			return "redirect:/delete?result=false";
		} else {
			status.setComplete();
			return "redirect:/main";
		}
	}

	@RequestMapping("/mainlogin")
	public String main(@ModelAttribute("user") MemberDto dto) {
		if (dto.getId() != null) {
			return "member/main";
		} else {
			return "skw/member/loginform";
		}
	}
}