package friendsgram.a.jhk.admin.service;

import java.util.List;

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
	
	public List<ReportDto> reportList() {
		return dao.reportList();
	}

}
