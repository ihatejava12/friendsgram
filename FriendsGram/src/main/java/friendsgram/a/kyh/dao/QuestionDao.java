package friendsgram.a.kyh.dao;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import friendsgram.question.dto.QuestionDto;

@Mapper
public interface QuestionDao {
	
	@Insert("insert into question (title, content, date, question_type,id)"+ 
			"values (#{title}, #{content}, #{date}, #{question_type}, #{id})")
	int qinsert(QuestionDto qdto);

	@Select("<script>"
	        + "SELECT * FROM question "
	        + "<where>"
	        + "<if test='keyword != null and !keyword.isEmpty()'>"
	        + "title LIKE CONCAT('%', #{keyword}, '%') "
	        + "</if>"
	        + "</where>"
	        + "ORDER BY q_no DESC"
	        + "</script>")
	List<QuestionDto> qlist(@Param("keyword") String keyword);
	
	@Select("select * from question where q_no = #{q_no}")
	QuestionDto qcontent(int q_no);
	
}
