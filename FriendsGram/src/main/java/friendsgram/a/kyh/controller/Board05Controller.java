package friendsgram.a.kyh.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    
}
