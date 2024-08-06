package friendsgram.admin.dto;

import lombok.Data;

@Data
public class AdminDto {
	private String id;
	private String password;
	private String email;
	private String phone;
	private int rating;

}
