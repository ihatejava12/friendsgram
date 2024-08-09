package friendsgram.admin.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto {
	private int n_no;
	private String title;
	private String content;
	private Date date;
	private String id;


}
