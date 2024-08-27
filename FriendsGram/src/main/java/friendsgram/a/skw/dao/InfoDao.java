package friendsgram.a.skw.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.member.dto.Member_InfoDto;

@Mapper
public interface InfoDao {
	@Insert("INSERT INTO member_info (name, birth, age, gender, phone, email, address, content, school_name, school_period, school_major, career_nme, career_period, career_role, certificate_name, certificate_date, id, detail_address) " + 
	        "VALUES (#{name}, #{birth}, #{age}, #{gender}, #{phone}, #{email}, #{address}, #{content}, #{school_name}, #{school_period}, #{school_major}, #{career_nme}, #{career_period}, #{career_role}, #{certificate_name}, #{certificate_date}, #{id}, #{detail_address})")
	int insertInfo(Member_InfoDto dto);
	
	@Select("select * from member_info")
	Member_InfoDto midto();

}
