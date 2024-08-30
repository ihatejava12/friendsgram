package friendsgram.a.jhk.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.admin.dao.AdminCorporation_MemberDao;
import friendsgram.member.dto.Corporation_MemberDto;

@Service
public class AdminCorporation_MemberService {

	@Autowired
	AdminCorporation_MemberDao dao;
	
	public int updateConsent(int searchn, String id) {
		return dao.updateConsent(searchn, id);
	}
	
	public Corporation_MemberDto oneCompany(String id) {
		return dao.oneCompany(id);
	}
	
	public List<Corporation_MemberDto> selectCompany(int searchn, String company, int start){
		System.out.println("company="+company);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("company", company);
		m.put("start", start);
		m.put("count", 10);
		return dao.selectCompany(m);
	}
	
	public int countCompany(int searchn, String company) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("company", company);
		return dao.countCompany(m);
	}
	
}
