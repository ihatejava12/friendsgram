package friendsgram.member.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
@Data
public class LoginDto {

	@NotNull(message="id is null.")//필드 에러
	@NotEmpty(message = "id is empty.")
	private String id;
	@NotNull(message = "password is null.")
	@NotEmpty(message = "password is empty")
	private String password;
	
}
