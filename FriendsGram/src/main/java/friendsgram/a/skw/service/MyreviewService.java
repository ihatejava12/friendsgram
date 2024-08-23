package friendsgram.a.skw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import friendsgram.a.skw.dao.MyreviewDao;
import friendsgram.admin.dto.ReportDto;
import friendsgram.member.dto.Member_ReviewDto;

@Service
public class MyreviewService {

    @Autowired
    private MyreviewDao reviewDao;
    
    public int avgScore(String subjects) {
        return reviewDao.avgScore(subjects);
    }

    //리뷰 ID로 특정 리뷰 가져오기 
    public Member_ReviewDto getReviewById(int mr_no) {
    	 return reviewDao.getReviewById(mr_no); }

    // 리뷰 업데이트
    public void updateReview(int mr_no, int score, String content) {
        Member_ReviewDto review = new Member_ReviewDto();
        review.setMr_no(mr_no);
        review.setScore(score);
        review.setContent(content);
        reviewDao.updateReview(review);
    }

    // 특정 subjects에 대한 모든 리뷰 가져오기
    public List<Member_ReviewDto> reviewList(String subjects) {
        return reviewDao.reviewList(subjects);
    }
    
    // 특정 사용자가 작성한 리뷰 가져오기
    public List<Member_ReviewDto> writereviewList(String id) {
        return reviewDao.writereviewList(id);
    }


    @Transactional
    public void deleteReview(int mr_no) {
        reviewDao.deleteReview(mr_no);
    }

/*
 * @Transactional public void reportReview(int mrNo, String reportContent,
 * String reportedBy) { ReportDto reportDto = new ReportDto();
 * reportDto.setR_no(mrNo); reportDto.setReport_content(reportContent);
 * reportDto.setId(reportedBy); reportDto.setCo_no(0); // 관련 정보 ID가 필요하다면 적절한 값을
 * 설정합니다. reportDto.setContent(""); // 추가적인 내용이 필요하다면 적절한 값을 설정합니다.
 * 
 * ReportDto.insertReport(reportDto); }
 */
} 
/*
 * package friendsgram.a.skw.service;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Service;
 * 
 * import friendsgram.a.skw.dao.MyreviewDao; import
 * friendsgram.member.dto.Member_ReviewDto;
 * 
 * @Service public class MyreviewService {
 * 
 * @Autowired private MyreviewDao reviewDao;
 * 
 * public int avgScore(Member_ReviewDto mdto) { return reviewDao.avgScore(mdto);
 * }
 * 
 * // 리뷰 ID로 특정 리뷰 가져오기 public Member_ReviewDto getReviewById(int mr_no) {
 * return reviewDao.getReviewById(mr_no); }
 * 
 * // 리뷰 업데이트 public void updateReview(int mr_no, int score, String content) {
 * Member_ReviewDto review = new Member_ReviewDto(); review.setMr_no(mr_no);
 * review.setScore(score); review.setContent(content);
 * reviewDao.updateReview(review); }
 * 
 * // 사용자의 모든 리뷰 가져오기 public List<Member_ReviewDto> reviewList(Member_ReviewDto
 * review) { return reviewDao.reviewList(review); } // 사용자가 작성한 리뷰 가져오기 public
 * List<Member_ReviewDto> writereviewList(Member_ReviewDto review){ return
 * reviewDao.writereviewList(review); }
 * 
 * }
 */
