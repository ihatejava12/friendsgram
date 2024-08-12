package friendsgram.a.jhk.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.admin.dao.AdminWordDao;
import friendsgram.admin.dto.WordDto;

@Service
public class AdminWordService {
	
	@Autowired
	AdminWordDao dao;
	
	public int deleteWords(List<String> list) {
		return dao.deleteWords(list);
	}
	
	public int insertWord(String word) {
		return dao.insertWord(word);
	}
	
	public List<WordDto> allWord(){
		return dao.allWord();
	}
	
}
