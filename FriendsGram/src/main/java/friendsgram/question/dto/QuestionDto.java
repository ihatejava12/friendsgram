package friendsgram.question.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionDto {
	private int q_no;
	private String title;
	private String content;
	private Date date;
	private boolean question_type;
	private boolean request;

	private String id;


}
