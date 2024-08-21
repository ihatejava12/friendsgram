package friendsgram.a.skw.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.skw.dao.Board04Dao;
import friendsgram.board04.dto.Board04Dto;

@Service
public class Board04Service {
	@Autowired
	Board04Dao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List<Board04Dto> boardList(int start){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		
		return dao.boardList(m);
	}
	
	public int write(Board04Dto dto) {
		return dao.write(dto);
	}
	public Board04Dto boardOne(int b_no04) {
		
		return dao.boardOne(b_no04);
	}
	public int updateBoard(Board04Dto dto) {
		return dao.updateBoard(dto);
	}
	public int deleteBoard(int b_no04) {
		return dao.deleteBoard(b_no04);
	}
	
	public List<Board04Dto> boardListSearch(int searchn, String search, int start, int perPage){
		Map<String, Object> m = new HashMap<String, Object>();
		
		m.put("searchn", searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", perPage);
		return dao.boardListSearch(m);
	}
	public int countSearch(int searchn, String search) {
		//System.out.println(searchn+search);
		Map<String, Object> m = new HashMap<String, Object>();
		
		m.put("searchn", searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
}   