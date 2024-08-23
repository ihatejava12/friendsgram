package friendsgram.a.skw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.admin.dto.ReportDto;
import friendsgram.member.dto.Member_ReviewDto;

@Mapper
public interface MyreviewDao {
    
    @Select("SELECT avg(score) FROM member_review WHERE subjects = #{subjects}")
    int avgScore(@Param("subjects") String subjects);

    @Select("SELECT * FROM member_review WHERE mr_no = #{mr_no}")
    Member_ReviewDto getReviewById(@Param("mr_no") int mr_no);

    @Update("UPDATE member_review SET score = #{score}, content = #{content} WHERE mr_no = #{mr_no}")
    void updateReview(Member_ReviewDto review);

    @Select("SELECT * FROM member_review WHERE subjects = #{subjects}")
    List<Member_ReviewDto> reviewList(@Param("subjects") String subjects);
    
    @Select("SELECT * FROM member_review WHERE id = #{id}")
    List<Member_ReviewDto> writereviewList(@Param("id") String id);
    
    @Delete("DELETE FROM member_review WHERE mr_no = #{mr_no}")
    void deleteReview(@Param("mr_no") int mr_no);
    
    @Insert("INSERT INTO report (report_content, r_no, id, co_no, content) VALUES (#{report_content}, #{r_no}, #{id}, #{co_no}, #{content})")
    void insertReport(ReportDto reportDto);
}

/*
 * package friendsgram.a.skw.dao;
 * 
 * import java.util.List;
 * 
 * import org.apache.ibatis.annotations.Mapper; import
 * org.apache.ibatis.annotations.Param; import
 * org.apache.ibatis.annotations.Select; import
 * org.apache.ibatis.annotations.Update;
 * 
 * import friendsgram.member.dto.Member_ReviewDto;
 * 
 * @Mapper public interface MyreviewDao {
 * 
 * @Select("select avg(score) from member_review where subjects = #{subjects}")
 * int avgScore(Member_ReviewDto review);
 * 
 * @Select("SELECT * FROM member_review where mr_no = #{mr_no}")
 * Member_ReviewDto getReviewById(@Param("mr_no") int mr_no);
 * 
 * @Update("UPDATE member_review SET score = #{score}, content = #{content} where mr_no = #{mr_No}"
 * ) void updateReview(Member_ReviewDto review);
 * 
 * @Select("SELECT * FROM member_review where subjects = #{subjects}")
 * List<Member_ReviewDto> reviewList(Member_ReviewDto review);
 * 
 * @Select("SELECT * FROM member_review where id = #{id}")
 * List<Member_ReviewDto> writereviewList(Member_ReviewDto review); }
 */