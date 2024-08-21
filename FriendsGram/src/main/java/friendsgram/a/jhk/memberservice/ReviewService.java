package friendsgram.a.jhk.memberservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.memberdao.ReviewDao;
import friendsgram.board02.dto.Board02_TeamDto;
import friendsgram.member.dto.Member_ReviewDto;

@Service
public class ReviewService {

	@Autowired
	ReviewDao dao;
	
	public int avgScore(String subjects) {
		return dao.avgScore(subjects);
	}
	
	public int insertReview(Member_ReviewDto dto) {
		return dao.insertReview(dto);
	}
	
	public Member_ReviewDto oneReview(int mr_no) {
		return dao.oneReview(mr_no);
	}
	
	public List<Member_ReviewDto> reviewList(String subjects){
		return dao.reviewList(subjects);
	}
	
	public List<Board02_TeamDto> teamList(String id){
		return dao.teamList(id);
	}
	
}
