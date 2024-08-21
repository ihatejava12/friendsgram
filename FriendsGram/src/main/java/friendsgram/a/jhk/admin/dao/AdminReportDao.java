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
	@Select("select * from report where r_no = #{b_no02} and co_no = #{c_no02}")
	Board02_ComentDto selectBC2(@Param("r_no") int r_no, @Param("co_no") int co_no);
	
	// co_no != 0, num = 0
	@Select("select * from report where r_no = #{b_no01} and co_no = #{c_no01}")
	Board01_ComentDto selectBC1(@Param("r_no") int r_no, @Param("co_no") int co_no);
	
	// co_no = 0, num = 1
	@Select("select * from report where r_no = #{b_no02} and co_no = 0")
	Board02Dto selectB2(int r_no);
	
	// co_no = 0, num = 0
	@Select("select * from report where r_no = #{b_no01} and co_no = 0")
	Board01Dto selectB1(int r_no);
	
	@Select("select * from report")
	List<ReportDto> reportList();
	
}
