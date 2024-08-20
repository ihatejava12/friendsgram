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
	
	
	
	// 댓글 등록
	int writeBoard01Coment(Board01_ComentDto coment);
	
	
	// 가장 최신 댓글 번호 가져옴
	int selectMaxComentNumber();
	
	
	// ref 댓글 그룹번호 update
	int updateComentRef(Map<String,Object> m);
	
	
	// 댓글 번호 받아와서, 해당 댓글 DB에서 삭제
	int deleteComent(int no);
	
	
	// 댓글 번호 받아와서, 해당 댓글 1개 정보 꺼내옴
	Board01_ComentDto selectOneComent(int no);
	
	
	// 댓글 1개의 ref값 받아와서, 해당 ref랑 같은 댓글이 몇개 있는지
	int findComentRef(int ref);
	
	
	
	// 삭제말고 업데이트 삭제해야하는 댓글
	int updateDeleteComent(int no);
	
	
}
