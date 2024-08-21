package friendsgram.a.jhk.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import friendsgram.a.jhk.admin.service.AdminReportService;
import friendsgram.admin.dto.ReportDto;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board01.dto.Board01_ComentDto;
import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_ComentDto;

@Controller
public class AdminReportController {
	
	@Autowired
	AdminReportService service;
	
	@GetMapping("/adminreportboard/{num}/{r_no}/{co_no}")
	public String adminReportoBoard01(@PathVariable("num") int num, @PathVariable("r_no") int r_no, @PathVariable(name="co_no", required = false) int co_no, Model m) {
		if(co_no == 0) {
			if(num == 0) {
				Board01Dto b1 = service.selectB1(r_no);
				m.addAttribute("b1", b1);
			} else if (num == 1) {
				Board02Dto b2 = service.selectB2(r_no);
				m.addAttribute("b2", b2);
			}
		} else if (co_no != 0) {
			if(num == 0) {
				Board01_ComentDto bc1 = service.selectBC1(r_no, co_no);
				m.addAttribute("bc1", bc1);
			} else if (num == 1) {
				Board02_ComentDto bc2 = service.selectBC2(r_no, co_no);
				m.addAttribute("bc2", bc2);
			}
		}
		
		return "/jhk/report/reportcontent";
	}
	
	@GetMapping("/adminpage/reportlist")
	public String reportList(Model m) {
		List<ReportDto> rlist = service.reportList();
		m.addAttribute("rlist", rlist);
		
		return "/jhk/report/reportlist";
	}

}
