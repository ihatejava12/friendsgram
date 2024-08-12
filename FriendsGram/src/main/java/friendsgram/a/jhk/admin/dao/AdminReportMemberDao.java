package friendsgram.a.jhk.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.member.dto.MemberDto;

@Mapper
public interface AdminReportMemberDao {
	
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
				"order by sanction desc limit #{start}, #{count}",
			 "</script>"})
	List<MemberDto> memberList(Map<String, Object> m);
	
	@Select({"<script>",
				"select count(*) from member ",
					"<where>",
						"<choose>",
							"<when test=\"searchn == 1\"> id like concat('%',#{search},'%') </when>",
							"<when test=\"searchn == 2\"> name like concat('%',#{search},'%') </when>",
						"</choose>",
					"</where>",
			  "</script>"})
	int memberCount(@Param("searchn") int searchn, @Param("search") String search);
	
}
