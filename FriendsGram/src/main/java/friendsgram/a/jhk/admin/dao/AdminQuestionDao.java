package friendsgram.a.jhk.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.question.dto.QuestionDto;
import friendsgram.question.dto.Question_AnswerDto;

@Mapper
public interface AdminQuestionDao {
	
	@Select("select * from question where q_no = #{q_no}")
	QuestionDto oneQeustion(int q_no);
	
	@Update("update question set request = 1 where q_no = #{q_no}")
	int updateRequest(int q_no);
	
	@Insert("insert into question_answer (title, content, date, id, q_no) values (#{title}, #{content}, now(), #{id}, #{q_no})")
	int insertAnswer(@Param("title") String title, @Param("content") String content, @Param("id") String id, @Param("q_no") int q_no);
	
	@Select("select * from question_answer where q_no = #{q_no}")
	Question_AnswerDto questionAnswer(int q_no);
	
	@Select({"<script>",
				"select * from question ",
				"<where>",
					"<choose>",
						"<when test=\"searchn == 0\"> question_type = 0 </when>",
						"<when test=\"searchn == 1\"> question_type = 1 </when>",
						"<when test=\"searchn == 2\"> question_type = 2 </when>",
					"</choose>",
					"and content like concat('%',#{content},'%')",
				"</where>",		 
				"order by request limit #{start} , #{count}",
			"</script>"})
	List<QuestionDto> questionList(Map<String, Object> m);
	
	@Select({"<script>",
				"select count(*) from question ",
					"<where>",
						"<choose>",
							"<when test=\"searchn == 0\"> question_type = 0 </when>",
							"<when test=\"searchn == 1\"> question_type = 1 </when>",
							"<when test=\"searchn == 2\"> question_type = 2 </when>",
						"</choose>",
					"and content like concat('%',#{content},'%')",
				"</where>",		 
			"</script>"})
	int questionCount(Map<String, Object> m);
	
}
