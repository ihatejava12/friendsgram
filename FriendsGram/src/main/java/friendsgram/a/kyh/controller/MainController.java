package friendsgram.a.kyh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/main")
	public String board01() {
		return "/kyh/main/main";
	}
 
}
