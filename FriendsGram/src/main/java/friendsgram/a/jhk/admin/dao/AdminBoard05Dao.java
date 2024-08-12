package friendsgram.a.jhk.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.board04.dto.Board04Dto;
import friendsgram.board05.dto.Board05Dto;

@Mapper
public interface AdminBoard05Dao {
	
	// 해당 게시글 삭제
	@Delete("delete from board05 where b_no05 = #{b_no05}")
	int deleteOneBoard05(int b_no05);
	
	// 해당 게시글
	@Select("select * from board05 where b_no05 = #{b_no05}")
	Board05Dto oneBoard05(int b_no05);

		@Select({"<script>",
					"select * from board05",
							"<where>",
								"<choose>",
									"<when test=\"searchn == 1\"> b_no05 = #{search} </when>",
									"<when test=\"searchn == 2\"> title like concat('%', #{search}, '%') </when>",
									"<when test=\"searchn == 3\"> id like concat('%', #{search}, '%') </when>",
									"<when test=\"searchn == 4\"> content like concat('%', #{search}, '%') </when>",
								"</choose>",
							"</where>",
						"order by b_no05 desc limit #{start} , #{count}",
				 "</script>"})
		List<Board05Dto> findBoard05(Map<String, Object> m);
		
		@Select({"<script>",
					"select count(*) from board05",
							"<where>",
								"<choose>",
									"<when test=\"searchn == 1\"> b_no05 = #{search} </when>",
									"<when test=\"searchn == 2\"> title like concat('%', #{search}, '%') </when>",
									"<when test=\"searchn == 3\"> id like concat('%', #{search}, '%') </when>",
									"<when test=\"searchn == 4\"> content like concat('%', #{search}, '%') </when>",
								"</choose>",
							"</where>",
				 "</script>"})
		int countBoard05(Map<String, Object> m);
		
		@Delete({"<script>",
				 	"delete from board05",
				 		"where b_no05 in ",
					 		"<foreach item=\"no\" collection=\"list\" open=\"(\" separator=\",\" close=\")\">",
					 			"#{no}",
					 		"</foreach>",
				 "</script>"})
		int deleteBoard05(List<Integer> list);
	
}
