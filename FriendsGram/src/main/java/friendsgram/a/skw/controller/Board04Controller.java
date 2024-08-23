package friendsgram.a.skw.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.pth.mail.service.MailService;
import friendsgram.a.skw.model.ResponseMessage;
import friendsgram.a.skw.service.Board04JoinService;
import friendsgram.a.skw.service.Board04Service;
import friendsgram.board04.dto.Board04Dto;
import friendsgram.board04.dto.Board04_JoinDto;
import friendsgram.member.dto.Corporation_MemberDto;

	@SessionAttributes("user")
	@Controller
public class Board04Controller {
		@Autowired
		Board04Service service;
		
		@Autowired
		MailService mservice;
		
		@Autowired
		Board04JoinService joinservice;
		
		@GetMapping("/board04/write")
		public String writeForm(@ModelAttribute("user") Corporation_MemberDto cdto) {
			return "skw/board04/write";
		}
		
		@PostMapping("/board04/write")
		public String writeForm(@ModelAttribute("user") Corporation_MemberDto cdto, @Validated Board04Dto dto) {
			service.write(dto);
			dto.setDate(new Date());
				return "redirect:/list";
			}
			
		@GetMapping("/list")
		public String list(@RequestParam(name="p", defaultValue = "1") int page, Model m ) {
			
			//글이 있는지 체크
			int count = service.count();
			if(count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; // 인덱스 번호
			
			List<Board04Dto> board04List = service.boardList(startRow);
			
			m.addAttribute("board04list", board04List);

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
	
		@GetMapping("/board04/content/{b_no04}")
		public String content(@PathVariable("b_no04") int b_no04, Model m) {
			Board04Dto dto = service.boardOne(b_no04);
			m.addAttribute("dto", dto);
			return "skw/board04/content";
		}
		
		@GetMapping("/board04/updateform/{b_no04}")
		public String updateForm(@PathVariable("b_no04") int b_no04, Model m) {
			Board04Dto dto = service.boardOne(b_no04);
			m.addAttribute("dto", dto);
			return "skw/board04/updateform";
		}
		
		@PostMapping("/board04/update/{b_no04}")
		public String update(@PathVariable("b_no04") int b_no04, @ModelAttribute Board04Dto dto) {
			service.updateBoard(dto);
			return "redirect:/list";
			// "reditect:/board/content/"+dto.getNo();
		}
		
		@DeleteMapping("/board04/delete/{b_no04}")
		@ResponseBody
		public int delete(@PathVariable("b_no04") int b_no04) {
			int i = service.deleteBoard(b_no04); 
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
		
		 @ResponseBody
		 @GetMapping("/board04/join")
		    public ResponseMessage join(@RequestParam("b_no04")int b_no04,@RequestParam("id")String id) {
		        boolean result = joinservice.join(b_no04, id);
		        return new ResponseMessage(result ? "지원이 완료되었습니다." : "지원에 실패했습니다.");
		
		 }
}
