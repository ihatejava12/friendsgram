package friendsgram.a.jhk.board02.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.board02.dao.Board02Dao;
import friendsgram.admin.dto.ReportDto;
import friendsgram.admin.dto.WordDto;
import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_CodeDto;
import friendsgram.board02.dto.Board02_JoinDto;
import friendsgram.board02.dto.Board02_TeamDto;

@Service
public class Board02Service {

	@Autowired
	Board02Dao dao;
	
	public List<Board02_TeamDto> teList(String id){
		return dao.teList(id);
	}
	
	public List<WordDto> wordList(){
		return dao.wordlist();
	}
	
	public int deleteCode(int b_no02) {
		return dao.deleteCdoe(b_no02);
	}
	
	public String id(int b_no02) {
		return dao.id(b_no02);
	}
	
	public String idName(String id) {
		return dao.idName(id);
	}
	
	public List<Board02_TeamDto> tList(int b_no02){
		return dao.tList(b_no02);
	}
	
	public int updateJoinstate(int b_no02) {
		return dao.updateJoinstate(b_no02);
	}
	
	public List<Board02_CodeDto> pickCode(int b_no02){
		return dao.codeList(b_no02);
	}
	
	public void insertCode(List<String> code, int b_no02) {
		for(int i = 0; i < code.size(); i ++) {
			dao.insertCode(code.get(i), b_no02);
		}
	}
	
	public int board02Report(ReportDto dto) {
		return dao.board02Report(dto);
	}
	
	public int deleteContent(int b_no02) {
		return dao.deleteContent(b_no02);
	}
	
	public int countTeam(int b_no02) {
		return dao.countTeam(b_no02);
	}
	
	public void makeTeam(List<String> list, int b_no02) {
		
		for(int i = 0; i < list.size(); i++) {
			dao.makeTeam(list.get(i), b_no02);
		}
	}
	
	public int insertTeam(String id, int b_no02) {
		return dao.insertTeam(id, b_no02);
	}
	
	public List<Board02_JoinDto> teamList(int b_no02){
		return dao.teamList(b_no02);
	}
	
	public int countJoin(int b_no02, String id) {
		return dao.countJoin(b_no02, id);
	}
	
	public int joinTeam(String id, int b_no02, String code) {
		return dao.joinTeam(id, b_no02, code);
	}
	
	@Scheduled(cron = "0 0 0 * * *")
	public void updateJoin() {
		dao.updateJoin01();
	}
	
	public int update(Board02Dto dto) {
		return dao.update(dto);
	}
	
	public Board02Dto board02Content(int b_no02) {
		return dao.board02Content(b_no02);
	}
	
	public int maxNum() {
		return dao.maxNum();
	}
	
	public int writeBoard02(String title, String join_date, String content, int volunteer, String id) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("b_no02", dao.maxNum());
		m.put("title", title);
		m.put("join_date", join_date);
		m.put("content", content);
		m.put("volunteer", volunteer);
		m.put("id", id);
		return dao.writeBoard(m);
	}
	
	// 새글에 추가한 코드 리스트
	public List<Board02_CodeDto> codeList(int b_no02){
		return dao.codeList(b_no02);
	}
	
	public List<Board02Dto> board03List(){
		return dao.board03List();
	}
	
	public List<Board02Dto> board02List(int searchn, String search, int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 13);
		return dao.board02List(m);
	}
	
	public int board02Count(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.board02Count(m);
	}

}
