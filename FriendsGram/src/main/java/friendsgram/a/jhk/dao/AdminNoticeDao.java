package friendsgram.a.jhk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.hibernate.validator.constraints.ParameterScriptAssert;

import friendsgram.admin.dto.NoticeDto;

@Mapper
public interface AdminNoticeDao {
	
	@Update("update notice set title = #{title}, content = #{content}, date = now() where n_no = #{n_no}")
	int updateNotice(@Param("title") String title, @Param("content") String content, @Param("n_no") int n_no);
	
	@Insert("insert into notice (title, content, date, id) values (#{title}, #{content}, now(), #{id})")
	int insertNotice(@Param("title") String title, @Param("content") String content, @Param("id") String id);
	
	@Delete("delete from notice where n_no = #{n_no}")
	int deleteNoticeOne(int n_no);
	
	@Select("select * from notice where n_no = #{n_no}")
	NoticeDto noticeContent(int n_no);
	
	@Delete({"<script>",
				"delete from notice where n_no in",
					"<foreach item=\"no\" collection=\"list\" open=\"(\" separator=\",\" close=\")\">",
	 					"#{no}",
	 				"</foreach>",
			 "</script>"})
	int deleteNotice(List<Integer> list);
	
	@Select("select * from notice order by n_no desc limit #{start}, #{count}")
	List<NoticeDto> noticeList(Map<String, Object> m);
	
	@Select("select count(*) from notice")
	int noticeCount();
	
}
