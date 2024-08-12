package friendsgram.a.jhk.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.board01.dto.Board01Dto;
import friendsgram.board04.dto.Board04Dto;

@Mapper
public interface AdminBoard04Dao {
	
	// 해당 게시글 삭제
		@Delete("delete from board04 where b_no04 = #{b_no04}")
		int deleteOneBoard04(int b_no04);
		
		// 해당 게시글
		@Select("select * from board04 where b_no04 = #{b_no04}")
		Board04Dto oneBoard04(int b_no04);

	@Select({"<script>",
		"select * from board04",
				"<where>",
					"<choose>",
						"<when test=\"searchn == 1\"> b_no04 = #{search} </when>",
						"<when test=\"searchn == 2\"> title like concat('%', #{search}, '%') </when>",
						"<when test=\"searchn == 3\"> id like concat('%', #{search}, '%') </when>",
						"<when test=\"searchn == 4\"> content like concat('%', #{search}, '%') </when>",
					"</choose>",
				"</where>",
			"order by b_no04 desc limit #{start} , #{count}",
	 "</script>"})
	List<Board04Dto> findBoard04(Map<String, Object> m);
	
	// 글 몇개 인지 확인
	@Select({"<script>",
			"select count(*) from board04",
					"<where>",
						"<choose>",
							"<when test=\"searchn == 1\"> b_no04 = #{search} </when>",
							"<when test=\"searchn == 2\"> title like concat('%', #{search}, '%') </when>",
							"<when test=\"searchn == 3\"> id like concat('%', #{search}, '%') </when>",
							"<when test=\"searchn == 4\"> content like concat('%', #{search}, '%') </when>",
						"</choose>",
					"</where>",
		 "</script>"})
	int countBoard04(Map<String, Object> m);
	
	// 선택한 글들을 삭제
	@Delete({"<script>",
		 	"delete from board04",
		 		"where b_no04 in ",
			 		"<foreach item=\"no\" collection=\"list\" open=\"(\" separator=\",\" close=\")\">",
			 			"#{no}",
			 		"</foreach>",
		 "</script>"})
	int deleteBoard04(List<Integer> list);
	
}
