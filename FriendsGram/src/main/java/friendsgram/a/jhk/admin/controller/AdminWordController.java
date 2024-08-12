package friendsgram.a.jhk.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import friendsgram.a.jhk.admin.service.AdminWordService;
import friendsgram.admin.dto.WordDto;

@Controller
public class AdminWordController {
	
	@Autowired
	AdminWordService wservice;
	
	@DeleteMapping("/deleteword")
	@ResponseBody
	public int deleteWrod(@RequestParam("list") List<String> list) {
		int i = wservice.deleteWords(list);
		return i;
	}
	
	@PostMapping("/insertword")
	@ResponseBody
	public String insertWord(@RequestParam("word") String word) {
		wservice.insertWord(word);
		return "";
	}
	
	@GetMapping("/adminpage/wordlist")
	public String wordList(Model m) {
		List<WordDto> wlist = wservice.allWord();
		m.addAttribute("wlist", wlist);
		
		return "/jhk/word/wordlist";
	}
	
}
