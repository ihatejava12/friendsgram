package friendsgram.a.jhk.board02.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import friendsgram.a.jhk.board02.service.Board02CommService;
import friendsgram.a.jhk.board02.service.Board02Service;
import friendsgram.admin.dto.WordDto;
import friendsgram.board02.dto.Board02_ComentDto;

@Controller
public class Board02CommController {

	@Autowired
	Board02CommService service;
	
	@Autowired
	Board02Service cservice;
	
	@PostMapping("/insert/comm2")
	@ResponseBody
	public String insertComm2(@RequestParam("coment") String coment, @RequestParam("ref") int ref, @RequestParam("id") String id, @RequestParam("b_no02") int b_no02) {
		
		List<WordDto> wolist = cservice.wordList();
		
		String[] colist = coment.split(" ");
		List<String> clist = Arrays.asList(colist);
		String returnValue = "";
		EXIT:
		for(int i = 0; i < clist.size(); i++) {
			for(int j = 0; j < wolist.size(); j++) {
				
				System.out.println(wolist.get(j).toString());
				System.out.println(clist.get(i));
				
				if(clist.get(i).contains(wolist.get(j).toString())) {
				
					System.out.println("비교 성공");
					
					List<Board02_ComentDto> comlist = service.selectComm(b_no02);
					Gson gson = new Gson();
				
					returnValue = gson.toJson(comlist);
					break EXIT;
				} else {
					
					returnValue = "";
				}
			}
		}
		
		if(returnValue == "") {
			service.insertComm2(coment, ref, id, b_no02);
		}
		
		
		return returnValue;
		
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
	@ResponseBody
	public String insertPComm(@RequestParam("coment") String coment, @RequestParam("id") String id, @RequestParam("b_no02") int b_no02) {
		List<WordDto> wolist = cservice.wordList();
		
		String[] colist = coment.split(" ");
		List<String> clist = Arrays.asList(colist);
		
		String returnValue = "";
		EXIT:
		for(int i = 0; i < wolist.size(); i++) {
			for(int j = 0; j < clist.size(); j++) {
				if(clist.get(j).contains(wolist.get(i).toString())) {
					
					List<Board02_ComentDto> comlist = service.selectComm(b_no02);
					Gson gson = new Gson();
				
					returnValue = gson.toJson(comlist);
					break EXIT;
				} else {
					returnValue = "";
				}
			}
		}
		
		if(returnValue == "") {
			service.insertPComm(coment, id, b_no02);
			int c_no02 = service.maxC_no02();
			service.updateRef(c_no02);
		}
		
		return returnValue;
		
		
	}
	
}
