package friendsgram.a.pth.board03.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import friendsgram.board01.dto.Board01Dto;
import friendsgram.board03.dto.Board03Dto;
import friendsgram.board03.dto.Board03_SkilDto;

@Mapper
public interface Board03Dao {

	
	int countFreelancer();
	
	
	int newFreelancer(Board03Dto freelancer);
	
	int b_no03_skil(Map<String,Object> m);
	
	List<Board03Dto> board03List(Map<String, Object> m);
	
	
	List<Board03_SkilDto> skilList();
	
	Board03Dto selectOne(int no);
	
	List<Board03Dto> searchBoard03List(Map<String,Object> m);
	
	int countsearchBoard03List(Map<String,Object> m);
	
	
	
	
	List<Integer> searchBoard03SkilList(String skil);
	
}
