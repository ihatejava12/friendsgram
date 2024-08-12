package friendsgram.a.skw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.skw.dao.InfoDao;
import friendsgram.member.dto.Member_InfoDto;

@Service
public class InfoService {
	
	@Autowired
	InfoDao dao;
	
	public int insertInfo(Member_InfoDto dto) {
		return dao.insertInfo(dto);
	}
}
