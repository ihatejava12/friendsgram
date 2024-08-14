package friendsgram.a.jhk.board02.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import friendsgram.a.jhk.board02.service.Board02CommService;

@Controller
public class Board02CommController {

	@Autowired
	Board02CommService service;
	
	@PostMapping("/insertcomm02")
	public int insertPComm() {
		
		return 1;
	}
	
}
