package friendsgram.a.skw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.skw.dao.MyQuestionDao;
import friendsgram.question.dto.QuestionDto;

@Service
public class MyQuestionService {
	
	@Autowired
	MyQuestionDao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List<QuestionDto> myQuestion(String id, int start){
		int count = 10;
		
		return dao.myQuestion(id, start, count);
	}
	
}
