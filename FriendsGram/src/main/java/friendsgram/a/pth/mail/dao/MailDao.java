package friendsgram.a.pth.mail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import friendsgram.mailham.dto.MailhamDto;

@Mapper
public interface MailDao {

	List<MailhamDto> maillist(@Param("id")String id, @Param("startRow")int startRow, @Param("perpage")int perpage);
	int count(String id);

	List<MailhamDto> sendmaillist(@Param("id")String id, @Param("startRow")int startRow, @Param("perpage")int perpage);
	int sendmail_count(String id);
	
	MailhamDto oneMailContent(int no);
	
	//쪽지 번호 받아와서 DB에서 delete
	int mailDelete(int no);
	
	
	int sendNewMail(MailhamDto mail);
	
	
	// id 받아와서 메일 중에 받는 사람이 id 인 메일중에, readornot 이 0인 메일의 개수
	int numberOfNotreadMail(String id);
	
	
	// mail 번호 1개 받아와서, 해당 메일 클릭했을때, readofnot 을 0 에서 1로 업데이트
	int updateMailReadorNot(int no);
	
}
