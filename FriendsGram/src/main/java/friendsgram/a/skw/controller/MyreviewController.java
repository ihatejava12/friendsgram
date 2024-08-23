package friendsgram.a.skw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.skw.service.MyreviewService;
import friendsgram.member.dto.MemberDto;
import friendsgram.member.dto.Member_ReviewDto;

@Controller
@SessionAttributes("user")
public class MyreviewController {

    @Autowired
    private MyreviewService reviewService;

    @GetMapping("/review/{subjects}")
    public String review(
            @ModelAttribute("user") MemberDto dto, 
            @PathVariable("subjects") String subjects, 
            @RequestParam(value = "id", required = false) String id,
            Model m) {

        // id가 null인 경우 세션에서 가져옴
        if (id == null) {
            id = dto.getId();  // 세션에 저장된 사용자 ID 사용
        }

        if (subjects == null) {
            return "skw/review/noreview";  // 기본적으로 'noreview' 페이지로 이동
        }

        // 리뷰 리스트 가져오기
        List<Member_ReviewDto> rto = reviewService.reviewList(subjects);

        // 내가 작성한 리뷰 리스트 가져오기
        List<Member_ReviewDto> welist = reviewService.writereviewList(id);

        // 리뷰가 없을 경우
        if (rto.isEmpty()) {
            return "skw/review/noreview";  // 리뷰가 없을 때 'noreview' 페이지로 이동
        }

        // 리뷰가 있을 경우
        m.addAttribute("relist", rto);
        m.addAttribute("welist", welist);
        m.addAttribute("subjects", subjects);
        m.addAttribute("id", id);
        int star = reviewService.avgScore(subjects);
        m.addAttribute("star", star);

        return "skw/review/viewreview";  // 리뷰가 있을 때 'viewreview' 페이지로 이동
    }
		
	    // 리뷰 수정 페이지로 이동
	    @GetMapping("/editreview{mr_no}")
	    public String editReview(@RequestParam("mr_no") int mr_no, Model model) {
	    	Member_ReviewDto review = reviewService.getReviewById(mr_no);
	        model.addAttribute("review", review);
	        return "editReview";
	    }

	    // 리뷰 수정 처리
	    @PostMapping("/updatereview")
	    public String updateReview(@RequestParam("mr_no") int mr_no,
	                               @RequestParam("score") int score,
	                               @RequestParam("content") String content) {
	        reviewService.updateReview(mr_no, score, content);
	        return "redirect:/mypage";  // 수정 후 마이페이지로 리다이렉트
	    }
	}