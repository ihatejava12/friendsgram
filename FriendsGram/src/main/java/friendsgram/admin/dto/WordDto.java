package friendsgram.admin.dto;

import lombok.Data;

@Data
public class WordDto {
	private String word;
	
	public void setWord(String word) {
		this.word = word;
	}
	
	public String getWord() {
		return word;
	}
	
	public WordDto(String word) {
		this.word = word;
	}

	@Override
	public String toString() {
		return word;
	}
}
