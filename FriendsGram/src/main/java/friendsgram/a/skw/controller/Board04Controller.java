package friendsgram.a.skw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.skw.service.Board04Service;
import friendsgram.board04.dto.Board04Dto;
import friendsgram.member.dto.MemberDto;


	@SessionAttributes("user")
	@Controller
public class Board04Controller {
		@Autowired
		Board04Service service;
		
		
		
		@ModelAttribute("user")
		public MemberDto getDto() {
			return new MemberDto();
		}
		
		@GetMapping("/write")
		public String writeForm(@ModelAttribute("user") MemberDto dto ) {
			return "skw/board04/write";
		}
		
		@PostMapping("/write")
		public String write(@ModelAttribute("board") @Validated Board04Dto dto, BindingResult error) {
			if(error.hasErrors()) {
				error.reject("nocode", "제목이 없습니다");
				return "skw/board04/write";
			}
			
			service.insert(dto);
			return "redirect:/skw/board04/list";// 글목록
		}
		//요청 page 번호를 받아서 페이지에 맞는 글을 갯수에 맞게 꺼내옴
		//전체 글 갯수에 맞춰 페이징 처리
		@GetMapping("/list")
		public String list(@RequestParam(name="p", defaultValue = "1") int page, Model m ) {
			
			//글이 있는지 체크
			int count = service.count();
			if(count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; // 인덱스 번호
			
			List<Board04Dto> boardList = service.boardList(startRow, perPage);
			
			m.addAttribute("bList", boardList);

			int pageNum = 5; // 보여질 페이지 번호 수
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			 m.addAttribute("begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			
			}
			m.addAttribute("count", count);
			return "/skw/board04/list";
		}
		
		@GetMapping("board04/content/{no}")
		public String content(@ModelAttribute("user")MemberDto user, @PathVariable("no") int no, Model m) {
			Board04Dto dto = service.boardOne(no);
			m.addAttribute("dto", dto);
			
			
			return "skw/board04/content";
		}
		
		@GetMapping("board04/update/{no}")
		public String updateForm(@PathVariable("no") int no, Model m) {
			Board04Dto dto = service.boardOne(no);
			m.addAttribute("dto", dto);
			return "skw/board04/updateForm";
		}
		
		@PutMapping("/board04/update")
		public String update(Board04Dto dto) {
			service.updateBoard(dto);
			return "redirect:list";
			// "reditect:/board/content/"+dto.getNo();
		}
		
		@DeleteMapping("/skw/board04/delete")
		@ResponseBody
		public int delete(@RequestParam("no") int no) {
			int i = service.deleteBoard(no); 
			return i;
		}
		
		@GetMapping("/skw/board04/search")
		public String search(@RequestParam("searchn") int searchn, @RequestParam("search") String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
			
			int count = service.countSearch(searchn, search);
			
			if(count> 0) {
				int perPage = 10; //한 페이지에 보일 글의 갯수
				
				int startRow = (page -1) * perPage;
				
				int endRow = page * perPage;
				
				List<Board04Dto> boardList = service.boardListSearch(searchn, search, startRow, perPage);
				
				m.addAttribute("bList", boardList);
				
				int pageNum = 5;
				
				int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
				
				int begin = (page -1) / pageNum * pageNum + 1;
				
				int end = begin + pageNum - 1;
				
				if(end > totalPages) { 
					end = totalPages;
				}
				m.addAttribute("begin", begin);
				m.addAttribute("pageNum", pageNum);
				m.addAttribute("totalPages", totalPages);
				m.addAttribute("end", end);
			}
			m.addAttribute("count", count);
			m.addAttribute("searchn", searchn);
			m.addAttribute("search", search);
			
			return "skw/board04/search";
		}
		

}
