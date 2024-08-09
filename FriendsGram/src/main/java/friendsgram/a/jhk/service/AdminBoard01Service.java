package friendsgram.a.jhk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.dao.AdminBoard01Dao;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board01.dto.Board01_ComentDto;

@Service
public class AdminBoard01Service {

	@Autowired
	AdminBoard01Dao dao;
	
	public int deleteOneBoard01(int b_no01) {
		return dao.deleteOneBoard01(b_no01);
	}
	
	public Board01Dto oneBoard01(int b_no01){
		return dao.oneBoard01(b_no01);
	}
	
	public List<Board01_ComentDto> oneComent(int b_no01) {
		return dao.oneComent01(b_no01);
	}
	
	public List<Board01Dto> findBoard01(int searchn, String search, int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.findBoard01(m);
	}
	
	public int countBoard01(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countBoard01(m);
	}
	
	public int deleteBoard01(List<Integer> list) {
		return dao.deleteBoard01(list);
	}
	
}
