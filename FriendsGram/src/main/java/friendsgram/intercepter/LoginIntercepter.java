package friendsgram.intercepter;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.servlet.HandlerInterceptor;

import friendsgram.member.dto.Corporation_MemberDto;
import friendsgram.member.dto.MemberDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginIntercepter implements HandlerInterceptor{
	
	public List<String> loginEssential = Arrays.asList("/**");
	
	public List<String> loginInessential = Arrays.asList("/main","/login","/loginform","/corporationinsert","/coridCheck","/insertCor","/corporationloginform","/insert","/idCheck","/send","/findpw","/findpwresult","/cofindpw","/findcorpwresult");
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    HttpSession session = request.getSession();
	    Object user = session.getAttribute("user");

	    if (user instanceof MemberDto) {
	        MemberDto member = (MemberDto) user;
	        if (member.getId() != null) {
	            return true;
	        }
	    } else if (user instanceof Corporation_MemberDto) {
	        Corporation_MemberDto corporationMember = (Corporation_MemberDto) user;
	        if (corporationMember.getId() != null) {
	            return true;
	        }
	    }

	    // 로그인되지 않은 경우
	    response.sendRedirect("/main");
	    return false;
	}
}
