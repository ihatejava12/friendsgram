package friendsgram.a.pth.mail.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.pth.mail.dao.MailDao;
import friendsgram.mailham.dto.MailhamDto;

@Service
public class MailService {
	
	@Autowired
	MailDao maildao;
	
	public List<MailhamDto> maillist(String id,int startRow, int perpage) {
		return maildao.maillist(id,startRow, perpage);
	}
	
	
	public int count(String id) {
		return maildao.count(id);
	}
	
	
	public List<MailhamDto> sendmaillist(String id,int startRow, int perpage){
		return maildao.sendmaillist(id, startRow, perpage);
	}
	public int sendmail_count(String id) {
		return maildao.sendmail_count(id);
	}
	
	// mail 정보 1개 꺼내옴
	public MailhamDto oneMailContent(int no) {
		return maildao.oneMailContent(no);
	}

	// mail 1개 삭제
	public int mailDelete(int no) {
		return maildao.mailDelete(no);
	}
	
	
	// mail 보내기
	public int sendNewMail(MailhamDto mail) {
		return maildao.sendNewMail(mail);
	}

}
