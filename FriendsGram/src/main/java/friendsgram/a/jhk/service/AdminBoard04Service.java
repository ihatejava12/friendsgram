package friendsgram.a.jhk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.dao.AdminBoard04Dao;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board04.dto.Board04Dto;

@Service
public class AdminBoard04Service {

	@Autowired
	AdminBoard04Dao dao;
	
	public int deleteOneBoard04(int b_no04) {
		return dao.deleteOneBoard04(b_no04);
	}
	
	public Board04Dto oneBoard04(int b_no04){
		return dao.oneBoard04(b_no04);
	}
	
	public List<Board04Dto> findBoard04(int searchn, String search, int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.findBoard04(m);
	}
	
	public int countBoard04(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countBoard04(m);
	}
	
	public int deleteBoard04(List<Integer> list) {
		return dao.deleteBoard04(list);
	}
	
}
