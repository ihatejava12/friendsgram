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
	
	
	List<Board01Dto> SearchBoard01(Map<String, Object> m);
	
	
	
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
	
	
	// id와 댓글 고유번호 받아와서, 추천 Table에 해당 조합이 있는지 없는지 리턴
	int trueFalseComentLike(Map<String,Object> m);
	
	// id와 댓글 고유번호 받아와서, 추천 Table에 추가
	int comentLikeConfirm(Map<String,Object> m);
	
	// 댓글 고유번호 받아와서, 해당 댓글의 추천 수 리턴
	int findComentLikeNumber(int c_no01);
	
	// 댓글 고유번호 받아와서, 해당 댓글의 추천수 1 증가
	int addComentLikeNumber(int c_no01);
	
	// 글 1개 클릭할때, id, 글번호, clickdate 세개 받아와서, 해당 record가 있는지 없는지 확인
	int checkOnedayRead(Map<String, Object> m);
	
	// 글 1개 클릭시, 조건 만족했을 경우 조회수 +1 
	int addReadCount(int no);
	
	// 글 1개 클릭시, 조건 만족했을 경우, board01_readcount table에 record추가
	int insertReadCountTable(Map<String, Object> m);
	
	
	// id 받아와서, 해당 id가 쓴 글의 총 개수 
	int countMyarticleboard01(String id);
	
	// id 받아와서, 해당 id가 쓴 글, perpage 개수만큼만 list로 리턴
	List<Board01Dto> listMyarticleboard01(Map<String,Object> m);
	
	
	// id 받아와서, 내가 쓴 댓글이 1개라도 있는, 글번호(b_no01) 의 개수를 리턴
	int numberofarticleHavingmyComent(String id);
	
	// id 받아와서, 내가 쓴 댓글이 1개라도 있는, 글번호(b_no01) 의 list 를 리턴
	List<Integer> listofArticleHavingmyComent(String id);
	
	// 내가쓴 댓글이 있는 글번호(b_no01) list 받아와서, board01Dto list 리턴
	List<Board01Dto> board01listOfArticleHavingmyComent(Map<String,Object> m);
	
	// 게시글 글번호(b_no01) 받아와서 해당 글 1개, DB에서 삭제
	int deleteBoard01Article(int no);
	
	
}
