package friendsgram.a.jhk.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import friendsgram.admin.dto.ReportDto;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board01.dto.Board01_ComentDto;
import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_ComentDto;

@Mapper
public interface AdminReportDao {
	
	// co_no != 0, num = 1
	@Select("select * from board02_coment where b_no02 = #{b_no02} and c_no02 = #{c_no02}")
	Board02_ComentDto selectBC2(@Param("b_no02") int b_no02, @Param("c_no02") int c_no02);
	
	// co_no != 0, num = 0
	@Select("select * from board01_coment where b_no01 = #{b_no01} and c_no01 = #{c_no01}")
	Board01_ComentDto selectBC1(@Param("b_no01") int b_no01, @Param("c_no01") int c_no01);
	
	// co_no = 0, num = 1
	@Select("select * from board02 where b_no02 = #{b_no02}")
	Board02Dto selectB2(int b_no02);
	
	// co_no = 0, num = 0
	@Select("select * from board01 where b_no01 = #{b_no01}")
	Board01Dto selectB1(int b_no01);
	
	@Select("select * from report")
	List<ReportDto> reportList();
	
}
