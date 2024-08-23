package friendsgram.a.kyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.kyh.dao.QuestionDao;
import friendsgram.question.dto.QuestionDto;
import friendsgram.question.dto.Question_AnswerDto;

@Service
public class QuestionService {

    @Autowired
    private QuestionDao qdao;

    public int qinsert(QuestionDto dto) {
        return qdao.qinsert(dto);
    }

    public QuestionDto qcontent(int q_no) {
        return qdao.qcontent(q_no);
    }

    public Question_AnswerDto qacontent(int q_no) {
        return qdao.qacontent(q_no);
    }

    public List<QuestionDto> mylist(String id) {
        return qdao.mylist(id);
    }

    public List<QuestionDto> pageList(String search, int start) {
        int perPage = 10;
        return qdao.pageList(search, start, perPage);
    }

    public int count(String search) {
        return qdao.count(search);
    }
}


