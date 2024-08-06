package friendsgram.board02.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Board02_JoinDto {
	private int request_no;
	private Date date;
	private boolean request;
	private String id;
	private int b_no02;

}
