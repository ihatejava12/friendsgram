package friendsgram.a.jhk.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.jhk.admin.service.AdminReportMemberService;
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
	public String memberList(@RequestParam(value="searchn", defaultValue="0", required=false) int searchn, @RequestParam(value="search", defaultValue="", required=false) String search, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = reservice.memberCount(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<MemberDto> mlist = reservice.memberList(searchn, search,startRow);
		m.addAttribute("mlist", mlist);

		int pageNum = 10;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		 m.addAttribute("end", end);
		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		
		return "/jhk/member/memberlist";
	}
	
}
