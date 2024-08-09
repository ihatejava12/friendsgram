package friendsgram.a.jhk.dao;

import java.util.List;

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
							"<when test=\"searchn == 0\"> company_consent = 0 </when>",
							"<when test=\"searchn == 1\"> company_consent = 1 </when>",
							"<when test=\"searchn == 2\"> company_consent = 2 </when>",
						"</choose>",
					"and company like concat('%',#{company},'%')",
				"</where>",		 
			"</script>"})
	List<Corporation_MemberDto> selectCompany(@Param("searchn") int searchn, @Param("company") String company);
	
	@Update("update corporation_member set company_consent = #{searchn} where id = #{id}")
	int updateConsent(@Param("searchn") int searchn, @Param("id") String id);
	
	@Select("select * from corporation_member where id = #{id}")
	Corporation_MemberDto oneCompany(String id);
	
	/*
	 * @Select("select * from corporation_member") List<Corporation_MemberDto>
	 * selectCompany();
	 */
	
}
