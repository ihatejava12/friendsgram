package friendsgram.a.kyh.controller;

import java.util.Date;
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

import friendsgram.a.kyh.service.Board05Service;
import friendsgram.board05.dto.Board05Dto;

@SessionAttributes("user")
@Controller
public class Board05Controller {

    @Autowired
    private Board05Service service;
    

    @GetMapping("/board05")
    public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
                       @RequestParam(name = "search", defaultValue = "") String search,
                       @RequestParam(name = "p", defaultValue = "1") int page, 
                       Model model) {

        int count = service.count(searchn, search);
        model.addAttribute("count", count);

        if (count > 0) {
            int perPage = 10;
            int startRow = (page - 1) * perPage;
            List<Board05Dto> board05List = service.boardListSearch(searchn, search, startRow);

            // 각 board 객체에 codes를 설정
            for (Board05Dto board : board05List) {
                List<String> codes = service.getCodesByBoardNo(board.getB_no05());
                board.setCodes(codes);
            }

            model.addAttribute("board05List", board05List);

            int totalPages = (count + perPage - 1) / perPage;
            int pageNum = 5;
            int begin = ((page - 1) / pageNum) * pageNum + 1;
            int end = Math.min(begin + pageNum - 1, totalPages);

            model.addAttribute("begin", begin);
            model.addAttribute("end", end);
            model.addAttribute("pageNum", pageNum);
            model.addAttribute("totalPages", totalPages);
        }

        model.addAttribute("searchn", searchn);
        model.addAttribute("search", search);
        
        return "kyh/board05/list";
    }


    @GetMapping("/board05/write")
    public String writeForm(Model model) {
        model.addAttribute("board", new Board05Dto());
        return "kyh/board05/write";
    }

    @PostMapping("/board05/write")
    public String write(@ModelAttribute Board05Dto board,
                        @RequestParam("programming_language") List<String> programmingLanguages) {
        board.setDate(new Date());
        service.insert(board, programmingLanguages);
        return "redirect:/board05";
    }

    @GetMapping("/board05/join")
    public String join() {
        return "kyh/board05/join";
    }
    
    @GetMapping("board05/content/{b_no05}")
    public String content(@PathVariable("b_no05") int b_no05, Model m) {
        Board05Dto dto = service.selectOne(b_no05);
        m.addAttribute("dto", dto);
        return "kyh/board05/content";
    }
    
    @GetMapping("/board05/edit/{b_no05}")
    public String editForm(@PathVariable("b_no05") int no, Model model) {
        Board05Dto dto = service.selectOne(no);
        model.addAttribute("dto", dto);
        return "kyh/board05/edit"; // 수정 페이지로 이동
    }

    @PostMapping("/board05/update/{b_no05}")
    public String update(@PathVariable("b_no05") int no, @ModelAttribute Board05Dto dto,
                         @RequestParam("programming_language") List<String> programmingLanguages) {
        dto.setB_no05(no);
        service.update(dto, programmingLanguages);
        return "redirect:/board05/content/" + no; // 수정 후 게시글 보기로 리다이렉트
    }
    
    //검색
    @GetMapping("/board05/search")
    public String searchBoards(
            @RequestParam(value = "language", required = false, defaultValue = "all") String language,
            @RequestParam(value = "workType", required = false, defaultValue = "all") String workType,
            @RequestParam(value = "region", required = false, defaultValue = "all") String region,
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "p", defaultValue = "1") int page,  // 현재 페이지
            Model model) {

        int count = 10;  // 페이지당 게시글 수
        int start = (page - 1) * count;  // 시작 인덱스 계산

        List<Board05Dto> boards = service.searchBoards(language, workType, region, keyword, start, count);
        model.addAttribute("board05List", boards);
        model.addAttribute("language", language);
        model.addAttribute("workType", workType);
        model.addAttribute("region", region);
        model.addAttribute("keyword", keyword);

        // 페이지네이션 관련 속성 추가
        int totalRecords = service.countBoards(language, workType, region, keyword);
        int totalPages = (totalRecords + count - 1) / count;
        int pageNum = 5;
        int begin = ((page - 1) / pageNum) * pageNum + 1;
        int end = Math.min(begin + pageNum - 1, totalPages);

        model.addAttribute("begin", begin);
        model.addAttribute("end", end);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("page", page);

        return "kyh/board05/list";  // 검색 결과를 보여줄 JSP 페이지
    }


    
    
    
}
