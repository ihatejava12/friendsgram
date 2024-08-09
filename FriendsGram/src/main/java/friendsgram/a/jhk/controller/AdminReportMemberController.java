package friendsgram.a.jhk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.jhk.service.AdminReportMemberService;
import friendsgram.member.dto.MemberDto;

@Controller
public class AdminReportMemberController {
	
	@Autowired
	AdminReportMemberService reservice;
	
	@PostMapping("/updateReport")
	public String updateReport(@RequestParam("searchn") int searchn,@RequestParam("reportn") int reportn, @RequestParam("id") String id) {
		reservice.updateReport(searchn, reportn, id);
		return "";
	}
	
	@GetMapping("/adminpage/membrcontent/{id}")
	public String memberContent(@PathVariable("id") String id, Model m) {
		MemberDto memlist = reservice.oneMember(id);
		m.addAttribute("memlist", memlist);
		
		return "/jhk/member/membercontent";
	}
	
	@GetMapping("/adminpage/memberlist")
	public String memberList(@RequestParam(value="searchn", defaultValue ="0", required = false) int searchn, @RequestParam(value="search", defaultValue ="", required = false) String search, Model m) {
		List<MemberDto> mlist = reservice.memberList(searchn, search);
		m.addAttribute("mlist", mlist);
		
		return "/jhk/member/memberlist";
	}
	
}
