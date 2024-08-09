package friendsgram.member.dto;

import lombok.Data;

@Data
public class MemberDto {
	private String id;
	private String password;
	private String name;
	private String email;
	private String birth;
	private String gender;
	private String phone;
	private boolean consent;
	private boolean r_consent;
	private int sanction;
	private int role;

}
