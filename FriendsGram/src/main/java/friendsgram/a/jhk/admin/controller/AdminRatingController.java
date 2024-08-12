package friendsgram.a.jhk.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.jhk.admin.service.AdminRatingService;
import friendsgram.member.dto.MemberDto;

@Controller
public class AdminRatingController {
	
	@Autowired
	AdminRatingService aservice;
	
	@GetMapping("/updaterating")
	public String updateRating(@RequestParam("role") int role, @RequestParam("id") String id, Model m) {
		aservice.updateRating(role, id);
		
		return "redirect:/adminpage/adminlist";
	}
	
	@GetMapping("/adminpage/admincontent/{id}")
	public String adminContent(@PathVariable("id") String id, Model m) {
		MemberDto aclist = aservice.adminContent(id);
		m.addAttribute("aclist", aclist);
		
		return "/jhk/admin/admincontent";
	}
	
	@GetMapping("/adminpage/adminlist")
	public String adminList(@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = aservice.count();
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		
		List<MemberDto> alist = aservice.adminList(startRow);
		m.addAttribute("alist", alist);

		int pageNum = 10;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		
		}
		m.addAttribute("count", count);

		return "/jhk/admin/adminlist";
	}
	
}
