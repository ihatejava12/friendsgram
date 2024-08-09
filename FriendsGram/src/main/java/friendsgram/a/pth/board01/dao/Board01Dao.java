package friendsgram.a.pth.board01.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import friendsgram.admin.dto.ReportDto;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board01.dto.Board01_ComentDto;

@Mapper
public interface Board01Dao {

	List<Board01Dto> board01List(Map<String, Object> m);
	int count();
	Board01Dto selectOne(int no);
	List<Board01_ComentDto> board01ComentList(int no);
	
	
	int writeBoard01(Board01Dto article);
	
	int reportboard01(ReportDto report);
	
	
	int countSearchBoard01(Map<String,Object> m);
	
}
