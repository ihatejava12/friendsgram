package friendsgram.a.jhk.board02.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.hibernate.validator.constraints.ParameterScriptAssert;

import friendsgram.board02.dto.Board02_ComentDto;

@Mapper
public interface Board02CommDao {
	
	// 자식 댓글 추가하기
	@Insert("insert into board02_coment (coment, date, ref, ref_level, num, id, b_no02) values (#{coment}, now(), #{ref}, 1, 1, #{id}, #{b_no02})")
	int insertComm2(@Param("coment") String coment, @Param("ref") int ref, @Param("id") String id, @Param("b_no02") int b_no02);
	
	// 신고할 댓글 정보 불러오기
	@Select("select * from board02_coment where c_no02 = #{c_no02}")
	Board02_ComentDto selectOneComm(int c_no02);
	
	// ref_level를 뽑아와 1이면 해당 댓글만 삭제하고 0이면 해당하는 댓글 전부를 삭제한다.
	@Select("select ref_level from board02_coment where c_no02 = #{c_no02}")
	int selectLevel(int c_no02);
	
	// ref_level이 0에 해당하는 댓글 삭제
	@Delete("delete from board02_coment where ref = #{ref}")
	int deleteRef(int ref);
	
	// ref_level이 1에 해당하는 댓글 삭제
	@Delete("delete from board02_coment where c_no02 = #{c_no02}")
	int deleteComm02(int c_no02);
	
	// ref를 해당 글번호로 업데이트해준다
	@Update("update board02_coment set ref = c_no02")
	int updateRef();
	
	// 부모댓글 작성 (ref를 비워뒀다가 해당 댓글에 대댓글이 달릴때 해당 댓글의 번호로 업데이트 해줄 예정)
	@Insert("insert into board02_coment (coment, date, ref_level, num, id, b_no02) values (#{coment}, now(), 0, 1, #{id}, #{b_no02})")
	int insertPComm(Map<String, Object> m);
	
	// 해당 게시글 댓글 모두 출력
	@Select("select * from board02_coment where b_no02 = #{b_no02} order by ref desc")
	List<Board02_ComentDto> selectComm(int b_no02);
	
}
