package friendsgram.a.kyh.controller;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.kyh.service.Board05Service;
import friendsgram.board05.dto.Board05Dto;

@Controller
public class Board05Controller {

    @Autowired
    private Board05Service service;

    @GetMapping("/board05")
    public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
                       @RequestParam(name = "search", defaultValue = "") String search,
                       @RequestParam(name = "p", defaultValue = "1") int page, 
                       Model model) {
        
        // 게시글의 총 개수 확인 (검색 조건에 따른)
        int count = service.count(searchn, search);
        model.addAttribute("count", count);

        if (count > 0) {
            // 페이징 관련 변수 설정
            int perPage = 10; // 한 페이지에 보일 글의 갯수
            int startRow = (page - 1) * perPage;
            
            // 게시글 목록 가져오기 (검색 조건과 페이징 적용)
            List<Board05Dto> board05List = service.boardListSearch(searchn, search, startRow);
            model.addAttribute("board05List", board05List);

            // 전체 페이지 수 계산
            int totalPages = (count + perPage - 1) / perPage;

            // 페이지 네비게이션 범위 계산
            int pageNum = 5;
            int begin = ((page - 1) / pageNum) * pageNum + 1;
            int end = Math.min(begin + pageNum - 1, totalPages);

            // 모델에 페이징 정보 추가
            model.addAttribute("begin", begin);
            model.addAttribute("end", end);
            model.addAttribute("pageNum", pageNum);
            model.addAttribute("totalPages", totalPages);
        }

        // 검색 조건 모델에 추가
        model.addAttribute("searchn", searchn);
        model.addAttribute("search", search);
        
        return "kyh/board05/list"; // JSP 파일로 포워딩
    }

    @GetMapping("/board05/write")
    public String writeForm(Model model) {
        model.addAttribute("board", new Board05Dto());
        return "kyh/board05/write";
    }

    @PostMapping("/board05/write")
    public String write(@ModelAttribute Board05Dto board) {
        board.setDate(new Date()); // 현재 날짜를 설정
        service.insert(board);
        return "redirect:/board05";
    }
}
