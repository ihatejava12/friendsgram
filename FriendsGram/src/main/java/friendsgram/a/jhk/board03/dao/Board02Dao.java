package friendsgram.a.jhk.board03.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_CodeDto;

@Mapper
public interface Board02Dao {
	
	// 새글 쓰기에서 클릭이벤트가 발생할때 마다 추가되는 코드들
	@Insert("insert into board02_code values (#{code}, #{b_no02})")
	int insertCode(@Param("code") String code, @Param("b_no02") int b_no02);
	
	// 추가되면 나오는 코드 리스트
	@Select("select * from board02_code where b_no02 = #{b_no02}")
	List<Board02_CodeDto> codeList(int b_no02);
	
	@Delete("delete from board02_code where b_no02 = #{b_no02}")
	int deleteAllCode(int b_no02);
	
	@Select("select b_no02 from board02")
	int selectNum();
	
	@Insert("insert into board02_team values (#{id}, #{b_no02})")
	int insertTeam(@Param("id") String id, @Param("b_no02") int b_no02);
	
	@Select("select count(*) from board02_team where b_no02 = #{b_no02}")
	int countTeam(int b_no02);
	
	@Insert("insert into board02 (b_no02, title, join_date, content, date, join01, volunteer, id) values (#{b_no02}, #{title}, #{join_date}, #{content}, now(), 0, #{volunteer}, #{id})")
	int writeBoard(Map<String, Object> m);
	
	@Select("select * from board02")
	List<Board02Dto> board03List(); 
	
	@Select("select max(b_no02)+1 from board02")
	int maxNum();
	
}
