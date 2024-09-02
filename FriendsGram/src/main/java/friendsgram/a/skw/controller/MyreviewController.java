package friendsgram.a.skw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.skw.service.MyreviewService;
import friendsgram.a.skw.service.ReportService;
import friendsgram.admin.dto.ReportDto;
import friendsgram.member.dto.MemberDto;
import friendsgram.member.dto.Member_ReviewDto;

@Controller
@SessionAttributes("user")
public class MyreviewController {

    @Autowired
    private MyreviewService reviewService;
    
    @Autowired
    private ReportService reportService; // ReportService는 신고를 처리하는 서비스

    @GetMapping("/review/{subjects}")
    public String review(
            @ModelAttribute("user") MemberDto dto, 
            @PathVariable("subjects") String subjects, 
            @RequestParam(value = "id", required = false) String id,
            @RequestParam(value = "relistPage", defaultValue = "1") int relistPage,
            @RequestParam(value = "welistPage", defaultValue = "1") int welistPage,
            @RequestParam(value = "relistSize", defaultValue = "5") int relistLimit,
            @RequestParam(value = "welistSize", defaultValue = "5") int welistLimit,
            Model m) {

        // id가 null인 경우 세션에서 가져옴
        if (id == null) {
            id = dto.getId();  // 세션에 저장된 사용자 ID 사용
        }

        if (subjects == null) {
            return "skw/review/noreview";  // 기본적으로 'noreview' 페이지로 이동
        }

        
        int relistOffset = (relistPage - 1) * relistLimit; // 오프셋 계산
        int welistOffset = (welistPage - 1) * welistLimit; // 오프셋 계산

     // 리뷰 리스트 가져오기 (페이징 포함)
        List<Member_ReviewDto> rto = reviewService.reviewList(subjects, relistLimit, relistOffset);

        // 내가 작성한 리뷰 리스트 가져오기 (페이징 포함)
        List<Member_ReviewDto> welist = reviewService.writereviewList(id, welistLimit, welistOffset);

        // 리뷰가 없을 경우
        if (rto.isEmpty() && welist.isEmpty()) {
            return "skw/review/noreview";  // 리뷰가 없을 때 'noreview' 페이지로 이동
        }

     // 전체 리뷰 수 계산
        int totalRelistReviews = reviewService.countReviews(subjects);
        int totalWelistReviews = reviewService.countWrittenReviews(id); // 새로운 메소드가 필요할 수 있음

        int totalRelistPages = (int) Math.ceil((double) totalRelistReviews / relistLimit);
        int totalWelistPages = (int) Math.ceil((double) totalWelistReviews / welistLimit);

        
        // 리뷰가 있을 경우
        m.addAttribute("relist", rto);
        m.addAttribute("welist", welist);
        m.addAttribute("subjects", subjects);
        m.addAttribute("id", id);
        m.addAttribute("relistCurrentPage", relistPage);
        m.addAttribute("welistCurrentPage", welistPage);
        m.addAttribute("relistTotalPages", totalRelistPages);
        m.addAttribute("welistTotalPages", totalWelistPages);

        int star = reviewService.avgScore(subjects);
        m.addAttribute("star", star);

      
    
        return "skw/review/viewreview";  // 리뷰가 있을 때 'viewreview' 페이지로 이동
    }
    

    // 리뷰 수정 페이지로 이동
    @GetMapping("/editreview/{mr_no}")
    public String editReview(@PathVariable("mr_no") int mr_no, Model model) {
        Member_ReviewDto review = reviewService.getReviewById(mr_no);
        model.addAttribute("review", review);
        return "skw/review/editReview";
    }

    // 리뷰 수정 처리
    @PostMapping("/updatereview")
    public String updateReview(@RequestParam("mr_no") int mr_no,
                               @RequestParam("score") int score,
                               @RequestParam("content") String content) {
        reviewService.updateReview(mr_no, score, content);
        return "/jhk/board02/close";
    }

    // 리뷰 삭제 처리
    @DeleteMapping("/review/deletereview/{mr_no}")
    public @ResponseBody ResponseEntity<?> deleteReview(@PathVariable("mr_no") int mr_no) {
        try {
            reviewService.deleteReview(mr_no);
            return ResponseEntity.ok().body("리뷰가 삭제되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 중 오류가 발생했습니다.");
        }
    }
    
    // 신고 처리 메소드
    @PostMapping("/reportreview/{mr_no}")
    @ResponseBody
    public ResponseEntity<String> reportReview(
            @PathVariable("mr_no") int mr_no,
            @RequestParam("report_content") String reportContent,
            @RequestParam("reportedBy") String reportedBy, @RequestParam("content") String content) {

        ReportDto reportDto = new ReportDto();
        reportDto.setReport_content(reportContent);
        reportDto.setR_no(mr_no);
        reportDto.setId(reportedBy);
        reportDto.setContent(content);

        try {
            reportService.insertReport(reportDto);
            return ResponseEntity.ok("리뷰가 신고되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("신고 중 오류가 발생했습니다.");
        }
    }
}





/*
 * @Controller
 * 
 * @SessionAttributes("user") public class MyreviewController {
 * 
 * @Autowired private MyreviewService reviewService;
 * 
 * @Autowired private ReportService reportService; // ReportService는 신고를 처리하는
 * 서비스
 * 
 * @GetMapping("/review/{subjects}") public String review(
 * 
 * @ModelAttribute("user") MemberDto dto,
 * 
 * @PathVariable("subjects") String subjects,
 * 
 * @RequestParam(value = "id", required = false) String id, Model m) {
 * 
 * // id가 null인 경우 세션에서 가져옴 if (id == null) { id = dto.getId(); // 세션에 저장된 사용자
 * ID 사용 }
 * 
 * if (subjects == null) { return "skw/review/noreview"; // 기본적으로 'noreview'
 * 페이지로 이동 }
 * 
 * // 리뷰 리스트 가져오기 List<Member_ReviewDto> rto =
 * reviewService.reviewList(subjects);
 * 
 * // 내가 작성한 리뷰 리스트 가져오기 List<Member_ReviewDto> welist =
 * reviewService.writereviewList(id);
 * 
 * // 리뷰가 없을 경우 if (rto.isEmpty()) { return "skw/review/noreview"; // 리뷰가 없을 때
 * 'noreview' 페이지로 이동 }
 * 
 * // 리뷰가 있을 경우 m.addAttribute("relist", rto); m.addAttribute("welist", welist);
 * m.addAttribute("subjects", subjects); m.addAttribute("id", id); int star =
 * reviewService.avgScore(subjects); m.addAttribute("star", star);
 * 
 * return "skw/review/viewreview"; // 리뷰가 있을 때 'viewreview' 페이지로 이동 }
 * 
 * // 리뷰 수정 페이지로 이동
 * 
 * @GetMapping("/editreview/{mr_no}") public String
 * editReview(@PathVariable("mr_no") int mr_no, Model model) { Member_ReviewDto
 * review = reviewService.getReviewById(mr_no); model.addAttribute("review",
 * review); return "skw/review/editReview"; }
 * 
 * // 리뷰 수정 처리
 * 
 * @PostMapping("/updatereview") public String
 * updateReview(@RequestParam("mr_no") int mr_no,
 * 
 * @RequestParam("score") int score,
 * 
 * @RequestParam("content") String content) { reviewService.updateReview(mr_no,
 * score, content); return "redirect:/myprofile"; } // 리뷰 삭제 처리
 * 
 * @DeleteMapping("/review/deletereview/{mr_no}") public @ResponseBody
 * ResponseEntity<?> deleteReview(@PathVariable("mr_no") int mr_no) { try {
 * reviewService.deleteReview(mr_no); return
 * ResponseEntity.ok().body("리뷰가 삭제되었습니다."); } catch (Exception e) { return
 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
 * body("삭제 중 오류가 발생했습니다."); } } // 신고 처리 메소드
 * 
 * @PostMapping("/reportreview/{mr_no}")
 * 
 * @ResponseBody public ResponseEntity<String> reportReview(
 * 
 * @PathVariable("mr_no") int mr_no,
 * 
 * @RequestParam("report_content") String reportContent,
 * 
 * @RequestParam("reportedBy") String reportedBy) {
 * 
 * ReportDto reportDto = new ReportDto();
 * reportDto.setReport_content(reportContent); reportDto.setR_no(mr_no);
 * reportDto.setId(reportedBy);
 * 
 * try { reportService.insertReport(reportDto); return
 * ResponseEntity.ok("리뷰가 신고되었습니다."); } catch (Exception e) {
 * e.printStackTrace(); return
 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
 * body("신고 중 오류가 발생했습니다."); } }
 * 
 * 
 * 
 * }
 * 
 */
