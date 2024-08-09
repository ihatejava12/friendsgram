package friendsgram.a.jhk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.dao.Board05Dao;
import friendsgram.board04.dto.Board04Dto;
import friendsgram.board05.dto.Board05Dto;

@Service
public class Board05Service {

	@Autowired
	Board05Dao dao;
	
	public int deleteOneBoard05(int b_no05) {
		return dao.deleteOneBoard05(b_no05);
	}
	
	public Board05Dto oneBoard05(int b_no05){
		return dao.oneBoard05(b_no05);
	}
	
	public List<Board05Dto> findBoard05(int searchn, String search, int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.findBoard05(m);
	}
	
	public int countBoard05(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countBoard05(m);
	}
	
	public int deleteBoard05(List<Integer> list) {
		return dao.deleteBoard05(list);
	}
	
}
