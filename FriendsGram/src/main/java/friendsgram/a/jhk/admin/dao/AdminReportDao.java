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
	@Select("select * from report where r_no = #{r_no} and co_no = #{co_no} and num = #{num}")
	List<ReportDto> selectBC2(@Param("r_no") int r_no, @Param("co_no") int co_no, @Param("num") int num);
	
	// co_no != 0, num = 0
	@Select("select * from report where r_no = #{r_no} and co_no = #{co_no} and num = #{num}")
	List<ReportDto> selectBC1(@Param("r_no") int r_no, @Param("co_no") int co_no, @Param("num") int num);
	
	// co_no = 0, num = 1
	@Select("select * from report where r_no = #{r_no} and co_no = 0 and num = #{num}")
	List<ReportDto> selectB2(int r_no, @Param("num") int num);
	
	// co_no = 0, num = 0
	@Select("select * from report where r_no = #{r_no} and co_no = 0 and num = #{num}")
	List<ReportDto> selectB1(int r_no, @Param("num") int num);
	
	@Select("select * from report order by num")
	List<ReportDto> reportList();
	
}
