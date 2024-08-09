package friendsgram.a.jhk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.member.dto.MemberDto;

@Mapper
public interface ReportMemberDao {
	
	@Update("update member set r_consent = #{searchn}, sanction = #{reportn} where id = #{id}")
	int updateReport(@Param("searchn") int searchn, @Param("reportn") int reportn, @Param("id") String id);
	
	@Select("select * from member where id = #{id}")
	MemberDto oneMember(String id);
	
	@Select({"<script>",
				"select * from member ",
					"<where>",
						"<choose>",
							"<when test=\"searchn == 1\"> id like concat('%',#{search},'%') </when>",
		      				"<when test=\"searchn == 2\"> name like concat('%',#{search},'%') </when>",
						"</choose>",
					"</where>",
			 "</script>"})
	List<MemberDto> memberList(@Param("searchn") int searchn, @Param("search") String search);
	
	/*
	 * @Select("select * from member") List<MemberDto> memberList();
	 */
	
}
