package friendsgram.a.kyh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import friendsgram.question.dto.QuestionDto;
import friendsgram.question.dto.Question_AnswerDto;

@Mapper
public interface QuestionDao {

    @Insert("insert into question (title, content, date, question_type,request, id) values (#{title}, #{content}, #{date}, #{question_type}, False ,#{id})")
    int qinsert(QuestionDto qdto);

    @Select("select * from question where id = #{id} ORDER BY q_no DESC")
    List<QuestionDto> mylist(String id);

    @Select("select * from question where q_no = #{q_no}")
    QuestionDto qcontent(int q_no);

    @Select("select * from question_answer where q_no = #{q_no}")
    Question_AnswerDto qacontent(int q_no);

    @Select("<script>"
            + "SELECT count(*) FROM question "
            + "<where>"
            + "<if test='search != null and !search.isEmpty()'>"
            + " title LIKE concat('%', #{search}, '%')"
            + "</if>"
            + "</where>"
            + "</script>")
    int count(@Param("search") String search);

    @Select("<script>"
            + "SELECT * FROM question "
            + "<where>"
            + "<if test='search != null and !search.isEmpty()'>"
            + " title LIKE concat('%', #{search}, '%')"
            + "</if>"
            + "</where>"
            + " ORDER BY q_no DESC LIMIT #{start}, #{count}"
            + "</script>")
    List<QuestionDto> pageList(@Param("search") String search, @Param("start") int start, @Param("count") int count);
}
