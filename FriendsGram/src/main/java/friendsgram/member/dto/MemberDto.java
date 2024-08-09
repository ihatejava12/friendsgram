package friendsgram.member.dto;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class MemberDto {
	@NotNull(message="id is null.")//필드 에러
	@NotEmpty(message = "id is empty.")
	private String id;
	@NotNull(message = "password is null.")
	@NotEmpty(message = "password is empty")
	private String password;
	private String name;
	private String email;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private String birth;
	private String gender;
	private String phone;
	private boolean consent;
	private boolean r_consent;
	private int sanction;
	
	

}
