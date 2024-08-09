package friendsgram.a.jhk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.board01.dto.Board01Dto;
import friendsgram.board03.dto.Board03Dto;

@Mapper
public interface Board03Dao {
	
		// 해당 게시글 삭제
		@Delete("delete from board03 where b_no03 = #{b_no03}")
		int deleteOneBoard03(int b_no03);
		
		// 해당 게시글
		@Select("select * from board03 where b_no03 = #{b_no03}")
		Board03Dto oneBoard03(int b_no03);
	
		@Select({"<script>",
					"select * from board03",
							"<where>",
								"<choose>",
									"<when test=\"searchn == 1\"> b_no03 = #{search} </when>",
									"<when test=\"searchn == 2\"> id like concat('%', #{search}, '%') </when>",
									"<when test=\"searchn == 3\"> content like concat('%', #{search}, '%') </when>",
								"</choose>",
							"</where>",
						"order by b_no03 desc limit #{start} , #{count}",
				 "</script>"})
		List<Board03Dto> findBoard03(Map<String, Object> m);
		
		@Select({"<script>",
					"select count(*) from board03",
							"<where>",
								"<choose>",
									"<when test=\"searchn == 1\"> b_no03 = #{search} </when>",
									"<when test=\"searchn == 2\"> id like concat('%', #{search}, '%') </when>",
									"<when test=\"searchn == 3\"> content like concat('%', #{search}, '%') </when>",
								"</choose>",
							"</where>",
				 "</script>"})
		int countBoard03(Map<String, Object> m);
		
		@Delete({"<script>",
				 	"delete from board03",
				 		"where b_no03 in ",
					 		"<foreach item=\"no\" collection=\"list\" open=\"(\" separator=\",\" close=\")\">",
					 			"#{no}",
					 		"</foreach>",
				 "</script>"})
		int deleteBoard03(List<Integer> list);
	
}
