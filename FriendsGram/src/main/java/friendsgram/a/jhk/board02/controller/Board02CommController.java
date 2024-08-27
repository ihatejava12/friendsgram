package friendsgram.a.jhk.board02.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.jhk.board02.service.Board02CommService;
import friendsgram.board02.dto.Board02_ComentDto;

@Controller
public class Board02CommController {

	@Autowired
	Board02CommService service;
	
	@PostMapping("/insert/comm2")
	public String insertComm2(@RequestParam("coment") String coment, @RequestParam("ref") int ref, @RequestParam("id") String id, @RequestParam("b_no02") int b_no02) {
		service.insertComm2(coment, ref, id, b_no02);
		
		return "";
	}
	
	@GetMapping("/reportcoment/{c_no02}")
	public String reportComm(@PathVariable("c_no02") int c_no02, Model m) {
		Board02_ComentDto dto = service.selectOneComm(c_no02);
		m.addAttribute("dto", dto);
		
		return "/jhk/board02/reportpagecomm";
	}
	
	@GetMapping("/deletecomm03/{ref}")
	public String deleteComm03(@PathVariable("ref") int ref) {
		service.deleteRef(ref);
		
		return "";
	}
	
	@GetMapping("/deletecomm02/{c_no02}")
	public String deleteComm02(@PathVariable("c_no02") int c_no02) {
		service.deleteComm02(c_no02);
		
		return "";
	}
	
	@PostMapping("/insertcomm02")
	public String insertPComm(@RequestParam("coment") String coment, @RequestParam("id") String id, @RequestParam("b_no02") int b_no02) {
		service.insertPComm(coment, id, b_no02);
		int c_no02 = service.maxC_no02();
		service.updateRef(c_no02);
		
		return "";
	}
	
}
