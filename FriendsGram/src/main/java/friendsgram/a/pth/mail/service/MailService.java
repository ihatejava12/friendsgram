package friendsgram.a.pth.mail.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	
	// id 받아와서 메일 중에 받는 사람이 id 인 메일중에, readornot 이 0인 메일의 개수
	public	int numberOfNotreadMail(String id) {
		return maildao.numberOfNotreadMail(id);
	}
	
	// mail 번호 1개 받아와서, 해당 메일 클릭했을때, readofnot 을 0 에서 1로 업데이트
	public	int updateMailReadorNot(int no) {
		return maildao.updateMailReadorNot(no);
	}
	
	
	// 삭제할 mail 번호가 담긴 List<integer> 받아서, mailham 에서 해당 메일들 삭제
	public	int deleteChoicesMail(List<Integer> int_choi) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("choices", int_choi);
		return maildao.deleteChoicesMail(m);
	}
	
}
