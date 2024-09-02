package friendsgram.member.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class Corporation_MemberDto {
	@NotNull(message="id is null.")//필드 에러
	@NotEmpty(message = "id is empty.")
	private String id;
	@NotNull(message = "password is null.")
	@NotEmpty(message = "password is empty")
	private String password;
	private String name;
	private String company;
	private int scale;
	private String business_number;
	private String boss_name;
	private String address;
	private String email;
	private String company_number;
	private boolean consent;
	private int company_consent;
	private int role;
	private String detail_address;
	private String birth;
	private String gender;
	private String phone;
}
