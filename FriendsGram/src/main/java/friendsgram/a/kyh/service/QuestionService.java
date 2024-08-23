package friendsgram.a.kyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.kyh.dao.QuestionDao;
import friendsgram.question.dto.QuestionDto;

@Service
public class QuestionService {
	
	@Autowired
	private QuestionDao qdao;
	
	public int qinsert(QuestionDto dto) {
		return qdao.qinsert(dto);
	}
	
	public List<QuestionDto> qlist(String keyword) {
		
		
		return qdao.qlist(keyword);
	}
	
	public QuestionDto qcontent(int q_no) {
		
		return qdao.qcontent(q_no);
	}
}
