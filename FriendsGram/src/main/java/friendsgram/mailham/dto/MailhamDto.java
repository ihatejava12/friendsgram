package friendsgram.mailham.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MailhamDto {
	private int m_no;
	private String return_man;
	private String title;
	private String content;
	private Date date;
	private String id;
	private int readornot;

	
}
