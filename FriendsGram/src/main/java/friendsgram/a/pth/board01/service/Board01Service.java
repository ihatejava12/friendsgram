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
	
	// 게시판 검색 조건 선택해서, 실제로 가져올 10개의 글 목록
	public List<Board01Dto> SearchBoard01(String skil, String category, String search, int startRow, int perpage){
		Map<String, Object> m = new HashMap<>();
		m.put("skil", skil);
		m.put("category", category);
		m.put("search", search);
		m.put("start", startRow);
		m.put("count", perpage);
		
		
		return board01dao.SearchBoard01(m);
	}
	
	
	
	
	//댓글 등록
	public int writeBoard01Coment(Board01_ComentDto coment) {
		return board01dao.writeBoard01Coment(coment);
	}
	
	
	// 가장 최신 댓글 번호 가져옴
	public int selectMaxComentNumber() {
		return board01dao.selectMaxComentNumber();
	}
	
	
	// ref 댓글 그룹번호 update
	public int updateComentRef(String id, String coment01, int c_no01) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("id", id);
		m.put("coment", coment01);
		m.put("c_no01", c_no01);
		
		
		return board01dao.updateComentRef(m);
	}
	
	
	
	
	// 댓글 번호 받아와서, 해당 댓글 DB에서 삭제
	public int deleteComent(int no) {
		return board01dao.deleteComent(no);
	}
	
	
	
	// 댓글 번호 받아와서, 해당 댓글 1개 정보 꺼내옴
	public	Board01_ComentDto selectOneComent(int no) {
		return board01dao.selectOneComent(no);
	}
	
	
	// 댓글 1개의 ref값 받아와서, 해당 ref랑 같은 댓글이 몇개 있는지
	public	int findComentRef(int ref) {
			return board01dao.findComentRef(ref);
		}
	
	
	// 삭제말고 업데이트 삭제해야하는 댓글
	public	int updateDeleteComent(int no) {
		return board01dao.updateDeleteComent(no);
	}
	
	
	// id와 댓글 고유번호 받아와서, 추천 Table에 해당 조합이 있는지 없는지 리턴
	public int trueFalseComentLike(String id, int c_no01) {
		Map<String, Object> m = new HashMap<>();	
		m.put("id", id);
		m.put("c_no01", c_no01);
		return board01dao.trueFalseComentLike(m);
	}
	
	// id와 댓글 고유번호 받아와서, 추천 Table에 추가
	public	int comentLikeConfirm(String id, int c_no01) {
		Map<String, Object> m = new HashMap<>();
		m.put("id", id);
		m.put("c_no01", c_no01);		
		return board01dao.comentLikeConfirm(m);
		}
	
	// 댓글 고유번호 받아와서, 해당 댓글의 추천 수 리턴
	public	int findComentLikeNumber(int c_no01) {
		return board01dao.findComentLikeNumber(c_no01);
	}
	
	// 댓글 고유번호 받아와서, 해당 댓글의 추천수 1 증가
	public	int addComentLikeNumber(int c_no01) {
		return board01dao.addComentLikeNumber(c_no01);
	}
	
	// 글 1개 클릭할때, 조회수 1 증가
	public	int checkOnedayRead(int no, String id, String clickdate) {
		Map<String, Object> m = new HashMap<>();
		m.put("id", id);
		m.put("no", no);
		m.put("clickdate", clickdate);
		return board01dao.checkOnedayRead(m);
	}
	
	// 글 1개 클릭시, 조건 만족했을 경우 조회수 +1 
	public	int addReadCount(int no) {
		return board01dao.addReadCount(no);
	}
	
	// 글 1개 클릭시, 조건 만족했을 경우, board01_readcount table에 record추가
	public	int insertReadCountTable(int no, String id, String clickdate) {
		Map<String, Object> m = new HashMap<>();
		m.put("id", id);
		m.put("no", no);
		m.put("clickdate", clickdate);
		return board01dao.insertReadCountTable(m);
	}
	
	
	
	
	
	
}
