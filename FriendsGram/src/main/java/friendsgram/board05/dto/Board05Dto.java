package friendsgram.board05.dto;


import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Board05Dto {

	private int b_no05;
	private String title;
	private String content;
	private Date date;
	private boolean work_type;
	private String work_area;
	private String salary;
	private String career_period;
	private String background;
	private String company;
	private String id;
	private List<String> codes; // 새로 추가된 필드
}
