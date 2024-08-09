package friendsgram.a.jhk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.member.dto.MemberDto;

@Mapper
public interface AdminRatingDao {
	
	@Update("update admin set role = #{role} where id = #{id}")
	int updateRating(@Param("role") int role, @Param("id") String id);
	
	@Select("select * from member where id = #{id}")
	MemberDto adminContent(String id);
	
	@Select("select * from member")
	List<MemberDto> adminList();
	
}
