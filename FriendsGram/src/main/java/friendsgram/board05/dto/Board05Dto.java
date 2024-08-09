package friendsgram.board05.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Board05Dto {

	private int b_no05;
	private String title;
	private String content;
	private LocalDate date;
	private boolean work_type;
	private String work_area;
	private String salary;
	private String career_period;
	private String background;
	private String company;
	private String id;


}
