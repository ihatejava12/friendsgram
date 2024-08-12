package friendsgram.a.jhk.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.admin.dao.AdminRatingDao;
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
	
	public List<MemberDto> adminList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.adminList(m);
	}
	
	public int count() {
		return dao.count();
	}
	
}
