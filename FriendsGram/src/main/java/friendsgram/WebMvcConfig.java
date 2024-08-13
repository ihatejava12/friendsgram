package friendsgram;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import friendsgram.intercepter.LoginIntercepter;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginIntercepter())
                .addPathPatterns("/**") // 모든 경로에 인터셉터 적용
                .excludePathPatterns("/main","/login","/loginform", "/error","/css/**", "/js/**", "/images/**"); // 로그인 페이지와 에러 페이지는 제외
    }
}
