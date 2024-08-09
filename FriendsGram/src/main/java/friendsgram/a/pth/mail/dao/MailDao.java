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
}
