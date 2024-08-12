package friendsgram.a.jhk.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.board01.dto.Board01Dto;
import friendsgram.board01.dto.Board01_ComentDto;

@Mapper
public interface AdminBoard01Dao {
	
	// 해당 게시글 삭제
	@Delete("delete from board01 where b_no01 = #{b_no01}")
	int deleteOneBoard01(int b_no01);
	
	// 해당 게시글
	@Select("select * from board01 where b_no01 = #{b_no01}")
	Board01Dto oneBoard01(int b_no01);
	
	// 해당 게시글 댓글 삭제
	
	// 해당 게시글 댓글
	@Select("select * from board01_coment where b_no01 = #{b_no01}")
	List<Board01_ComentDto> oneComent01(int b_no01);
	
	// board01 게시글 찾기
	@Select({"<script>",
				"select * from board01",
						"<where>",
							"<choose>",
								"<when test=\"searchn == 1\"> b_no01 = #{search} </when>",
								"<when test=\"searchn == 2\"> title like concat('%', #{search}, '%') </when>",
								"<when test=\"searchn == 3\"> id like concat('%', #{search}, '%') </when>",
								"<when test=\"searchn == 4\"> content like concat('%', #{search}, '%') </when>",
							"</choose>",
						"</where>",
					"order by b_no01 desc limit #{start} , #{count}",
			 "</script>"})
	List<Board01Dto> findBoard01(Map<String, Object> m);
	
	// 글 몇개 인지 확인
	@Select({"<script>",
				"select count(*) from board01",
						"<where>",
							"<choose>",
								"<when test=\"searchn == 1\"> b_no01 = #{search} </when>",
								"<when test=\"searchn == 2\"> title like concat('%', #{search}, '%') </when>",
								"<when test=\"searchn == 3\"> id like concat('%', #{search}, '%') </when>",
								"<when test=\"searchn == 4\"> content like concat('%', #{search}, '%') </when>",
							"</choose>",
						"</where>",
			 "</script>"})
	int countBoard01(Map<String, Object> m);
	
	// 선택한 글들을 삭제
	@Delete({"<script>",
			 	"delete from board01",
			 		"where b_no01 in ",
				 		"<foreach item=\"no\" collection=\"list\" open=\"(\" separator=\",\" close=\")\">",
				 			"#{no}",
				 		"</foreach>",
			 "</script>"})
	int deleteBoard01(List<Integer> list);
	
}
