package friendsgram.member.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Member_ReviewDto {
	private int mr_no;
	private String content;
	private String subjects;
	private Date date;
	private int score;
	private int num;
	private String id;
	private int b_no02;

}
