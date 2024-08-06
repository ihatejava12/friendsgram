package friendsgram.member.dto;

import lombok.Data;

@Data
public class Corporation_MemberDto {
	private String id;
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
	private boolean company_consent;

}
