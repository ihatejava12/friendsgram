package friendsgram.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("z")
	public void z () {
		System.out.println("안녕");
	}
	

}
