package friendsgram.a.pth.board03.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.pth.board03.dao.Board03Dao;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board03.dto.Board03Dto;
import friendsgram.board03.dto.Board03PortfolioDto;
import friendsgram.board03.dto.Board03_SkilDto;

@Service
public class Board03Service {

	@Autowired
	Board03Dao board03dao;
	
	
	public int countFreelancer() {
		
		return board03dao.countFreelancer();
	}
	
	
	
	public int newFreelancer(Board03Dto freelancer) {
		return board03dao.newFreelancer(freelancer);
	}

	
	public int b_no03_skil(int b_no03,String skil) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("b_no03", b_no03);
		m.put("skil", skil);
		
		
		return board03dao.b_no03_skil(m);
	}
	
	
	
	public List<Board03Dto> board03List(int start, int perpage){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count",perpage);
		
		
		return board03dao.board03List(m);
	}
	

	public List<Board03_SkilDto> skilList(){
		return board03dao.skilList();
				
	}
	
	
	public Board03Dto selectOne(int no) {
		return board03dao.selectOne(no);
	}

	
	public List<Board03Dto> searchBoard03List(int work_type,List<Integer> searchb_no03List, int career, int startRow,
			int perpage){
		Map<String, Object> m = new HashMap<String,Object>();
		if(searchb_no03List.size() == 0) {
			searchb_no03List.add(-1);
		}
		m.put("work_type", work_type);
		m.put("searchb_no03List", searchb_no03List);
		m.put("career", career);
		m.put("start",startRow);
		m.put("count", perpage);
		
		return board03dao.searchBoard03List(m);
	}

	
	public int countsearchBoard03List(int work_type,List<Integer> searchb_no03List, int career){
		Map<String, Object> m = new HashMap<String,Object>();
		if(searchb_no03List.size() == 0) {
			searchb_no03List.add(-1);
		}
		m.put("work_type", work_type);
		m.put("searchb_no03List", searchb_no03List);
		m.put("career", career);

		
		return board03dao.countsearchBoard03List(m);
	}
	
	
	
	
	
	public List<Integer> searchBoard03SkilList(String skil){
		return board03dao.searchBoard03SkilList(skil);
	}
	
	
	// portfolio 파일 Dto 받아와서 DB에 저장
	public	int portfolioFileInsert(Board03PortfolioDto portfolio) {
		return board03dao.portfolioFileInsert(portfolio);
	}
	
	// path 받아와서 board03portfolio 객체 하나 받아옴
	public	Board03PortfolioDto fileOneportfolio(String path) {
		return board03dao.fileOneportfolio(path);
	}
	
	// 지금 가장 마지막 프리랜서 번호 1개 가져옴
	public	int maxFreelancerNumber() {
		return board03dao.maxFreelancerNumber();
	}
	
	
	
	
}
