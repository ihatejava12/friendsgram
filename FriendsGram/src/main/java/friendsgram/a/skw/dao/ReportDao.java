package friendsgram.a.skw.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import friendsgram.admin.dto.ReportDto;

@Mapper
public interface ReportDao {

    @Insert("INSERT INTO report (report_content, r_no, num, id) VALUES (#{report_content}, #{r_no}, #{num}, #{id})")
    void insertReport(ReportDto reportDto);
}