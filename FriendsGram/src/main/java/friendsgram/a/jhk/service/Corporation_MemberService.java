package friendsgram.a.jhk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.dao.Corporation_MemberDao;
import friendsgram.member.dto.Corporation_MemberDto;

@Service
public class Corporation_MemberService {

	@Autowired
	Corporation_MemberDao dao;
	
	public int updateConsent(int searchn, String id) {
		return dao.updateConsent(searchn, id);
	}
	
	public Corporation_MemberDto oneCompany(String id) {
		return dao.oneCompany(id);
	}
	
	public List<Corporation_MemberDto> selectCompany(int searchn, String company){
		return dao.selectCompany(searchn, company);
	}
	
}
