package friendsgram.a.skw.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.board04.dto.Board04Dto;

@Mapper
public interface Board04Dao {

	int write(Board04Dto dto);
	List<Board04Dto> boardList(Map<String, Object> m);
	int count();//전체 글 갯수
	Board04Dto boardOne(int no);
	int updateBoard(Board04Dto dto);
	int deleteBoard(int no);
	int addReadCount(int no); //조회수 증가
	
	/*
	 * List<BoardDto> boardListSearch(Map<String, Object> m); int
	 * countSearch(Map<String, Object> m); // 검색 글 갯수
	 */
	@Select({"<script>select * from board04 ",
	      "<where><choose><when test=\"searchn == 0\">title like concat('%',#{search},'%')</when>",
	            "<when test=\"searchn == 1\"> content like concat('%',#{search},'%') </when>",
	            "<when test=\"searchn == 2\"> id like concat('%',#{search},'%') </when>",
	         "</choose></where> order by regdate desc  limit #{start} , #{count}</script>"})
	   List<Board04Dto> boardListSearch(Map<String, Object> m);
	
	   @Select({"<script>select count(*) from board04 ",
	      "<where>",
	         "<choose>",
	            "<when test=\"searchn == 0\">title like concat('%',#{search},'%')</when>",
	            "<when test=\"searchn == 1\"> content like concat('%',#{search},'%') </when>",
	            "<when test=\"searchn == 2\"> id like concat('%',#{search},'%') </when>",
	         "</choose></where></script>" })
	   int countSearch(Map<String, Object> m);//검색 글 갯수
	}

