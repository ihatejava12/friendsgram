package friendsgram.a.jhk.membercontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.jhk.board02.service.Board02Service;
import friendsgram.a.jhk.memberservice.ReviewService;
import friendsgram.admin.dto.ReportDto;
import friendsgram.board02.dto.Board02_TeamDto;
import friendsgram.member.dto.MemberDto;
import friendsgram.member.dto.Member_ReviewDto;

@SessionAttributes("user")
@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	@Autowired
	Board02Service bservice;
	
	@GetMapping("/viewreview/{id}")
	public String viewReview(@PathVariable("id") String subjects, Model m) {
		List<Member_ReviewDto> rto = service.reviewList(subjects);
		if(rto.isEmpty()) {
		
			return "/jhk/review/list1";

		} else {
			m.addAttribute("relist", rto);
			m.addAttribute("subjects", subjects);
			int star = service.avgScore(subjects);
			m.addAttribute("star", star);
			
			return "/jhk/review/list";
		}
	}
	
	@PostMapping("/insertreview")
	public String insertReview(Member_ReviewDto dto) {
		service.insertReview(dto);
		
		return "jhk/board02/close";
	}
	
	@GetMapping("/writereview/{id}/{b_no02}")
	public String writeReview(@PathVariable("id") String subjects, @PathVariable("b_no02") int b_no02, Model m) {
		m.addAttribute("subjects", subjects);
		m.addAttribute("b_no02", b_no02);
		
		return "/jhk/review/writereview";
	}
	
	@PostMapping("/review/report")
	public String badReview(ReportDto dto) {
		bservice.board02Report(dto);
		
		return "/jhk/board02/close";
	}
	
	@GetMapping("/reportreview/{mr_no}")
	public String reportReview(@PathVariable("mr_no") int mr_no, Model m) {
		m.addAttribute("review", service.oneReview(mr_no));
		
		return "/jhk/review/reportpage";
	}
	
	@GetMapping("/reviewpage")
	public String reviewList(@ModelAttribute("user") MemberDto dto, Model m) {
		
		return "";
	}
	
	@GetMapping("/memlist")
	public String memList(@ModelAttribute("user") MemberDto dto, Model m) {
		List<Board02_TeamDto> d = service.teamList(dto.getId());
		m.addAttribute("memlist", d);
		
		return "";
	}
	
}
