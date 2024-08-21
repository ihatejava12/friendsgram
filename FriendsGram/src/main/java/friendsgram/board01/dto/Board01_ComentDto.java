package friendsgram.board01.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Board01_ComentDto {
	private int c_no01;
	private String coment;
	private Date date;
	private int num;

	private String id;
	private int b_no01;
	private int ref;
	private int ref_level;
	private int comentlike;
}
