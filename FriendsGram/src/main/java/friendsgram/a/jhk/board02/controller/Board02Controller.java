package friendsgram.a.jhk.board02.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.jhk.board02.service.Board02CommService;
import friendsgram.a.jhk.board02.service.Board02Service;
import friendsgram.admin.dto.ReportDto;
import friendsgram.admin.dto.WordDto;
import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_CodeDto;
import friendsgram.board02.dto.Board02_ComentDto;
import friendsgram.board02.dto.Board02_JoinDto;
import friendsgram.board02.dto.Board02_TeamDto;
import friendsgram.member.dto.MemberDto;

@Controller
@SessionAttributes("user")
public class Board02Controller {
	
	@Autowired
	Board02Service service;
	
	@Autowired
	Board02CommService cservice;
	
	@GetMapping("/reviewteam/{b_no02}")
	public String reviewTeam(@PathVariable("b_no02") int b_no02, Model m) {
		List<Board02_TeamDto> tlist = service.tList(b_no02);
		m.addAttribute("tlist", tlist);
		
		return "/jhk/review/teamlist";
	}
	
	@GetMapping("/pickcode/{b_no02}")
	public String pickCode(@PathVariable("b_no02") int b_no02, Model m) {
		List<Board02_CodeDto> picklist = service.pickCode(b_no02);
		m.addAttribute("picklist", picklist);
		Board02Dto dto = service.board02Content(b_no02);
		m.addAttribute("list", dto);
		
		return "/jhk/board02/pickcode";
	}
	
	@PostMapping("/board02/report")
	public String board02Report(ReportDto dto) {
		service.board02Report(dto);
		
		return "/jhk/board02/close";
	}
	
	@GetMapping("/reportcontent/{b_no02}")
	public String reportContent(@PathVariable("b_no02") int b_no02, Model m) {
		m.addAttribute("list", service.board02Content(b_no02));
		
		return "/jhk/board02/reportpage";
	}
	
	@DeleteMapping("/deletecontent02/{b_no02}")
	public String deleteContent(@PathVariable("b_no02") int b_no02) {
		service.deleteContent(b_no02);
		service.deleteCode(b_no02);
		
		return "redirect:/board02/main";
	}
	
	@PostMapping("/maketeam")
	@ResponseBody
	public int makeTeam(@RequestParam("list") List<String> list, @RequestParam("b_no02") int b_no02) {
		service.makeTeam(list, b_no02);
		service.updateJoinstate(b_no02);
		
		return 1;
	}
	
	@GetMapping("/teamlist/{b_no02}")
	public String listTeam(@PathVariable("b_no02") int b_no02, Model m) {
		List<Board02_JoinDto> tlist = service.teamList(b_no02);
		m.addAttribute("tlist", tlist);
		m.addAttribute("b_no02", b_no02);
		
		return "/jhk/board02/teamlist";
	}
	
	@PostMapping("/jointeam")
	public String joinTeam(@RequestParam("id") String id, @RequestParam("b_no02") int b_no02, @RequestParam("code") String code) {
		service.joinTeam(id, b_no02, code);
		return "/jhk/board02/close";
	}
	
	@PostMapping("/updateboard02")
	public String update(Board02Dto dto) {
		service.update(dto);
		
		return "redirect:/board02/main";
	}
	
	@GetMapping("/board02update/{b_no02}")
	public String board02Update(@PathVariable("b_no02") int b_no02, Model m) {
		Board02Dto dto = service.board02Content(b_no02);
		m.addAttribute("dto", dto);
		List<Board02_CodeDto> clist = service.codeList(b_no02);
		m.addAttribute("clist", clist);
		
		return "/jhk/board02/update";
	}
	
	@GetMapping("/board02content/{b_no02}")
	public String board02Content(@ModelAttribute("user") MemberDto user, @PathVariable("b_no02") int b_no02, Model m) {
		String uid = user.getId();
		
		Board02Dto dto = service.board02Content(b_no02);
		m.addAttribute("dto", dto);
		List<Board02_CodeDto> clist = service.codeList(b_no02);
		m.addAttribute("clist", clist);
		int cjoin = service.countJoin(b_no02, uid);
		m.addAttribute("cjoin", cjoin);
		int countteam = service.countTeam(b_no02);
		m.addAttribute("countteam", countteam);
		List<Board02_ComentDto> commlist = cservice.selectComm(b_no02);
		m.addAttribute("commlist", commlist);
		String id = service.id(b_no02);
		
		List<WordDto> wlist = service.wordList();
		m.addAttribute("wlist", wlist);
		
		String name = service.idName(id);
		int length = name.length();
		if (length > 2) {
			String firstName = name.substring(0,1);
			String lastName = name.substring(length-1, length);
			String middleName = "";
			for (int i = 1; i < length-1; i ++) {
				middleName += "*";
			}
			String anonymousName = firstName + middleName + lastName;
			m.addAttribute("name", anonymousName);
		} else {
			String firstName = name.substring(0,1);
			String middleName = "";
			for (int i = 1; i < length; i++) {
				middleName += "*";
			}
			String anonymousName = firstName + middleName;
			m.addAttribute("name", anonymousName);
		}
		
		
		
		return "/jhk/board02/content";
	}
	
	@PostMapping("/writeboard02")
	public String writeBoard02(@RequestParam("title") String title, @RequestParam("join_date") String join_date, 
							   @RequestParam("content") String content, @RequestParam("volunteer") int volunteer, 
							   @RequestParam("id") String id, @RequestParam("b_no02") int b_no02, 
							   @RequestParam("code") List<String> code, Model m) {
		service.writeBoard02(title, join_date, content, volunteer, id);
		service.insertTeam(id, b_no02);
		service.insertCode(code, b_no02);
		
		List<WordDto> wolist = service.wordList();
		
		String[] colist = content.split(" ");
		List<String> clist = Arrays.asList(colist);
		
		for(int i = 0; i < wolist.size(); i++) {
			for(int j = 0; j < clist.size(); j++) {
				if(clist.get(j).contains(wolist.get(i).toString())) {
					return "redirect:/newboard02";
				}
			}
		}
		
		
		return "redirect:/board02/main";
		
	}
	
	@GetMapping("/newboard02")
	public String newBoard02(Model m) {
		int b_no02 = service.maxNum();
		m.addAttribute("b_no02", b_no02);
		List<Board02_CodeDto> clist = service.codeList(b_no02);
		m.addAttribute("clist", clist);
		List<WordDto> wolist = service.wordList();
		m.addAttribute("wlist", wolist);
		
		return "/jhk/board02/newboard02";
	}
	
	@GetMapping("/board02/main")
	public String board03Main(@ModelAttribute("user") MemberDto dto, @RequestParam(value="searchn", defaultValue ="0", required = false) int searchn,@RequestParam(value="search", defaultValue="", required = false) String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.board02Count(searchn,search);
		if(count > 0) {
		
		int perPage = 13; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		String id = dto.getId();
		List<Board02_TeamDto> tlist = service.teList(id);
		m.addAttribute("tlist", tlist);
		
		List<Board02Dto> blist = service.board02List(searchn, search,startRow);
		m.addAttribute("blist", blist);
		
		int pageNum = 10;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
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
		
		return "/jhk/board02/main";
	}
	
}
