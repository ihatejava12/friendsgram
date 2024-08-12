package friendsgram.a.jhk.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.jhk.admin.service.AdminCorporation_MemberService;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.member.dto.Corporation_MemberDto;

@Controller
public class AdminCompanyController {

	@Autowired
	AdminCorporation_MemberService service;
	
	@PostMapping("/updateconsent")
	public String updateConsent(@RequestParam("searchn") int searchn, @RequestParam("id") String id) {
		service.updateConsent(searchn, id);
		return "";
	}
	
	@GetMapping("/adminpage/contentc/{id}")
	public String companyContent(@PathVariable("id") String id, Model m) {
		Corporation_MemberDto clist = service.oneCompany(id);
		m.addAttribute("clist", clist);
		return "/jhk/company/companycontent";
	}
	
	@GetMapping("/adminpage/consent")
	public String companyConsent(@RequestParam(value="searchn", defaultValue ="3", required = false) int searchn, @RequestParam(value="company", defaultValue="", required=false) String company, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countCompany(searchn,company);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<Corporation_MemberDto> comlist = service.selectCompany(searchn, company, startRow);
		m.addAttribute("comlist", comlist);
		
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
		m.addAttribute("search", company);
		
		return "/jhk/company/companylist";
	}
	
}
