package friendsgram.a.skw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.skw.dao.CorporationDao;
import friendsgram.member.dto.Corporation_MemberDto;
import friendsgram.member.dto.LoginDto;

@Service
public class CorporationService {
	@Autowired
	CorporationDao dao;
	
	public int updatePw(Corporation_MemberDto dto, String nwPw) {
		return dao.updateCorPw(dto.getId(), dto.getName(), nwPw);
	}
	public String coridCheck(String id) {
		return dao.coridCheck(id);
	}
	public int insertCor(Corporation_MemberDto dto) {
		return dao.insertCor(dto);
	}
	public Corporation_MemberDto corlogin(LoginDto dto) {
		return dao.corlogin(dto);
	}
	public int updateCor(Corporation_MemberDto dto) {
		return dao.updateCor(dto);
	}
	public int deleteCor(String formpw, Corporation_MemberDto dto ) {
		String pw = dto.getPassword();
		if(pw.equals(formpw)) {
			return dao.deleteCor(dto.getId());
		}else {
			return 0;
		}
	}
	public List<Corporation_MemberDto> corsInfo(){
		return dao.corsInfo();
	}
}

