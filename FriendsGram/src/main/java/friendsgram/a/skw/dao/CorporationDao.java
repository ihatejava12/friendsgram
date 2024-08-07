package friendsgram.a.skw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.member.dto.Corporation_MemberDto;

@Mapper
public interface CorporationDao {
	
	String corid_Check(String id);
	
	int insertCor(Corporation_MemberDto dto);
	
	Corporation_MemberDto corlogin(Corporation_MemberDto dto);
	int updateCor(Corporation_MemberDto dto);
	int delete_Cor(String id);
	
	@Select("select * from Corporation_Member")
	List<Corporation_MemberDto> corsInfo();
	
	@Update("update Corporation_Member set password=#{nwPw} where id=#{id} and name=#{name}")
	int updateCorPw(@Param("id") String id, @Param("name") String name, @Param("nwPw") String nwPw);
	
	@Select("select id from Corporation_Member where id=#{id}")
	String coridCheck(@Param("id") String id);
	
	@Select("select * from Corporation_Member where id=#{id} and password=#{password}")
	List<Corporation_MemberDto> corlogin();
	
	//@Insert("insert into member values(#{id},#{password}, #{name}, #{email}, #{birth}, #{gender}, #{phone}")
	//List<MemberDto> insertMem();
	
	@Update("update Corporation_Member set password=#{password}, \r\n"
			+ "name=#{name}, company=#{company}, scale=#{scale},\r\n"
			+ "business_number=#{business_number}, boss_name=#{boss_name}, address=#{address},\r\n"
			+ "email=#{email}, company_number=#{company_number}, consent=#{consent},\r\n"
			+ "company_consent=#{company_consent}"
			+ "where id=#{id} ")
	List<Corporation_MemberDto> updateCor();
	
	@Delete("delete from Corporation_Member where id = #{id}")
	int deleteCor(@Param("id") String id);

}
