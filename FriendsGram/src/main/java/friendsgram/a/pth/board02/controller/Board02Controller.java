package friendsgram.a.pth.board02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class Board02Controller {
	@GetMapping("board02/write")
	public String board02Write() {
		// 게시판 글 새로 쓰기
		
		
		return "pth/board02/write";
	}
	
	@GetMapping("board02/update/{no}")
	public String board02Update(@PathVariable("no")int no) {
		// 게시판 글번호 받아와서, 해당 글 정보, DB에서 수정
		
		
		return "pth/board02/update";
	}
	
	@GetMapping("board02/delete/{no}")
	public String board02Delete(@PathVariable("no")int no) {
		// 게시판 글번호 받아와서, 해당 글 DB에서 삭제
		
		return "pth/board02/delete";
	}
	
	@GetMapping("board02/main")
	public String board02Main() {
		// 프리랜서 검색 게시판 메인페이지
		
		
		return "pth/board02/main";
	}
	
	@GetMapping("board02/content/{no}")
	public String board02Content(@PathVariable("no")int no) {
		// 게시판 글 1개 클릭 할 경우, DB에서 글정보,댓글정보 가져와서 화면에 뿌려줌
		
		return "pth/board02/content";
	}
	
	@GetMapping("board02/search")
	public String board02Search() {
		// 검색 버튼 클릭시, 개발언어, (작성자,제목,내용) 등 정보 가져와서 그걸로 검색한 글 목록 표시
		
		return "pth/board02/search";
	}
	
}
