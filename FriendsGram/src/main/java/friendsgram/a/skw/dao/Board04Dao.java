package friendsgram.a.skw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.board04.dto.Board04Dto;
import friendsgram.board04.dto.Board04_CodeDto;
import friendsgram.mailham.dto.MailhamDto;
import friendsgram.member.dto.Member_InfoDto;

@Mapper
public interface Board04Dao {
	
	@Insert("insert into board04(title,content,date,join_date,join02,work_type,volunteer,salary,employment_date,employment_start,career_period,id)"+
			"values(#{title},#{content},now(),#{join_date},#{join02},#{work_type},#{volunteer},#{salary},#{employment_date},#{employment_start},#{career_period},#{id})")
	@Options(useGeneratedKeys = true, keyProperty = "b_no04")
	int write(Board04Dto dto);
	
	@Insert({
        "<script>",
        "insert into board04_code (code, b_no04) values ",
        "<foreach collection='codeList' item='codeDto' separator=','>",
        "(#{codeDto.code}, #{codeDto.b_no04})",
        "</foreach>",
        "</script>"
    })
    int insertCodes(@Param("codeList") List<Board04_CodeDto> codeList);
	
	@Insert("insert into board04_code (code, b_no04) values (#{code}, #{b_no04})")
    int insertCode(Board04_CodeDto codeDto);
	
	@Select("select count(*) from board04")
	int count();//전체 글 갯수
	
	@Update("UPDATE board04 SET title=#{title}, content=#{content}, join_date=#{join_date}, " +
	        "join02=#{join02}, work_type=#{work_type}, volunteer=#{volunteer}, salary=#{salary}, " +
	        "employment_date=#{employment_date}, employment_start=#{employment_start} " +
	        "WHERE b_no04=#{b_no04}")
	int updateBoard(Board04Dto dto);
	
	@Delete("delete from board04 where b_no04 = #{b_no04}")
	int deleteBoard(int b_no04);
	
	@Select({"<script>",
        "SELECT COUNT(*) FROM board04",
        "<where>",
        "<if test='cousearch == 1'> title LIKE CONCAT('%', #{search}, '%') </if>",
        "<if test='cousearch == 2'> content LIKE CONCAT('%', #{search}, '%') </if>",
        "<if test='cousearch == 3'> writer LIKE CONCAT('%', #{search}, '%') </if>",
        "</where>",
        "</script>" })
	   int countSearch(@Param("cousearch") int cousearch, @Param("search") String search);//검색 글 갯수
	
	@Select("select * from board04 order by b_no04 desc limit #{start}, #{count}")
    List<Board04Dto> countList(@Param("start") int start, @Param("count") int count);
	
	@Select({"<script>",
        "SELECT * FROM board04",
        "<where>",
        "<if test='cousearch == 1'> title LIKE CONCAT('%', #{search}, '%') </if>",
        "<if test='cousearch == 2'> content LIKE CONCAT('%', #{search}, '%') </if>",
        "<if test='cousearch == 3'> writer LIKE CONCAT('%', #{search}, '%') </if>",
        "</where>",
        "ORDER BY b_no04 DESC",
        "LIMIT #{start}, #{count}",
        "</script>"
	            })
	   List<Board04Dto> boardSearchList(@Param("cousearch") int cousearch, @Param("search") String search, @Param("start") int start, @Param("count") int count);
		
	@Select("select * from board04 where b_no04 = #{b_no04}")
    Board04Dto boardOne(int b_no04);
	
	//code
	@Select("select code from board04_code where b_no04 = #{b_no04}")
    List<String> selectCodes(int b_no04);
    
    @Delete("delete from board04_code where b_no04 = #{b_no04}")
    int deleteCodes(int b_no04);
    
    
    @Select("<script>" +
            "SELECT DISTINCT b.* " +
            "FROM board04 b " +
            "LEFT JOIN board04_code c ON b.b_no04 = c.b_no04 " +
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
            "AND b.title LIKE CONCAT('%', #{keyword}, '%') " +
            "</if>" +
            "ORDER BY b_no04 DESC " +  
            "LIMIT #{start}, #{count}" +  // 페이징 추가
            "</script>")
    List<Board04Dto> searchBoards(
        @Param("language") String language,
        @Param("workType") String workType,
        @Param("region") String region,
        @Param("keyword") String keyword,
        @Param("start") int start,
        @Param("count") int count
    );

    @Select("<script>" +
            "SELECT COUNT(DISTINCT b.b_no04) " +
            "FROM board04 b " +
            "LEFT JOIN board04_code c ON b.b_no04 = c.b_no04 " +
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
            "AND b.title LIKE CONCAT('%', #{keyword}, '%') " +
            "</if>" +
            "</script>")
    int countBoards(
        @Param("language") String language,
        @Param("workType") String workType,
        @Param("region") String region,
        @Param("keyword") String keyword
    );
    
    
    @Insert("insert into Mailham (return_man, title, content, date, id) values (#{return_man}, #{title}, #{content}, NOW(), #{id})")
    int b_04post(MailhamDto mdto);
    
    @Select("select * from Member_Info where id = #{id}")
    Member_InfoDto memberinfo(String id);
    
    @Select("select * from Board04 where b_no04 = #{b_no04}")
    Board04Dto cpdto(int b_no04);
}


