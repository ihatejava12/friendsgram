package friendsgram.a.jhk.admin.controller;

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

import friendsgram.a.jhk.admin.service.AdminNoticeService;
import friendsgram.admin.dto.NoticeDto;

@Controller
public class AdminNoticeController {

	@Autowired
	AdminNoticeService nservice;
	
	@PostMapping("/updatenotice")
	public String updatenotice(@RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("n_no") int n_no) {
		nservice.updateNotice(title, content, n_no);
		
		return "redirect:/adminpage/notice";
	}
	
	@GetMapping("/noticeupdate")
	public String updateform(@RequestParam("n_no") int n_no, Model m) {
		NoticeDto nolist = nservice.noticeContent(n_no);
		m.addAttribute("nolist", nolist);
		 
		return "/jhk/notice/noticeupdate";
	}
	
	@PostMapping("/insertnotice")
	public String insertNotice(@RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("id") String id) {
		nservice.insertNotice(title, content, id);
		
		return "redirect:/adminpage/notice";
	}
	
	@GetMapping("/adminpage/newnotice")
	public String newNotice() {
		return "/jhk/notice/noticenew";
	}
	
	@DeleteMapping("/deletenotice/{n_no}")
	@ResponseBody
	public String deleteNoticeOne(@PathVariable("n_no") int n_no) {
		nservice.deleteNoticeOne(n_no);
		return "";
	}
	
	@GetMapping("/adminpage/content/{n_no}")
	public String noticePage(@PathVariable("n_no") int n_no, Model m) {
		NoticeDto nlist = nservice.noticeContent(n_no);
		m.addAttribute("nlist", nlist);
		
		return "/jhk/notice/noticecontent";
	}
	
	@DeleteMapping("/notice/delete")
	@ResponseBody
	public int deleteNotice(@RequestParam("list") List<Integer> list) {
		int i = nservice.deleteNotice(list);
		return i;
	}
	
	@GetMapping("/adminpage/notice")
	public String adminNoticeList(@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		
		int count = nservice.noticeCount();
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		
		List<NoticeDto> nlist = nservice.noticeList(startRow);
		m.addAttribute("nlist", nlist);

		int pageNum = 10;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		
		}
		m.addAttribute("count", count);
		
		return "/jhk/notice/noticelist";
	}
	
}
