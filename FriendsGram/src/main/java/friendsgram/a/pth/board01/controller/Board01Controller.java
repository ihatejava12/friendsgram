package friendsgram.a.pth.board01.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import friendsgram.a.pth.board01.service.Board01Service;
import friendsgram.admin.dto.ReportDto;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board01.dto.Board01_ComentDto;
import friendsgram.board01.dto.Coment_LikeDto;


@Controller
public class Board01Controller {
	
	@Autowired
	Board01Service board01service;

	@GetMapping("board01/write")
	public String board01Write() {
		// 게시판 글 새로 쓰기
		
		return "pth/board01/write";
	}
	
	@PostMapping("board01/write")
	public String board01WriteForm(Board01Dto article) {
		
		int readcount = 0;
		// date 와 readcount 값 넣어줬음
		
		board01service.writeBoard01(article);
		
		return "pth/board01/writeform";
	}
	
	
	@GetMapping("board01/update/{no}")
	public String board01Update(@PathVariable("no")int no) {
		// 게시판 글번호 받아와서, 해당 글 정보, DB에서 수정
		
		
		return "pth/board01/update";
	}
	
	@GetMapping("board01/delete/{no}")
	public String board01Delete(@PathVariable("no")int no) {
		// 게시판 글번호 받아와서, 해당 글 DB에서 삭제
		
		return "pth/board01/delete";
	}
	
	@GetMapping("board01/main")
	public String board01Main(@RequestParam(name="p", defaultValue="1")int page, Model m) {
		// 코딩게시판 메인페이지
		// board01 DB에서 글정보,댓글정보 다 가져와서 
		// 글목록으로 뿌려줘야한다
		
		int count = board01service.count();
		
		if(count > 0) {
			int perpage = 10; // 한페이지에 10개의 글 보여줄거임
			int startRow = (page-1)*perpage;
		
			List<Board01Dto> board01list =  board01service.board01List(startRow, perpage);
			m.addAttribute("blist",board01list);
		
			int pageNum = 5;//보여질 페이지 개수 1 2 3 4 5 <다음> 이런식으로
			int totalPages = count / perpage + (count % perpage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;//없는 페이지 번호가 나오지 않도록
			}
			 m.addAttribute("begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
		}// if end
		
		m.addAttribute("count", count);
		
		return "pth/board01/main";
	}
	
	@GetMapping("board01/content/{no}")
	public String board01Content(@PathVariable("no")int no, Model m) {
		// 게시판 글 1개 클릭 할 경우, DB에서 글정보,댓글정보 가져와서 화면에 뿌려줌
		Board01Dto content = board01service.selectOne(no);
		m.addAttribute("content",content);
		
		// 댓글정보도 가져와서 view로 넘겨줘야함
		List<Board01_ComentDto> comentlist = board01service.board01ComentList(no);
		m.addAttribute("comentlist",comentlist);
		return "pth/board01/content";
	}
	
	
	
	@GetMapping("board01/report/{no}")
	public String board01Report(@PathVariable("no")int no, Model m) {
		Board01Dto content = board01service.selectOne(no);
		m.addAttribute("content",content);
		// 신고버튼 을 누른 글 정보 content에 저장
		
		return "pth/board01/report";
	}
	
	
	@PostMapping("/board01/report/confirm")
	public String board01ReportConfirm(ReportDto report) {
		board01service.reportboard01(report);
		int no =report.getR_no();
		return "pth/board01/selfclose";
	}
	
	
	@GetMapping("/board01/search")
	public String board01Search(@RequestParam("skil")String skil, @RequestParam("category")String category, 
			@RequestParam("search")String search, Model m) {
		// 검색 버튼 클릭시, 개발언어, (작성자,제목,내용) 등 정보 가져와서 그걸로 검색한 글 목록 표시
		
		int count = board01service.countSearchBoard01(skil, category, search);
		m.addAttribute("count",count);
		
		return "pth/board01/search";
	}
	
}
