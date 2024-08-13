package friendsgram.a.skw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.member.dto.LoginDto;
import friendsgram.member.dto.MemberDto;
@Mapper
public interface MemberDao {

	String id_Check(String id);
	int insertMem(MemberDto dto);
	
//	@Select("select * from member where id=#{id} and password=#{password}")
//	MemberDto login(MemberDto dto);
	
	/*
	 * @Select("select * from member where id=#{id} and password=#{password}")
	 * MemberDto login(LoginDto dto);
	 */
	@Select("select * from member where id=#{id} and password=#{password}")
	 MemberDto login(LoginDto dto);
	
	
	int updateMem(MemberDto dto);
	int delete_Mem(String id);
	
	@Select("select * from member")
	List<MemberDto> memsInfo();
	
	@Update("update member set password=#{nwPw} where id=#{id} and name=#{name}")
	int updatePw(@Param("id") String id, @Param("name") String name, @Param("nwPw") String nwPw);
	
	@Select("select id from member where id=#{id}")
	String idCheck(@Param("id") String id);
	
	
	List<MemberDto> login();
	
	//@Insert("insert into member values(#{id},#{password}, #{name}, #{email}, #{birth}, #{gender}, #{phone}")
	//List<MemberDto> insertMem();
	
	//@Update("update member set password=#{password}, \r\n"
	//		+ "name=#{name}, birth = #{birth},address=#{address}\r\n"
	//		+ "where id=#{id} ")
	// List<MemberDto> updateMem();
	
	@Delete("delete from member where id = #{id}")
	int deleteMem(@Param("id") String id);







}
