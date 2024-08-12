package friendsgram.a.jhk.board03.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.board03.dao.Board02Dao;
import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_CodeDto;

@Service
public class Board02Service {

	@Autowired
	Board02Dao dao;
	
	public int maxNum() {
		return dao.maxNum();
	}
	
	public int selectNum() {
		return dao.selectNum();
	}
	
	public int insertTeam(String id, int b_no02) {
		return dao.insertTeam(id, b_no02);
	}
	
	public int countTeam(int b_no02) {
		return dao.countTeam(b_no02);
	}
	
	public int writeBoard02(String title, String join_date, String content, int volunteer, String id) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("b_no02", dao.maxNum());
		m.put("title", title);
		m.put("join_date", join_date);
		m.put("content", content);
		m.put("volunteer", volunteer);
		m.put("id", id);
		System.out.println(dao.maxNum());
		return dao.writeBoard(m);
	}
	
	// 새글에 추가한 코드 리스트
	public List<Board02_CodeDto> codeList(int b_no02){
		return dao.codeList(b_no02);
	}
	
	public List<Board02Dto> board03List(){
		return dao.board03List();
	}
	
	public int deleteAllCode(int b_no02) {
		return dao.deleteAllCode(b_no02);
	}
	
	public int insertCode(String code, int b_no02) {
		return dao.insertCode(code, b_no02);
	}
	
}
