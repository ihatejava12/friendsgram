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

    @Select("SELECT COUNT(*) FROM member_review WHERE subjects = #{subjects}")
    int countReviews(@Param("subjects") String subjects);

    @Select("SELECT COUNT(*) FROM member_review WHERE id = #{id}")
    int countWrittenReviews(@Param("id") String id);
    
 // 페이징을 위한 수정된 리뷰 목록 쿼리
    @Select("SELECT * FROM member_review WHERE subjects = #{subjects} LIMIT #{limit} OFFSET #{offset}")
    List<Member_ReviewDto> reviewList(@Param("subjects") String subjects, @Param("limit") int limit, @Param("offset") int offset);
    
    // 페이징을 위한 수정된 작성 리뷰 목록 쿼리
    @Select("SELECT * FROM member_review WHERE id = #{id} LIMIT #{limit} OFFSET #{offset}")
    List<Member_ReviewDto> writereviewList(@Param("id") String id, @Param("limit") int limit, @Param("offset") int offset);
    
    @Delete("DELETE FROM member_review WHERE mr_no = #{mr_no}")
    void deleteReview(@Param("mr_no") int mr_no);
    
    @Insert("INSERT INTO report (report_content, r_no, id, co_no, content) VALUES (#{report_content}, #{r_no}, #{id}, #{co_no}, #{content})")
    void insertReport(ReportDto reportDto);

}