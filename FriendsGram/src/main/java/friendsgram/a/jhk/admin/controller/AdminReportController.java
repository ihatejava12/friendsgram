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
	
	@GetMapping("/adminreportboard/{num}/{co_no}/{report_num}")
	public String adminReportoBoard01(@PathVariable("num") int num, @PathVariable(name="co_no", required = false) int co_no, @PathVariable("report_num") int report_num, Model m) {
		if(co_no == 0) {
			if(num == 0) {
				ReportDto b1 = service.selectB1(report_num);
				m.addAttribute("b1", b1);
			} else if (num == 1) {
				ReportDto b2 = service.selectB2(report_num);
				m.addAttribute("b2", b2);
			}
		} else if (co_no != 0){
			if(num == 0) {
				ReportDto bc1 = service.selectBC1(report_num);
				m.addAttribute("bc1", bc1);
			} else if (num == 1) {
				ReportDto bc2 = service.selectBC2(report_num);
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
