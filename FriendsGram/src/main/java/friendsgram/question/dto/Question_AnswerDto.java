package friendsgram.question.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Question_AnswerDto {
	private int anwer_no;
	private String title;
	private String content;
	private Date date;

	private String id;
	private int a_no;

}
