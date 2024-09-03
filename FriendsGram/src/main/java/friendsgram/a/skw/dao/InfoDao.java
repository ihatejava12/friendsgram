package friendsgram.a.skw.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.member.dto.Member_InfoDto;

@Mapper
public interface InfoDao {
	@Insert("INSERT INTO member_info (name, birth, age, gender, phone, email, address, content, school_name, school_period, school_major, career_nme, career_period, career_role, certificate_name, certificate_date, id, detail_address) " + 
	        "VALUES (#{name}, #{birth}, #{age}, #{gender}, #{phone}, #{email}, #{address}, #{content}, #{school_name}, #{school_period}, #{school_major}, #{career_nme}, #{career_period}, #{career_role}, #{certificate_name}, #{certificate_date}, #{id}, #{detail_address})")
	int insertInfo(Member_InfoDto dto);
	
	@Select("select * from member_info WHERE id = #{id} LIMIT 1")
	Member_InfoDto midto(String id);

	  @Update("UPDATE Member " +
	            "SET name = #{name}, " +
	            "email = #{email}, " +
	            "phone = #{phone}, " +
	            "address = #{address}, " +
	            "detail_address = #{detail_address}, " +
	            "birth = #{birth}, " +
	            "gender = #{gender}, " +
	            "school_name = #{school_name}, " +
	            "school_period = #{school_period}, " +
	            "school_major = #{school_major}, " +
	            "career_nme = #{career_nme}, " +
	            "career_period = #{career_period}, " +
	            "career_role = #{career_role}, " +
	            "certificate_name = #{certificate_name}, " +
	            "certificate_date = #{certificate_date} " +
	            "WHERE id = #{id}")
	    int updateinfo(Member_InfoDto dto);
	}

