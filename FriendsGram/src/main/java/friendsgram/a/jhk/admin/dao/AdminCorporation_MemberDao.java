package friendsgram.a.jhk.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.member.dto.Corporation_MemberDto;

@Mapper
public interface AdminCorporation_MemberDao {
	
	@Select({"<script>",
				"select * from corporation_member ",
					"<where>",
						"<choose>",
							"<when test=\"searchn == 0\"> r_consent = 0 </when>",
							"<when test=\"searchn == 1\"> r_consent = 1 </when>",
							"<when test=\"searchn == 2\"> r_consent = 2 </when>",
						"</choose>",
					"and company like concat('%',#{company},'%')",
				"</where>",
				"order by r_consent limit #{start} , #{count}",
			"</script>"})
	List<Corporation_MemberDto> selectCompany(Map<String, Object> m);
	
	@Select({"<script>",
		"select count(*) from corporation_member ",
			"<where>",
				"<choose>",
					"<when test=\"searchn == 0\"> r_consent = 0 </when>",
					"<when test=\"searchn == 1\"> r_consent = 1 </when>",
					"<when test=\"searchn == 2\"> r_consent = 2 </when>",
				"</choose>",
			"and company like concat('%',#{company},'%')",
		"</where>",
	"</script>"})
	int countCompany(Map<String, Object> m);
	
	@Update("update corporation_member set r_consent = #{searchn} where id = #{id}")
	int updateConsent(@Param("searchn") int searchn, @Param("id") String id);
	
	@Select("select * from corporation_member where id = #{id}")
	Corporation_MemberDto oneCompany(String id);
	
}
