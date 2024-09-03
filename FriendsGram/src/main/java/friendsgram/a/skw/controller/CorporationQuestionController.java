package friendsgram.a.skw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.skw.service.CorporationMyQuestionService;
import friendsgram.member.dto.Corporation_MemberDto;
import friendsgram.question.dto.QuestionDto;
import jakarta.servlet.http.HttpSession;

@Controller
public class CorporationQuestionController {

    @Autowired
    CorporationMyQuestionService corporationMyQuestionService;

    @GetMapping("/corporationQuestionList")
    public String myQuestion(HttpSession session, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
        Corporation_MemberDto corporationUser = (Corporation_MemberDto) session.getAttribute("user");
        
        if (corporationUser == null) {
            // 세션에 사용자가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/loginform";
        }

        String corporationId = corporationUser.getId();

        int count = corporationMyQuestionService.getCorporationQuestionCount(corporationId);
        if (count > 0) {
            int perPage = 10;
            int startRow = (page - 1) * perPage;

            List<QuestionDto> qlist = corporationMyQuestionService.getCorporationQuestions(corporationId, startRow, perPage);
            m.addAttribute("qlist", qlist);

            int pageNum = 10;
            int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);

            int begin = (page - 1) / pageNum * pageNum + 1;
            int end = begin + pageNum - 1;
            if (end > totalPages) {
                end = totalPages;
            }
            m.addAttribute("begin", begin);
            m.addAttribute("end", end);
            m.addAttribute("pageNum", pageNum);
            m.addAttribute("totalPages", totalPages);
        }
        m.addAttribute("count", count);

        // JSP 파일 경로 명확하게 지정
        return "skw/profile/corporationQuestionList";
    }
}
