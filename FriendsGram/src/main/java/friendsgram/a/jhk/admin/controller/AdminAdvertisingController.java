package friendsgram.a.jhk.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friendsgram.a.jhk.admin.service.AdminAdvertisingService;
import friendsgram.advertising.dto.AdvertisingDto;
import friendsgram.advertising.dto.Advertising_AnswerDto;
import friendsgram.member.dto.MemberDto;

@Controller
public class AdminAdvertisingController {

	@Autowired
	AdminAdvertisingService aservice;
	
	@PostMapping("/advertisinganswer")
	public String advertisingAnswer(Advertising_AnswerDto dto) {
		aservice.advertisingAnswer(dto);
		aservice.davertisingUpdate(dto.getA_no());
		
		return "redirect:/adminpage/advertisinglist";
	}
	
	@GetMapping("/advertising/write/{a_no}")
	public String advertisingWrite(@PathVariable("a_no") int a_no, Model m) {
		m.addAttribute(a_no);
		
		return "/jhk/advertising/advertisingwrite";
	}
	
	@GetMapping("/advertising/{a_no}")
	public String advertisingContent(@PathVariable("a_no") int a_no, Model m) {
		AdvertisingDto dto = aservice.advertisingContent(a_no);
		m.addAttribute("dto", dto);
		
		return "/jhk/advertising/advertisingcontent";
	}
	
	@GetMapping("/adminpage/advertisinglist")
	public String advertisingList(@RequestParam(value="search", defaultValue="", required=false) String search, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = aservice.count(search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<AdvertisingDto> alist = aservice.advertisingList(search, startRow);
		m.addAttribute("alist", alist);

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
		m.addAttribute("search", search);
		
		return "/jhk/advertising/advertisinglist";
	}
	
}
