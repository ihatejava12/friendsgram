package friendsgram.a.jhk.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.admin.dao.AdminReportDao;
import friendsgram.admin.dto.ReportDto;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board01.dto.Board01_ComentDto;
import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_ComentDto;

@Service
public class AdminReportService {
	
	@Autowired
	AdminReportDao dao;
	
	public ReportDto selectR(int report_num) {
		return dao.selectR(report_num);
	}
	
	public ReportDto selectBC2(int report_num) {
		return dao.selectBC2(report_num);
	}
	
	public ReportDto selectBC1(int report_num) {
		return dao.selectBC1(report_num);
	}
	
	public ReportDto selectB2(int report_num) {
		return dao.selectB2(report_num);
	}
	
	public ReportDto selectB1(int report_num) {
		return dao.selectB1(report_num);
	}
	
	public List<ReportDto> reportList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 9);
		return dao.reportList(m);
	}
	
	public int reportCount() {
		return dao.reportCount();
	}

}
