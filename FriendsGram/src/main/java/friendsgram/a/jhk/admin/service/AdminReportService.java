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
	
	public Board02_ComentDto selectBC2(int b_no02, int c_no02) {
		return dao.selectBC2(b_no02, c_no02);
	}
	
	public Board01_ComentDto selectBC1(int b_no01, int c_no01) {
		return dao.selectBC1(b_no01, c_no01);
	}
	
	public Board02Dto selectB2(int b_no02) {
		return dao.selectB2(b_no02);
	}
	
	public Board01Dto selectB1(int b_no01) {
		return dao.selectB1(b_no01);
	}
	
	public List<ReportDto> reportList() {
		return dao.reportList();
	}

}
