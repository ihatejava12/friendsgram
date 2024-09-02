package friendsgram.admin.dto;

import lombok.Data;

@Data
public class ReportDto {
	private String report_content;
	private int r_no;
	private int num;
	// 신고 한 사람
	private String id;
	private int co_no;
	private String content;
	private int report_num;
	//  신고 당한 사람
	private String r_id;
}
