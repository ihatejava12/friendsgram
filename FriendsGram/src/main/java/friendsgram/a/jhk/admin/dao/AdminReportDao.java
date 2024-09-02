package friendsgram.a.jhk.admin.dao;

import java.util.List;
import java.util.Map;

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
	
	// co_no == 0, num == 2
	@Select("select * from report where report_num = #{report_num}")
	ReportDto selectR(int report_num);
	
	// co_no != 0, num == 1
	@Select("select * from report where report_num = #{report_num}")
	ReportDto selectBC2(int report_num);
	
	// co_no != 0, num == 0
	@Select("select * from report where report_num = #{report_num}")
	ReportDto selectBC1(int report_num);
	
	// co_no == 0, num == 1
	@Select("select * from report where report_num = #{report_num}")
	ReportDto selectB2(int report_num);
	
	// co_no == 0, num == 0
	@Select("select * from report where report_num = #{report_num}")
	ReportDto selectB1(int report_num);
	
	@Select("select * from report order by report_num desc limit #{start}, #{count}")
	List<ReportDto> reportList(Map<String, Object> m);
	
	@Select("select count(*) from report")
	int reportCount();
	
}
