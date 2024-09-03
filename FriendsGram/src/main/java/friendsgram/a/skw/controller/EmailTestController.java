package friendsgram.a.skw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailTestController {
	 @Autowired
	    private JavaMailSender mailSender;

	    @GetMapping("/sendTestEmail")
	    @ResponseBody
	    public String sendTestEmail() {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo("limbyung6260@naver.com");  // 테스트 이메일 주소로 변경
	        message.setSubject("Test Mail");
	        message.setText("This is a test mail.");
	        mailSender.send(message);
	        
	        return "Test email sent!";
	    }
	}

