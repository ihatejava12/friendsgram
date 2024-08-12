package friendsgram.intercepter;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.servlet.HandlerInterceptor;

import friendsgram.member.dto.MemberDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class LoginIntercepter implements HandlerInterceptor{
	
	public List<String> loginEssential = Arrays.asList("");
	
	public List<String> loginInessential = Arrays.asList("");
	
	@Override
	public boolean
	preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	MemberDto dto = (MemberDto)
	request.getSession().getAttribute("user");
	
	if(dto != null && dto.getId() != null) {
		return true;
	}else {
		response.sendRedirect("/main");
		return false;
	}
	}
}
