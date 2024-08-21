package friendsgram.a.pth.board01.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.pth.board01.service.Board01Service;
import friendsgram.admin.dto.ReportDto;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board01.dto.Board01_ComentDto;
import friendsgram.board01.dto.Coment_LikeDto;
import friendsgram.member.dto.Corporation_MemberDto;
import friendsgram.member.dto.MemberDto;

@SessionAttributes("user")
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
	
	
	@GetMapping("board01/coment/write")
	public String board01ComentWrite(@ModelAttribute("coment")Board01_ComentDto coment, Model m) {
		
		int no = coment.getB_no01();
		
		if(coment.getRef() == 0) {// 대댓글이 아니라, 새로운 댓글일 경우. ref가 0임. ref_level 0 임
		
			// 댓글 insert
			board01service.writeBoard01Coment(coment);
			// 방금 insert한 댓글의 c_no01 번호 가져옴(가장 큰 번호일테니 Max)
			int c_no01 = board01service.selectMaxComentNumber();
		
			String id = coment.getId();
			String coment01 = coment.getComent();
		
			// 방금 insert한 댓글에 ref 를 c_no01 과 똑같게 바로 업데이트
			board01service.updateComentRef(id, coment01, c_no01);
		
		
		
		}else {// 대댓글일 경우, ref가 값이 이미 존재함. ref_level 이 1임
			board01service.writeBoard01Coment(coment);
		}
		
		return "redirect:/board01/content/"+no;
	
	}
	
	@ResponseBody
	@GetMapping("board01/coment/like")
	String truefalseComentLike(@RequestParam("id")String id, @RequestParam("c_no01")int c_no01) {
		// id와 댓글 고유번호 가져가서, 추천 Table에 해당 조합이 있는지 확인 True / False
		int i = board01service.trueFalseComentLike(id, c_no01);
		// 이미 사용자가 그 댓글을 추천을 했다면 1,  한적이 없다면 0 
		
		return i+"";
	}
	
	@ResponseBody
	@GetMapping("board01/coment/likeconfirm")
	public String comentLikeConfirm(@RequestParam("id")String id, @RequestParam("c_no01")int c_no01) {
		// id와 댓글 고유번호 받아와서, 추천 Table에 추가
		board01service.comentLikeConfirm(id, c_no01);
		// 해당 댓글의 like수 +1 
		board01service.addComentLikeNumber(c_no01);
		
		return "y";
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
	
	
	// 댓글 번호 받아와서 해당 댓글 삭제
	@GetMapping("/board01/coment/delete/{no}/{bno}")
	public String board01ComentDelete(@PathVariable("no")int no, @PathVariable("bno")int bno) {
			
		Board01_ComentDto oneComent = board01service.selectOneComent(no);
		int ref_level = oneComent.getRef_level();
		int ref = oneComent.getRef();
		
		int count = board01service.findComentRef(ref);// 해당 댓글의 ref 값이랑 같은 댓글이 몇개 있는지 
		if(ref_level == 0 && count > 1) {
			// 대댓글이 1개이상 달려있는 댓글 이라는 뜻
			// 삭제하면 댓글정렬에 문제가 생기기때문에, 업데이트로 내용을 바꾼다
			board01service.updateDeleteComent(no);
			
		}else {// 그냥 삭제해도 되는 댓글일 경우, DB에서 바로 삭제
				board01service.deleteComent(no);
		}
		
		return "redirect:/board01/content/"+bno;
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
	public String board01Content(@PathVariable("no")int no, Model m, @ModelAttribute("user")Object member) {
		// 글 조회수 +1
		//board01service.addReadCount(no);
		
		Date newdate = new Date();
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		String clickdate = simple.format(newdate);
		
		String id = null;
		if( member instanceof MemberDto ) {
			MemberDto m_member = (MemberDto)member;
			id = m_member.getId();
		
		}else if( member instanceof Corporation_MemberDto ) {
			Corporation_MemberDto c_member = (Corporation_MemberDto)member;
			id = c_member.getId();
		}
		
		int check = board01service.checkOnedayRead(no, id, clickdate);
		// check = 1이면 이미 오늘 한번 이 글을 클릭했음. 0 이면 오늘 처음
		// check = 0 일때만, 조회수 1 증가
		if(check == 0 ) {
			board01service.insertReadCountTable(no, id, clickdate);// readcount Table에 record 추가했음
			board01service.addReadCount(no);// 조회수 1증가
			}
		
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
	
	
	@GetMapping("/board01/searchcontent")
	public String board01Search(@RequestParam("skil")String skil, @RequestParam("category")String category, 
			@RequestParam("search")String search, @RequestParam("addskil")String addskil
			,@RequestParam(name="p", defaultValue="1")int page, Model m) {
		System.out.println(search);
		
		// 검색 버튼 클릭시, 개발언어, (작성자,제목,내용) 등 정보 가져와서 그걸로 검색한 글 목록 표시
		if(skil.equals("other")) {// 기타를 눌러서 직접 입력했을 경우 
			skil = addskil;		
		}
		
		int count = board01service.countSearchBoard01(skil, category, search);
		m.addAttribute("count",count);// 검색조건으로 찾은 모든 글의 개수. 페이징에 이용할거임 
		
		// 한 페이지에 10개 글만 보여줄거라서, 10개를 따로 뽑아와야함
		if(count > 0) {
			int perpage = 10; // 한페이지에 10개의 글 보여줄거임
			int startRow = (page-1)*perpage;
		
			List<Board01Dto> board01list = board01service.SearchBoard01(skil, category, search, startRow, perpage);
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
		
		}
		
		return "pth/board01/search";
	}
	
}
