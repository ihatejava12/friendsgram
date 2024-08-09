package friendsgram.a.jhk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.dao.AdminReportMemberDao;
import friendsgram.member.dto.MemberDto;

@Service
public class AdminReportMemberService {
	
	@Autowired
	AdminReportMemberDao dao;
	
	public int updateReport(int searchn, int reportn, String id) {
		return dao.updateReport(searchn, reportn, id);
	}
	
	public MemberDto oneMember(String id) {
		return dao.oneMember(id);
	}
	
	public List<MemberDto> memberList(int searchn, String search) {
		return dao.memberList(searchn, search);
	}

}
