package friendsgram.a.pth.board03.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class Board03Controller {
	@GetMapping("board03/freelancer")
	public String board03Write() {
		// 게시판 글 새로 쓰기
		
		
		return "pth/board03/freelancer";
	}
	
	@GetMapping("board03/update/{no}")
	public String board03Update(@PathVariable("no")int no) {
		// 게시판 글번호 받아와서, 해당 글 정보, DB에서 수정
		
		
		return "pth/board03/update";
	}
	
	@GetMapping("board03/delete/{no}")
	public String board03Delete(@PathVariable("no")int no) {
		// 게시판 글번호 받아와서, 해당 글 DB에서 삭제
		
		return "pth/board03/delete";
	}
	
	@GetMapping("board03/main")
	public String board03Main() {
		// 프리랜서 검색 게시판 메인페이지
		
		
		return "pth/board03/main";
	}
	
	@GetMapping("board03/content/{no}")
	public String board03Content(@PathVariable("no")int no) {
		// 게시판 글 1개 클릭 할 경우, DB에서 글정보,댓글정보 가져와서 화면에 뿌려줌
		
		return "pth/board03/content";
	}
	
	@GetMapping("board03/search")
	public String board03Search() {
		// 검색 버튼 클릭시, 개발언어, (작성자,제목,내용) 등 정보 가져와서 그걸로 검색한 글 목록 표시
		
		return "pth/board03/search";
	}
	
}
