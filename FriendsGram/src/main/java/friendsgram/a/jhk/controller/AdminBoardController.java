package friendsgram.a.jhk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import friendsgram.a.jhk.service.Board01Service;
import friendsgram.a.jhk.service.Board02Service;
import friendsgram.a.jhk.service.Board03Service;
import friendsgram.a.jhk.service.Board04Service;
import friendsgram.a.jhk.service.Board05Service;
import friendsgram.board01.dto.Board01Dto;
import friendsgram.board01.dto.Board01_ComentDto;
import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_ComentDto;
import friendsgram.board03.dto.Board03Dto;
import friendsgram.board04.dto.Board04Dto;
import friendsgram.board05.dto.Board05Dto;

@Controller
public class AdminBoardController {

	@Autowired
	Board01Service service01;
	
	@DeleteMapping("/delete1/{b_no01}")
	@ResponseBody
	public String delete1(@PathVariable("b_no01") int b_no01) {
		service01.deleteOneBoard01(b_no01);
		return "";
	}
	
	@GetMapping("/adminpage/content1/{b_no01}")
	public String adminPageB11(@PathVariable("b_no01") int b_no01, Model m) {
		Board01Dto blist1 = service01.oneBoard01(b_no01);
		m.addAttribute("blist1", blist1);
		
		List<Board01_ComentDto> clist1 = service01.oneComent(b_no01);
		m.addAttribute("clist1", clist1);
		
		return "/jhk/board/contentb1";
	}
	
	@GetMapping("/adminpage/board01")
	public String adminPageB1(@RequestParam(value="searchn", defaultValue ="0", required = false) int searchn,@RequestParam(value="search", defaultValue="", required = false) String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service01.countBoard01(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<Board01Dto> findlist1 = service01.findBoard01(searchn, search,startRow);
		m.addAttribute("list01", findlist1);
		
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
		
		return "/jhk/board/adminb1";
	}
	
	@DeleteMapping("/adminpage/delete1")
	@ResponseBody
	public int deleteAdmin1(@RequestParam("list") List<Integer> list) {
		int i = service01.deleteBoard01(list);
		return i;
	}
	
	
	
	
	
	@Autowired
	Board02Service service02;
	
	@DeleteMapping("/delete2/{b_no02}")
	@ResponseBody
	public String delete2(@PathVariable("b_no02") int b_no02) {
		service02.deleteOneBoard02(b_no02);
		return "";
	}
	
	@GetMapping("/adminpage/content2/{b_no02}")
	public String adminPageB22(@PathVariable("b_no02") int b_no02, Model m) {
		Board02Dto blist2 = service02.oneBoard02(b_no02);
		m.addAttribute("blist2", blist2);
		
		List<Board02_ComentDto> clist2 = service02.oneComent(b_no02);
		m.addAttribute("clist2", clist2);
		
		return "/jhk/board/contentb2";
	}
	
	@GetMapping("/adminpage/board02")
	public String adminPageB2(@RequestParam(value="searchn", defaultValue ="0", required = false) int searchn, @RequestParam(value="search", defaultValue="", required = false) String search, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service02.countBoard02(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<Board02Dto> findlist2 = service02.findBoard02(searchn, search,startRow);
		m.addAttribute("list02", findlist2);
		
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
		
		return "/jhk/board/adminb2";
	}
	
	@DeleteMapping("/adminpage/delete2")
	@ResponseBody
	public int deleteAdmin2(@RequestParam("list") List<Integer> list) {
		int i = service02.deleteBoard02(list);
		return i;
	}
	
	
	
	
	
	@Autowired
	Board03Service service03;
	
	@DeleteMapping("/delete3/{b_no03}")
	@ResponseBody
	public String delete3(@PathVariable("b_no03") int b_no03) {
		service03.deleteOneBoard03(b_no03);
		return "";
	}
	
	@GetMapping("/adminpage/content3/{b_no03}")
	public String adminPageB33(@PathVariable("b_no03") int b_no03, Model m) {
		Board03Dto blist3 = service03.oneBoard03(b_no03);
		m.addAttribute("blist3", blist3);
		
		return "/jhk/board/contentb3";
	}
	
	@GetMapping("/adminpage/board03")
	public String adminPageB3(@RequestParam(value="searchn", defaultValue ="0", required = false) int searchn, @RequestParam(value="search", defaultValue="", required = false) String search, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service03.countBoard03(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<Board03Dto> findlist3 = service03.findBoard03(searchn, search,startRow);
		m.addAttribute("list03", findlist3);
		
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
		
		return "/jhk/board/adminb3";
	}
	
	@DeleteMapping("/adminpage/delete3")
	@ResponseBody
	public int deleteAdmin3(@RequestParam("list") List<Integer> list) {
		int i = service03.deleteBoard03(list);
		return i;
	}
	
	
	
	
	
	@Autowired
	Board04Service service04;
	
	@DeleteMapping("/delete4/{b_no04}")
	@ResponseBody
	public String delete4(@PathVariable("b_no04") int b_no04) {
		service04.deleteOneBoard04(b_no04);
		return "";
	}
	
	@GetMapping("/adminpage/content4/{b_no04}")
	public String adminPageB44(@PathVariable("b_no04") int b_no04, Model m) {
		Board04Dto blist4 = service04.oneBoard04(b_no04);
		m.addAttribute("blist4", blist4);
		
		return "/jhk/board/contentb4";
	}
	
	@GetMapping("/adminpage/board04")
	public String adminPageB4(@RequestParam(value="searchn", defaultValue ="0", required = false) int searchn, @RequestParam(value="search", defaultValue="", required = false) String search, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service04.countBoard04(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<Board04Dto> findlist4 = service04.findBoard04(searchn, search,startRow);
		m.addAttribute("list04", findlist4);
		
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
		
		return "/jhk/board/adminb4";
	}
	
	@DeleteMapping("/adminpage/delete4")
	@ResponseBody
	public int deleteAdmin4(@RequestParam("list") List<Integer> list) {
		int i = service04.deleteBoard04(list);
		return i;
	}
	
	
	
	
	
	@Autowired
	Board05Service service05;
	
	@DeleteMapping("/delete5/{b_no05}")
	@ResponseBody
	public String delete5(@PathVariable("b_no05") int b_no05) {
		service05.deleteOneBoard05(b_no05);
		return "";
	}
	
	@GetMapping("/adminpage/content5/{b_no05}")
	public String adminPageB55(@PathVariable("b_no05") int b_no05, Model m) {
		Board05Dto blist5 = service05.oneBoard05(b_no05);
		m.addAttribute("blist5", blist5);
		
		return "/jhk/board/contentb5";
	}
	
	@GetMapping("/adminpage/board05")
	public String adminPageB5(@RequestParam(value="searchn", defaultValue ="0", required = false) int searchn, @RequestParam(value="search", defaultValue="", required = false) String search, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service05.countBoard05(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<Board05Dto> findlist5 = service05.findBoard05(searchn, search,startRow);
		m.addAttribute("list05", findlist5);
		
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
		
		return "/jhk/board/adminb5";
	}
	
	@DeleteMapping("/adminpage/delete5")
	@ResponseBody
	public int deleteAdmin5(@RequestParam("list") List<Integer> list) {
		int i = service05.deleteBoard05(list);
		return i;
	}
	
}
