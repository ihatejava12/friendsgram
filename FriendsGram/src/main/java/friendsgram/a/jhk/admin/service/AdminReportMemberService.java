package friendsgram.a.jhk.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.admin.dao.AdminReportMemberDao;
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
	
	public List<MemberDto> memberList(int searchn, String search, int start) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.memberList(m);
	}
	
	public int memberCount(int searchn, String search) {
		return dao.memberCount(searchn, search);
	}

}
