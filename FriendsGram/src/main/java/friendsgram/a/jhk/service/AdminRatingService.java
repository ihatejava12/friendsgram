package friendsgram.a.jhk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.dao.AdminRatingDao;
import friendsgram.member.dto.MemberDto;

@Service
public class AdminRatingService {

	@Autowired
	AdminRatingDao dao;
	
	public int updateRating(int role, String id) {
		return dao.updateRating(role, id);
	}
	
	public MemberDto adminContent(String id) {
		return dao.adminContent(id);
	}
	
	public List<MemberDto> adminList(){
		return dao.adminList();
	}
	
}
