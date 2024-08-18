package friendsgram.a.jhk.board02.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.board02.dto.Board02_ComentDto;

@Mapper
public interface Board02CommDao {
	
	// 부모댓글 작성 (ref를 비워뒀다가 해당 댓글에 대댓글이 달릴때 해당 댓글의 번호로 업데이트 해줄 예정)
	@Insert("insert into board02_coment (coment, date, ref_level, num, id, b_no02) values (#{coment}, now(), 0, 1, #{id}, #{b_no02})")
	int insertPComm(Map<String, Object> m);
	
	// 댓글 모두 출력
	@Select("select * from board02_coment where b_no02 = #{b_no02} order by ref desc")
	List<Board02_ComentDto> selectComm(int b_no02);
	
}
