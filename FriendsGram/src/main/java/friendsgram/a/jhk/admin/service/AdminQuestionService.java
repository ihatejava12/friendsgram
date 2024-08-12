package friendsgram.a.jhk.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.admin.dao.AdminQuestionDao;
import friendsgram.question.dto.QuestionDto;
import friendsgram.question.dto.Question_AnswerDto;

@Service
public class AdminQuestionService {

	@Autowired
	AdminQuestionDao dao;
	
	public QuestionDto oneQuestion(int q_no) {
		return dao.oneQeustion(q_no);
	}
	
	public int updateRequest(int q_no) {
		return dao.updateRequest(q_no);
	}
	
	public int insertAnswer(String title, String content, String id, int q_no) {
		return dao.insertAnswer(title, content, id, q_no);
	}
	
	public Question_AnswerDto questionAnswer(int q_no) {
		return dao.questionAnswer(q_no);
	}
	
	public List<QuestionDto> questionList(int searchn, String content, int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("content", content);
		m.put("start", start);
		m.put("count", 10);
		return dao.questionList(m);
	}
	
	public int questionCount(int searchn, String content) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("content", content);
		return dao.questionCount(m);
	}
	
}
