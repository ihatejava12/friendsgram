package friendsgram.a.jhk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.dao.AdminBoard02Dao;
import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_ComentDto;

@Service
public class AdminBoard02Service {

	@Autowired
	AdminBoard02Dao dao;
	
	public int deleteOneBoard02(int b_no02) {
		return dao.deleteOneBoard02(b_no02);
	}
	
	public Board02Dto oneBoard02(int b_no02){
		return dao.oneBoard02(b_no02);
	}
	
	public List<Board02_ComentDto> oneComent(int b_no02) {
		return dao.oneComent02(b_no02);
	}
	
	public List<Board02Dto> findBoard02(int searchn, String search, int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.findBoard02(m);
	}
	
	public int countBoard02(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countBoard02(m);
	}
	
	public int deleteBoard02(List<Integer> list) {
		return dao.deleteBoard02(list);
	}
	
	
}
