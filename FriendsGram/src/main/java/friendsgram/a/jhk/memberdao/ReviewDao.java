package friendsgram.a.jhk.memberdao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.board02.dto.Board02_TeamDto;
import friendsgram.member.dto.Member_ReviewDto;

@Mapper
public interface ReviewDao {
	
	// 리뷰글 평균 별점
	@Select("select avg(score) from member_review where subjects = #{subjects}")
	int avgScore(String subjects);
	
	// 작성한 리뷰글을 올린다.
	@Insert("insert into member_review (content, subjects, date, score, id, b_no02) values (#{content}, #{subjects}, now(), #{score}, #{id}, #{b_no02})")
	int insertReview(Member_ReviewDto dto);
	
	// 신고하기위해 해당 리뷰글 하나를 뽑아온다.
	@Select("select * from member_review where mr_no = #{mr_no}")
	Member_ReviewDto oneReview(int mr_no);

	// 리뷰글 모두 뽑아오기.
	@Select("select * from member_review where subjects = #{subjects}")
	List<Member_ReviewDto> reviewList(String subjects);
	
	// 모든 멤버들을 뽑아온다.
	@Select("select id from board02_team where id = #{id}")
	List<Board02_TeamDto> teamList(String id);
	
}
