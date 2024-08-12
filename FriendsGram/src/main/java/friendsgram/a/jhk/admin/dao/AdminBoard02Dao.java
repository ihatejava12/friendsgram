package friendsgram.a.jhk.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.board02.dto.Board02Dto;
import friendsgram.board02.dto.Board02_ComentDto;

@Mapper
public interface AdminBoard02Dao {
	
	// 해당 게시글 삭제
		@Delete("delete from board02 where b_no02 = #{b_no02}")
		int deleteOneBoard02(int b_no02);
		
		// 해당 게시글
		@Select("select * from board02 where b_no02 = #{b_no02}")
		Board02Dto oneBoard02(int b_no02);
		
		// 해당 게시글 댓글 삭제
		
		// 해당 게시글 댓글
		@Select("select * from board02_coment where b_no02 = #{b_no02}")
		List<Board02_ComentDto> oneComent02(int b_no02);

	// board02 게시글 찾기
		@Select({"<script>",
					"select * from board02",
						"<where>",
							"<choose>",
								"<when test=\"searchn == 1\"> b_no02 = #{search} </when>",
								"<when test=\"searchn == 2\"> title like concat('%', #{search}, '%') </when>",
								"<when test=\"searchn == 3\"> id like concat('%', #{search}, '%') </when>",
								"<when test=\"searchn == 4\"> content like concat('%', #{search}, '%') </when>",
							"</choose>",
						"</where>",
						"order by b_no02 desc limit #{start} , #{count}",
				 "</script>"})
		List<Board02Dto> findBoard02(Map<String, Object> m);	
		
		@Select({"<script>",
			"select count(*) from board02",
					"<where>",
						"<choose>",
							"<when test=\"searchn == 1\"> b_no02 = #{search} </when>",
							"<when test=\"searchn == 2\"> title like concat('%', #{search}, '%') </when>",
							"<when test=\"searchn == 3\"> id like concat('%', #{search}, '%') </when>",
							"<when test=\"searchn == 4\"> content like concat('%', #{search}, '%') </when>",
						"</choose>",
					"</where>",
		 "</script>"})
		int countBoard02(Map<String, Object> m);
		
		@Delete({"<script>",
		 	"delete from board02",
		 		"where b_no02 in ",
			 		"<foreach item=\"no\" collection=\"list\" open=\"(\" separator=\",\" close=\")\">",
			 			"#{no}",
			 		"</foreach>",
		 "</script>"})
		int deleteBoard02(List<Integer> list);
}
