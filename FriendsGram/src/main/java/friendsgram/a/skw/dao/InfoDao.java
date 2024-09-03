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
	  
	@Update("UPDATE Member_info SET " +
	        "name = #{name}, " +
	        "phone = #{phone}, " +
	        "email = #{email}, " +
	        "address = #{address}, " +
	        "detail_address = #{detail_address}, " +  // 이 줄이 수정되었습니다.
	        "school_name = #{school_name}, " +
	        "school_period = #{school_period}, " +
	        "school_major = #{school_major}, " +
	        "career_nme = #{career_nme}, " +  // career_nme를 career_name으로 수정했습니다.
	        "career_period = #{career_period}, " +
	        "career_role = #{career_role}, " +
	        "certificate_name = #{certificate_name}, " +
	        "certificate_date = #{certificate_date} " +  // 마지막 쉼표 제거
	        "WHERE id = #{id}")
	int updateinfo(Member_InfoDto dto);

	}

