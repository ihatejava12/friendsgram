package friendsgram.a.jhk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.dao.Board03Dao;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board03.dto.Board03Dto;

@Service
public class Board03Service {
	
	@Autowired
	Board03Dao dao;
	
	public int deleteOneBoard03(int b_no03) {
		return dao.deleteOneBoard03(b_no03);
	}
	
	public Board03Dto oneBoard03(int b_no03){
		return dao.oneBoard03(b_no03);
	}
	
	public List<Board03Dto> findBoard03(int searchn, String search, int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.findBoard03(m);
	}
	
	public int countBoard03(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countBoard03(m);
	}
	
	public int deleteBoard03(List<Integer> list) {
		return dao.deleteBoard03(list);
	}
	
}
