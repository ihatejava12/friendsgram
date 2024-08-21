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
	
	public Board02_ComentDto selectBC2(int r_no, int co_no) {
		return dao.selectBC2(r_no, co_no);
	}
	
	public Board01_ComentDto selectBC1(int r_no, int co_no) {
		return dao.selectBC1(r_no, co_no);
	}
	
	public Board02Dto selectB2(int r_no) {
		return dao.selectB2(r_no);
	}
	
	public Board01Dto selectB1(int r_no) {
		return dao.selectB1(r_no);
	}
	
	public List<ReportDto> reportList() {
		return dao.reportList();
	}

}
