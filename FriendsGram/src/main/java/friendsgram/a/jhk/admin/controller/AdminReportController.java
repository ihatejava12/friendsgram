package friendsgram.a.jhk.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.jhk.admin.service.AdminReportService;
import friendsgram.admin.dto.NoticeDto;
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
			} else if (num == 2) {
				ReportDto R = service.selectR(report_num);
				m.addAttribute("R", R);
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
	public String reportList(@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		
		int count = service.reportCount();
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		
		List<ReportDto> rlist = service.reportList(startRow);
		m.addAttribute("rlist", rlist);
		
		int pageNum = 9;
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
		
		return "/jhk/report/reportlist";
	}

}
