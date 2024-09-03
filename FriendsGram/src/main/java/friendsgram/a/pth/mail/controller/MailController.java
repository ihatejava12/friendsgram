package friendsgram.a.pth.mail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.pth.mail.service.MailService;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.mailham.dto.MailhamDto;
import friendsgram.member.dto.Corporation_MemberDto;
import friendsgram.member.dto.MemberDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@SessionAttributes("user")
@Controller
public class MailController {
	
	@Autowired
	MailService mailservice;
	
	
	@GetMapping("/mail")
	public String mailhamOpen(@RequestParam(name="p", defaultValue="1")int page,Model m
			, @ModelAttribute("user") Object member ) {
		
		String id = null;
		if( member instanceof MemberDto ) {
			MemberDto m_member = (MemberDto)member;
			id = m_member.getId();
		
		}else if( member instanceof Corporation_MemberDto ) {
			Corporation_MemberDto c_member = (Corporation_MemberDto)member;
			id = c_member.getId();
		}
	
		System.out.println("id:" + id);
		
		int perpage = 5; // 한페이지에 5개의 메일 보여줄거임
		int startRow = (page-1)*perpage;
		
		List<MailhamDto> maillist = mailservice.maillist(id,startRow, perpage);
		
		int count = mailservice.count(id);
		m.addAttribute("maillist",maillist);
		// 로그인한 사람 id 보내서, 해당 id가 받은 쪽지 list 가져와서 model 에 추가
		
		m.addAttribute("comentcount",count);// mail 개수 
		if(count > 0) {
			
		
			
		
			int pageNum = 5;//보여질 페이지 개수 1 2 3 4 5 <다음> 이런식으로
			int totalPages = count / perpage + (count % perpage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;//없는 페이지 번호가 나오지 않도록
			}
			 m.addAttribute("begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			System.out.println(begin);
			 System.out.println(end);
			 System.out.println(totalPages);
			 System.out.println(count);
		}// if end
		
		return "pth/mail/main";
	}
	
	
	@GetMapping("/mail/write")
	public String mailWrite() {
		
		return "pth/mail/write";
	}
	
	@GetMapping("/mail/writeTofreelancer/{id}")
	public String mailWriteTofreelancer(@PathVariable("id")String id,Model m) {
		m.addAttribute("freelancerid",id);
		
		return "pth/mail/writeTofreelancer";
	}
	
	
	
	@GetMapping("/mail/write/newmail")
	public String writeNewmail(@ModelAttribute("mail")MailhamDto mail) {
		
		mailservice.sendNewMail(mail);
		
		return "pth/mail/writeconfirm";
	}
	
	
	@GetMapping("/mail/sendlist")
	public String sendmaillist(@RequestParam(name="p", defaultValue="1")int page,Model m
			,@ModelAttribute("user") Object member) {
		
		String id = null;
		if( member instanceof MemberDto ) {
			MemberDto m_member = (MemberDto)member;
			id = m_member.getId();
		
		}else if( member instanceof Corporation_MemberDto ) {
			Corporation_MemberDto c_member = (Corporation_MemberDto)member;
			id = c_member.getId();
		}
		
		int perpage = 5; // 한페이지에 5개의 메일 보여줄거임
		int startRow = (page-1)*perpage;
		
		List<MailhamDto> maillist = mailservice.sendmaillist(id,startRow, perpage);// 5개씩 잘라서 페이징
		
		int count = mailservice.sendmail_count(id);// 보낸 메일의 총개수
		m.addAttribute("maillist",maillist);
		// 로그인한 사람 id 보내서, 해당 id가 받은 쪽지 list 가져와서 model 에 추가
		
		m.addAttribute("comentcount",count);// mail 개수 
		if(count > 0) {
			
		
			
		
			int pageNum = 5;//보여질 페이지 개수 1 2 3 4 5 <다음> 이런식으로
			int totalPages = count / perpage + (count % perpage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;//없는 페이지 번호가 나오지 않도록
			}
			 m.addAttribute("begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			System.out.println(begin);
			 System.out.println(end);
			 System.out.println(totalPages);
			 System.out.println(count);
		}// if end
		
		return "pth/mail/sendlist";
	}
	
	
	@GetMapping("/mail/content/{no}")
	public String mailContent(@PathVariable("no")int no,Model m) {
		// mail 번호 받아서, 해당 메일의 readornot 1로 업데이트 먼저
		mailservice.updateMailReadorNot(no);
		
		// mail 번호 받아와서 메일 1개 정보 꺼내와서 출력
		MailhamDto onemail = mailservice.oneMailContent(no);
		m.addAttribute("onemail",onemail);
		return "pth/mail/content";
	}
	
	@GetMapping("/mail/delete/{no}")
	@ResponseBody
	public String mailDelete(@PathVariable("no")int no) {
		int i = mailservice.mailDelete(no);
		return i+"";
	}
	
	@ResponseBody
	@PostMapping("/mail/numberofmail")
	public String numberOfNotreadMail(@RequestParam("id")String id) {
		int number = mailservice.numberOfNotreadMail(id);
		System.out.println(number);
		return number+"";
	}
	
	
	
}
