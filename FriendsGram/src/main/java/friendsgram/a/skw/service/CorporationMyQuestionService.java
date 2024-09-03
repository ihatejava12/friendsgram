package friendsgram.a.skw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.skw.dao.CorporationMyQuestionDao;
import friendsgram.question.dto.QuestionDto;

@Service
public class CorporationMyQuestionService {

    @Autowired
    CorporationMyQuestionDao corporationMyQuestionDao;

    public List<QuestionDto> getCorporationQuestions(String corporationId, int start, int count) {
        return corporationMyQuestionDao.myCorporationQuestion(corporationId, start, count);
    }

    public int getCorporationQuestionCount(String corporationId) {
        return corporationMyQuestionDao.countCorporationQuestions(corporationId);
    }
}