package friendsgram.board03.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Board03Dto {
	private int b_no03;
	private String content;
	private String portfolio;
	private int career;
	private String id;
	private int work_type;
	
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date work_date;
	private Date date;
	private String name;
	private String phone;
	private String email;
	

}
