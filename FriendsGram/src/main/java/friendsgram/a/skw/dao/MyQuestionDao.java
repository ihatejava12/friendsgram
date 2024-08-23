package friendsgram.a.skw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import friendsgram.question.dto.QuestionDto;

@Mapper
public interface MyQuestionDao {

	@Select("select * from question where id = #{id} order by q_no desc limit #{start}, #{count}")
	List<QuestionDto> myQuestion(@Param("id") String id, @Param("start") int start, @Param("count") int count);
	
	@Select("select count(*) from question")
	int count();
	
}
