package friendsgram.a.skw.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import friendsgram.a.pth.mail.service.MailService;
import friendsgram.a.skw.model.ResponseMessage;
import friendsgram.a.skw.service.Board04JoinService;
import friendsgram.a.skw.service.Board04Service;
import friendsgram.a.skw.service.InfoService;
import friendsgram.board04.dto.Board04Dto;
import friendsgram.mailham.dto.MailhamDto;
import friendsgram.member.dto.MemberDto;
import friendsgram.member.dto.Member_InfoDto;

	@SessionAttributes("user")
	@Controller
public class Board04Controller {
		@Autowired
		Board04Service service;
		
		@Autowired
		MailService mservice;
		
		@Autowired
		Board04JoinService joinservice;
		
		@Autowired
	    InfoService iservice;
		
		  private static final Logger logger = LoggerFactory.getLogger(Board04Controller.class);

		
		@GetMapping("/board04/write")
		public String writeForm(Model m) {
			m.addAttribute("board", new Board04Dto());
			return "skw/board04/write";
		}
		
		@PostMapping("/board04/write")
		public String write(@ModelAttribute Board04Dto board,
                @RequestParam("programming_language") List<String> programmingLanguages) {
			
			board.setDate(new Date());
			service.write(board, programmingLanguages);
			
			
				return "redirect:/list";
			}
			
		@GetMapping("/list")
		public String list(@RequestParam(name = "cousearch", defaultValue = "0") int cousearch,
                @RequestParam(name = "search", defaultValue = "") String search,
                @RequestParam(name = "p", defaultValue = "1") int page, 
                Model m) {
			
			//글이 있는지 체크
			int count = service.count(cousearch, search);
			 m.addAttribute("count", count);
			
			 if(count > 0) {
			
			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; // 인덱스 번호
			
			List<Board04Dto> board04List = service.boardSearchList(cousearch, search, startRow);
			
			for (Board04Dto board : board04List) {
                List<String> codes = service.getCodes(board.getB_no04());
                board.setCodes(codes);
			}
			m.addAttribute("board04List", board04List);

			int pageNum = 5; // 보여질 페이지 번호 수
			int totalPages = (count + perPage - 1) / perPage;
			
			int begin = ((page - 1) / pageNum) * pageNum + 1;
            int end = Math.min(begin + pageNum - 1, totalPages);
            
			 m.addAttribute("begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			
			}
			 
			 m.addAttribute("cousearch", cousearch);
		        m.addAttribute("search", search);
			return "/skw/board04/list";
		}
	
		@GetMapping("/board04/content/{b_no04}")
		public String content(@PathVariable("b_no04") int b_no04, Model m) {
			Board04Dto dto = service.boardOne(b_no04);
			m.addAttribute("dto", dto);
			return "skw/board04/content";
		}
		
		@GetMapping("/board04/updateform/{b_no04}")
		public String updateForm(@PathVariable("b_no04") int b_no04, Model m) {
			Board04Dto dto = service.boardOne(b_no04);
			m.addAttribute("dto", dto);
			return "skw/board04/updateform";
		}
		
		@PostMapping("/board04/update/{b_no04}")
		public String update(@PathVariable("b_no04") int b_no04, @ModelAttribute Board04Dto dto, @RequestParam("programming_language") List<String> programmingLanguages) {
			 dto.setB_no04(b_no04);
			 
		        service.updateBoard(dto, programmingLanguages);
			return "redirect:/list";
			// "reditect:/board/content/"+dto.getNo();
		}
		
		@DeleteMapping("/board04/delete/{b_no04}")
		@ResponseBody
		public int delete(@PathVariable("b_no04") int b_no04) {
			int i = service.deleteBoard(b_no04); 
			return i;
		}
		
		@GetMapping("/board04/search")
		public String search(@RequestParam(value = "language", required = false, defaultValue = "all") String language,
	            @RequestParam(value = "workType", required = false, defaultValue = "all") String workType,
	            @RequestParam(value = "region", required = false, defaultValue = "all") String region,
	            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
	            @RequestParam(value = "p", defaultValue = "1") int page,  // 현재 페이지
	            Model model) {
			
			int count = 10;  // 페이지당 게시글 수
	        int start = (page - 1) * count;  // 시작 인덱스 계산
			
	        List<Board04Dto> boards = service.boardListSearch(language, workType, region, keyword, start, count);
	        model.addAttribute("board04List", boards);
	        model.addAttribute("language", language);
	        model.addAttribute("workType", workType);
	        model.addAttribute("region", region);
	        model.addAttribute("keyword", keyword);

	        // 페이지네이션 관련 속성 추가
	        int totalRecords = service.countBoards(language, workType, region, keyword);
	        int totalPages = (totalRecords + count - 1) / count;
	        int pageNum = 5;
	        int begin = ((page - 1) / pageNum) * pageNum + 1;
	        int end = Math.min(begin + pageNum - 1, totalPages);

	        model.addAttribute("begin", begin);
	        model.addAttribute("end", end);
	        model.addAttribute("totalPages", totalPages);
	        model.addAttribute("page", page);

	        return "skw/board04/list";  // 검색 결과를 보여줄 JSP 페이지
	    }
	    
		@PostMapping("/board04/joinAndSendResume")
		@ResponseBody
		public ResponseMessage joinAndSendResume(@ModelAttribute("user") MemberDto user, @RequestParam("b_no04") int b_no04, @RequestBody MailhamDto request, Model m) {
		    // 지원 처리
		    boolean joinResult = joinservice.join(b_no04, request.getId());

		    // 이력서 정보 가져오기
		    Member_InfoDto memberInfo = iservice.midto(request.getId());
		    m.addAttribute("memberInfo", memberInfo);

		    // 이력서 전송 처리
		    MailhamDto mailDto = new MailhamDto();
		    mailDto.setReturn_man(request.getReturn_man());
		    mailDto.setTitle(request.getTitle());
		    
		 // 이력서 내용을 설정하는 부분
		    mailDto.setContent(String.format("이력서 내용: \n이름: %s\n생년월일: %s\n나이: %s\n성별: %s\n전화번호: %s\n이메일: %s\n주소: %s\n나머지 주소: %s\n자기소개서: %s\n학교명: %s\n학교 기간: %s\n학교 전공: %s\n경력 회사명: %s\n경력 기간: %s\n경력 담당업무: %s\n자격증 이름: %s\n자격증 취득일자: %s",
		        memberInfo.getName(), memberInfo.getBirth(), memberInfo.getAge(), memberInfo.getGender(),
		        memberInfo.getPhone(), memberInfo.getEmail(), memberInfo.getAddress(), memberInfo.getDetail_address(),
		        memberInfo.getContent(), memberInfo.getSchool_name(), memberInfo.getSchool_period(),
		        memberInfo.getSchool_major(), memberInfo.getCareer_nme(), memberInfo.getCareer_period(),
		        memberInfo.getCareer_role(), memberInfo.getCertificate_name(), memberInfo.getCertificate_date()));

		    mailDto.setId(request.getId());
		    int resumeResult = service.b_04post(mailDto);

		   
		    
		    
		    // 이력서 내용 로그 출력 (콘솔 또는 이클립스 로그에서 확인)
		    logger.info("이력서 내용: \n이름: {}\n생년월일: {}\n나이: {}\n성별: {}\n전화번호: {}\n이메일: {}\n주소: {}\n나머지 주소: {}\n자기소개서: {}\n학교명: {}\n학교 기간: {}\n학교 전공: {}\n경력 회사명: {}\n경력 기간: {}\n경력 담당업무: {}\n자격증 이름: {}\n자격증 취득일자: {}",
		                memberInfo.getName(), memberInfo.getBirth(), memberInfo.getAge(), memberInfo.getGender(),
		                memberInfo.getPhone(), memberInfo.getEmail(), memberInfo.getAddress(), memberInfo.getDetail_address(),
		                memberInfo.getContent(), memberInfo.getSchool_name(), memberInfo.getSchool_period(),
		                memberInfo.getSchool_major(), memberInfo.getCareer_nme(), memberInfo.getCareer_period(),
		                memberInfo.getCareer_role(), memberInfo.getCertificate_name(), memberInfo.getCertificate_date());

		    if (joinResult && resumeResult > 0) {
		        return new ResponseMessage("지원 및 이력서 전송이 완료되었습니다.");
		    } else {
		        return new ResponseMessage("지원 또는 이력서 전송에 실패하였습니다.");
		    }
		}
		
/*		 @GetMapping("/board04/post/{b_no04}")
		    public String post(@ModelAttribute("user") MemberDto user, @PathVariable("b_no04") int b_no04, Model m) {
		        // user 객체에서 id를 가져와서 서비스 메서드에 전달
		        Member_InfoDto minfo = service.minfo(user.getId());
		        Board04Dto cpdto = service.cpdto(b_no04);
		        
		        m.addAttribute("cpdto", cpdto);
		        m.addAttribute("dto", minfo);
		        return "kyh/board04/post";
		    }
		    
		    @PostMapping("/board04/post/{b_no04}")
		    public String sendResume(@ModelAttribute MailhamDto mdto, 
		                             @PathVariable("b_no04") int b_no04,  // URL 경로의 값을 정수로 매핑
		                             Model m) {
		    	
		    	 // `return_man` 설정 로직이 빠져있는지 확인
		        if(mdto.getReturn_man() == null || mdto.getReturn_man().isEmpty()) {
		            Board04Dto cpdto = service.cpdto(b_no04);  // 받아야 할 사람의 정보를 가져옴
		            mdto.setReturn_man(cpdto.getId());
		        }
		        
		     // `title`이 null인지 확인하고 기본값을 설정
		        if(mdto.getTitle() == null || mdto.getTitle().isEmpty()) {
		            mdto.setTitle("제목 없음");
		        }
		        
		        int result = service.b_04post(mdto);
		        if (result > 0) {
		            m.addAttribute("message", "이력서가 성공적으로 전송되었습니다.");
		        } else {
		            m.addAttribute("message", "이력서 전송에 실패하였습니다.");
		        }
		        return "redirect:/board04/content/" + b_no04;
		    }*/

			
/*			  @ResponseBody
			  @GetMapping("/board04/join") public ResponseMessage
			  join(@RequestParam("b_no04") int b_no04, @RequestParam("id") String id) {
			  boolean result = joinservice.join(b_no04, id); return new
			  ResponseMessage(result ? "지원이 완료되었습니다." : "지원에 실패했습니다."); }*/
			 
	}