package friendsgram.a.jhk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.jhk.service.Corporation_MemberService;
import friendsgram.member.dto.Corporation_MemberDto;

@Controller
public class AdminCompanyController {

	@Autowired
	Corporation_MemberService service;
	
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
	public String companyConsent(@RequestParam(value="searchn", defaultValue ="3", required = false) int searchn, @RequestParam("company") String company, Model m) {
		System.out.println(searchn);
		List<Corporation_MemberDto> comlist = service.selectCompany(searchn, company);
		m.addAttribute("comlist", comlist);
		
		return "/jhk/company/companylist";
	}
	
}
