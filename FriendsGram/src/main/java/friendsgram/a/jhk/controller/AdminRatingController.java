package friendsgram.a.jhk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.jhk.service.AdminRatingService;
import friendsgram.member.dto.MemberDto;

@Controller
public class AdminRatingController {
	
	@Autowired
	AdminRatingService aservice;
	
	@GetMapping("/updaterating")
	public String updateRating(@RequestParam("role") int role, @RequestParam("id") String id, Model m) {
		aservice.updateRating(role, id);
		
		List<MemberDto> alist = aservice.adminList();
		m.addAttribute("alist", alist);
		System.out.println(id);
		System.out.println(role);
		return "/jhk/admin/adminlist";
	}
	
	@GetMapping("/adminpage/admincontent/{id}")
	public String adminContent(@PathVariable("id") String id, Model m) {
		MemberDto aclist = aservice.adminContent(id);
		m.addAttribute("aclist", aclist);
		
		return "/jhk/admin/admincontent";
	}
	
	@GetMapping("/adminpage/adminlist")
	public String adminList(Model m) {
		List<MemberDto> alist = aservice.adminList();
		m.addAttribute("alist", alist);

		return "/jhk/admin/adminlist";
	}
	
}
