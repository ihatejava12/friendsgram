package friendsgram.a.kyh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.board05.dto.Board05Dto;
import friendsgram.board05.dto.Board05_CodeDto;
import friendsgram.mailham.dto.MailhamDto;
import friendsgram.member.dto.Member_InfoDto;

@Mapper
public interface Board05Dao {

	@Insert("INSERT INTO board05 (title, content, date, work_type, work_area, salary, career_period, background, company, id) " +
            "VALUES (#{title}, #{content}, #{date}, #{work_type}, #{work_area}, #{salary}, #{career_period}, #{background}, #{company}, #{id})")
    @Options(useGeneratedKeys = true, keyProperty = "b_no05")
    int insert(Board05Dto dto);

    // 필요할 경우 별도의 메서드로 마지막으로 삽입된 ID를 가져올 수 있습니다.
    @Select("SELECT LAST_INSERT_ID()")
    int getLastInsertId();

    @Insert({
        "<script>",
        "INSERT INTO board05_code (code, b_no05) VALUES ",
        "<foreach collection='codeList' item='codeDto' separator=','>",
        "(#{codeDto.code}, #{codeDto.b_no05})",
        "</foreach>",
        "</script>"
    })
    int insertCodes(@Param("codeList") List<Board05_CodeDto> codeList);

    @Insert("INSERT INTO board05_code (code, b_no05) VALUES (#{code}, #{b_no05})")
    int insertCode(Board05_CodeDto codeDto);

    @Select({
        "<script>",
        "SELECT COUNT(*) FROM board05",
        "<where>",
        "<if test='searchn == 1'> title LIKE CONCAT('%', #{search}, '%') </if>",
        "<if test='searchn == 2'> content LIKE CONCAT('%', #{search}, '%') </if>",
        "<if test='searchn == 3'> writer LIKE CONCAT('%', #{search}, '%') </if>",
        "</where>",
        "</script>"
    })
    int count(@Param("searchn") int searchn, @Param("search") String search);

    @Select("SELECT * FROM board05 ORDER BY b_no05 DESC LIMIT #{start}, #{count}")
    List<Board05Dto> selectList(@Param("start") int start, @Param("count") int count);

    @Select({
        "<script>",
        "SELECT * FROM board05",
        "<where>",
        "<if test='searchn == 1'> title LIKE CONCAT('%', #{search}, '%') </if>",
        "<if test='searchn == 2'> content LIKE CONCAT('%', #{search}, '%') </if>",
        "<if test='searchn == 3'> writer LIKE CONCAT('%', #{search}, '%') </if>",
        "</where>",
        "ORDER BY b_no05 DESC",
        "LIMIT #{start}, #{count}",
        "</script>"
    })
    List<Board05Dto> boardListSearch(@Param("searchn") int searchn, 
                                     @Param("search") String search, 
                                     @Param("start") int start,
                                     @Param("count") int count);

    @Select("SELECT * FROM board05 WHERE b_no05 = #{b_no05}")
    Board05Dto selectOne(int b_no05);
    
    @Update("UPDATE board05 SET title = #{title}, content = #{content}, work_type = #{work_type}, work_area = #{work_area}, salary = #{salary}, " +
            "career_period = #{career_period}, background = #{background}, company = #{company}, id = #{id} WHERE b_no05 = #{b_no05}")
    int update(Board05Dto dto);
    
    @Delete("DELETE FROM board05 WHERE b_no05 = #{no}")
    int delete(int no);
    
    
    
    // 언어 내용 목록에 넣을 sql
    @Select("SELECT code FROM board05_code WHERE b_no05 = #{b_no05}")
    List<String> selectCodesByBoardNo(int b_no05);
    
    @Delete("DELETE FROM board05_code WHERE b_no05 = #{b_no05}")
    int deleteCodesByBoardNo(int b_no05);
    
    // 검색 DAO
    @Select("<script>" +
            "SELECT DISTINCT b.* " +
            "FROM board05 b " +
            "LEFT JOIN board05_code c ON b.b_no05 = c.b_no05 " +
            "WHERE 1=1 " +  
            "<if test='language != null and language != \"all\"'>" +
            "AND c.code = #{language} " +
            "</if>" +
            "<if test='workType != null and workType != \"all\"'>" +
            "AND b.work_type = <choose>" +
            "<when test='workType == \"상주\"'>true</when>" +
            "<when test='workType == \"원격\"'>false</when>" +
            "</choose> " +
            "</if>" +
            "<if test='region != null and region != \"all\"'>" +
            "AND b.work_area = #{region} " +
            "</if>" +
            "<if test='keyword != null and !keyword.isEmpty()'>" +
            "AND (b.title LIKE CONCAT('%', #{keyword}, '%') " +
            "OR b.company LIKE CONCAT('%', #{keyword}, '%')) " +
            "</if>" +
            "ORDER BY b_no05 DESC " +  
            "LIMIT #{start}, #{count}" +  // 페이징 추가
            "</script>")
    List<Board05Dto> searchBoards(
        @Param("language") String language,
        @Param("workType") String workType,
        @Param("region") String region,
        @Param("keyword") String keyword,
        @Param("start") int start,
        @Param("count") int count
    );

    @Select("<script>" +
            "SELECT COUNT(DISTINCT b.b_no05) " +
            "FROM board05 b " +
            "LEFT JOIN board05_code c ON b.b_no05 = c.b_no05 " +
            "WHERE 1=1 " +  
            "<if test='language != null and language != \"all\"'>" +
            "AND c.code = #{language} " +
            "</if>" +
            "<if test='workType != null and workType != \"all\"'>" +
            "AND b.work_type = <choose>" +
            "<when test='workType == \"상주\"'>true</when>" +
            "<when test='workType == \"원격\"'>false</when>" +
            "</choose> " +
            "</if>" +
            "<if test='region != null and region != \"all\"'>" +
            "AND b.work_area = #{region} " +
            "</if>" +
            "<if test='keyword != null and !keyword.isEmpty()'>" +
            "AND (b.title LIKE CONCAT('%', #{keyword}, '%') " +
            "OR b.company LIKE CONCAT('%', #{keyword}, '%')) " +
            "</if>" +
            "</script>")
    int countBoards(
        @Param("language") String language,
        @Param("workType") String workType,
        @Param("region") String region,
        @Param("keyword") String keyword
    );
    
    
    @Insert("insert into Mailham (return_man, title, content, date, id) values (#{return_man}, #{title}, #{content}, NOW(), #{id})")
    int b_05post(MailhamDto mdto);
    
    @Select("select * from Member_Info where id = #{id}")
    Member_InfoDto minfo(String id);
    
    @Select("select * from Board05 where b_no05 = #{b_no05}")
    Board05Dto cpdto(int b_no05);
    
}
