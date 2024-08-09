package friendsgram.a.pth.board01.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.pth.board01.dao.Board01Dao;
import friendsgram.admin.dto.ReportDto;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board01.dto.Board01_ComentDto;

@Service
public class Board01Service {
	
	@Autowired
	Board01Dao board01dao;
	
	
	public List<Board01Dto> board01List(int start, int perpage){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count",perpage);
		
		
		return board01dao.board01List(m);
	}
	
	
	public int count() {
		return board01dao.count();
	}
	
	
	public Board01Dto selectOne(int no) {
		return board01dao.selectOne(no);
	}
	
	public List<Board01_ComentDto> board01ComentList(int no){
		
		return board01dao.board01ComentList(no);
	}
	
	// 새글 쓰기
	public int writeBoard01(Board01Dto article) {
		return board01dao.writeBoard01(article);
	}

	// board01 게시판 글 신고
	public int reportboard01(ReportDto report) {
		return board01dao.reportboard01(report);
	}
	
	
	public int countSearchBoard01(String skil, String category, String search) {
		Map<String,Object> m = new HashMap<>();
		m.put("skil", skil);
		m.put("category", category);
		m.put("search",search);
		return board01dao.countSearchBoard01(m);
	}
	
}
