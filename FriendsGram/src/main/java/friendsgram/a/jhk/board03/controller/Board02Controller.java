package friendsgram.a.jhk.board03.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import friendsgram.a.jhk.board03.service.Board02Service;
import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_CodeDto;

@Controller
public class Board02Controller {
	
	@Autowired
	Board02Service service;
	
	@PostMapping("/writeboard02")
	public String writeBoard02(@RequestParam("title") String title, @RequestParam("join_date") String join_date, 
							   @RequestParam("content") String content, @RequestParam("volunteer") int volunteer, 
							   @RequestParam("id") String id, @RequestParam(value="code", defaultValue="", required=false) String code) {
		service.writeBoard02(title, join_date, content, volunteer, id);
		System.out.println();
		
		return "redirect:/board02/main";
	}
	
	@GetMapping("/gotomain/{b_no02}")
	public String deleteAllCode(@PathVariable("b_no02") int b_no02) {
		service.deleteAllCode(b_no02);
		return "redirect:/board02/main";
	}
	
	@PostMapping("/insertcode")
	@ResponseBody
	public String codList(@RequestParam("code") String code, @RequestParam("b_no02") int b_no02) {
		System.out.println(code);
		System.out.println(b_no02);
		service.insertCode(code, b_no02);
		return "";
	}
	
	@GetMapping("/newboard02")
	public String newBoard02(Model m) {
		int b_no02 = service.maxNum();
		m.addAttribute("b_no02", b_no02);
		List<Board02_CodeDto> clist = service.codeList(b_no02);
		m.addAttribute("clist", clist);
		
		return "/jhk/board02/newboard02";
	}
	
	@GetMapping("/board02/main")
	public String board03Main(Model m) {
		List<Board02Dto> blist = service.board03List();
		m.addAttribute("blist", blist);
		
		return "/jhk/board02/main";
	}
	
}
