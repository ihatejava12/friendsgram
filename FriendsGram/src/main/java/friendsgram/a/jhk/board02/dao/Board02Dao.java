package friendsgram.a.jhk.board02.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.admin.dto.ReportDto;
import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_CodeDto;
import friendsgram.board02.dto.Board02_JoinDto;

@Mapper
public interface Board02Dao {
	
	// 코드 DB에 저장하기
	@Insert("insert into board02_code values (#{code}, #{b_no02})")
	int insertCode(@Param("code") String code, @Param("b_no02") int b_no02);
	
	// 신고
	@Insert("insert into report (report_content, r_no, num, id, co_no) values (#{report_content}, #{r_no}, #{num}, #{id}, #{co_no})")
	int board02Report(ReportDto dto);
	
	// 글 삭제
	@Delete("delete from board02 where b_no02 = #{b_no02}")
	int deleteContent(int b_no02);
	
	// 해당 팀의 현 인원을 체크해준다.
	@Select("select count(*) from board02_join where b_no02 = #{b_no02}")
	int countTeam(int b_no02);
	
	// 팀 확정
	@Insert("insert into board02_team values (#{id}, #{b_no02})")
	int makeTeam(@Param("id") String id, @Param("b_no02") int b_no02);
	
	// 작성자가 글을 올렸을때 작성자가 바로 db에 저장된다.
	// 작성자의 글에 사람들이 신청을 했을 때 작성자가 고른 사람들도 db에 올려 팀 매치를 성사시켜준다.
	@Insert("insert into board02_team values (#{id}, #{b_no02})")
	int insertTeam(@Param("id") String id, @Param("b_no02") int b_no02);
	
	// 신청자들 리스트를 뽑아온다
	@Select("select * from board02_join where b_no02 = #{b_no02} order by code")
	List<Board02_JoinDto> teamList(int b_no02);
	
	// 해당글에 신청한 아이디들을 뽑아온다.
	@Select("select count(*) from board02_join where b_no02 = #{b_no02} and id = #{id}")
	int countJoin(@Param("b_no02") int b_no02, @Param("id") String id);
	
	// 신청 버튼을 눌렀을때 신청자 대기테이블에 저장되게 한다.
	@Insert("insert into board02_join (date, request, id, b_no02, code) values (now(), 0, #{id}, #{b_no02}, #{code})")
	int joinTeam(@Param("id") String id, @Param("b_no02") int b_no02, @Param("code") String code);

	// 00시가 되었을 때 현재 날짜보다 모집 기간 날짜 값이 작다면 모집 상태를 자동으로 변경해준다.
	@Update("update board02 set join01 = 1 where now() > join_date and join01 = 0")
	int updateJoin01();

	// 게시글 수정을 해준다.
	@Update("update board02 set title = #{title}, join_date = #{join_date}, content = #{content}, join01 = #{join01}, volunteer = #{volunteer} where b_no02 = #{b_no02}")
	int update(Board02Dto dto);

	// 해당 게시글 하나를 보여준다.
	@Select("select * from board02 where b_no02 = #{b_no02}")
	Board02Dto board02Content(int b_no02);

	// 추가되면 나오는 코드 리스트
	@Select("select * from board02_code where b_no02 = #{b_no02}")
	List<Board02_CodeDto> codeList(int b_no02);

	// 새로운 글을 작성했을 때 글을 올리게 해주는 SQL문이다.
	@Insert("insert into board02 (b_no02, title, join_date, content, date, join01, volunteer, id) values (#{b_no02}, #{title}, #{join_date}, #{content}, now(), 0, #{volunteer}, #{id})")
	int writeBoard(Map<String, Object> m);

	// 올라와 있는 글들을 모두 뽑아와 보여주는 SQL문이다.
	@Select("select * from board02 order by join01, b_no02 desc")
	List<Board02Dto> board03List();

	// 검색한 결과값 페이징.
	@Select({"<script>", 
				"select * from board02",
					"<where>",
						"<choose>",
							"<when test=\"searchn == 1\"> id = #{search} </when>",
							"<when test=\"searchn == 2\"> join_date &lt;= #{search} </when>",
							"<when test=\"searchn == 3\"> b_no02 in (select b_no02 from board02_code where code = #{search}) </when>",
						"</choose>",
					"</where>",
				"order by join01, b_no02 desc limit #{start}, #{count}",
			 "</script>"})
	List<Board02Dto> board02List(Map<String, Object> m);
	
	@Select({"<script>", 
		"select count(*) from board02",
			"<where>",
				"<choose>",
					"<when test=\"searchn == 1\"> id = #{search} </when>",
					"<when test=\"searchn == 2\"> join_date &lt;= #{search} </when>",
					"<when test=\"searchn == 3\"> b_no02 in (select b_no02 from board02_code where code = #{search}) </when>",
				"</choose>",
			"</where>",
	 "</script>"})
	int board02Count(Map<String, Object> m);

	// 작성하고 있는 게시글은 아직 b_no02가 지정이 안되어 있기 때문에 코드 리스트에 저장할때 필요한 b_no02를 뽑을 수 없어 미리
	// b_no02를 뽑아놔 사용한다.
	// 아직 작성되진 않았지만 작성될 최신 글번호이다.
	@Select("select max(b_no02)+1 from board02")
	int maxNum();

}
