package friendsgram.a.skw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import friendsgram.question.dto.QuestionDto;

@Mapper
public interface CorporationMyQuestionDao {

	 @Select("select * from corporation_question where corporation_id = #{corporationId} order by q_no desc limit #{start}, #{count}")
	    List<QuestionDto> myCorporationQuestion(@Param("corporationId") String corporationId, @Param("start") int start, @Param("count") int count);
	    
	    @Select("select count(*) from corporation_question where corporation_id = #{corporationId}")
	    int countCorporationQuestions(@Param("corporationId") String corporationId);
}
