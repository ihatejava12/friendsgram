package friendsgram.a.pth.board03.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.pth.board03.service.Board03Service;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board03.dto.Board03Dto;
import friendsgram.board03.dto.Board03_SkilDto;

@Controller
public class Board03Controller {
	
	@Autowired
	Board03Service board03service;
	
	@GetMapping("board03/freelancer")
	public String board03Write() {
		// 프리랜서 등록 하기 
		
		
		return "pth/board03/freelancer";
	}
	
	@PostMapping("board03/freelancer")
	public String freelancerwrite(@RequestParam("skil")List<String> skils,
			@ModelAttribute("freelancer")Board03Dto freelancer
			 ,@RequestParam("id")String id) {
		// 정보 다 입력하고 프리랜서 등록하기 버튼 눌렀을때
		System.out.println(skils);
		System.out.println(freelancer.getWork_date());
		
		freelancer.setId(id);
		
		// 현재 등록된 프리랜서 수 확인
		int count = board03service.countFreelancer();
		int b_no03 = count + 1;
		freelancer.setB_no03(b_no03);
		
		// 새로운 freelancer 등록
		board03service.newFreelancer(freelancer);
		
		// freelancer 글번호 랑 skils 등록 해줘야함
		for(String skil : skils) {
		 board03service.b_no03_skil(b_no03, skil);
		}
		
		return "pth/board03/freelancerconfirm";
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
	public String board03Main(@RequestParam(name="p", defaultValue="1")int page, Model m) {
		// 프리랜서 검색 게시판 메인페이지
		int count = board03service.countFreelancer();// 현재 등록된 프리랜서 수 
		
		if(count > 0) {
			int perpage = 10; // 한페이지에 10명 프리랜서 보여줄거임
			int startRow = (page-1)*perpage;
		
			List<Board03Dto> board03list =  board03service.board03List(startRow, perpage);
			// 1페이지, 10개 보여줄 프리랜서 정보, list에 저장
			m.addAttribute("blist",board03list);
		
			List<Board03_SkilDto> skillist = board03service.skilList();
			m.addAttribute("skillist",skillist);
			
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
		
		
		return "pth/board03/main";
	}
	
	// 프리랜서 글 1개 클릭
	@GetMapping("board03/content/{no}")
	public String board03Content(@PathVariable("no")int no, Model m) {
		// 게시판 글 1개 클릭 할 경우, DB에서 프리랜서 글 정보 가져와서 화면에 뿌려줌
		Board03Dto freelancer = board03service.selectOne(no);
		m.addAttribute("freelancer",freelancer);
		
		List<Board03_SkilDto> skillist = board03service.skilList();
		m.addAttribute("skillist",skillist);
		
		return "pth/board03/content";
	}
	
	// 프리랜서 찾기
	@GetMapping("board03/search")
	public String board03Search(@RequestParam("work_type")int work_type,@RequestParam("skil")String skil, 
			@RequestParam("career")int career, @RequestParam(name="p", defaultValue="1")int page, Model m) {
		// 프리랜서 찾기 버튼 클릭시, 근무 형태(work_type), 개발언어(skil), 경력기간(career) 받아와서 DB에 검색하고 출력
		List<Integer> searchb_no03List = board03service.searchBoard03SkilList(skil);
		
		int perpage = 10; // 한페이지에 10명 프리랜서 보여줄거임
		int startRow = (page-1)*perpage;
		
		List<Board03Dto> searchfreelancerList = board03service.searchBoard03List(work_type, searchb_no03List, career, startRow,perpage);
		m.addAttribute("blist",searchfreelancerList);
		
		List<Board03_SkilDto> skillist = board03service.skilList();
		m.addAttribute("skillist",skillist);
		
		
		int count = searchfreelancerList.size();
		m.addAttribute("count",count);
		
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
		
		 m.addAttribute("work_type",work_type);
		 m.addAttribute("skil",skil);
		 m.addAttribute("career",career);
		
		
		return "pth/board03/search";
	}
	
}
