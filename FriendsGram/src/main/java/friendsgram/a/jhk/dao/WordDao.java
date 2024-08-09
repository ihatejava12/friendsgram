package friendsgram.a.jhk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.admin.dto.WordDto;

@Mapper
public interface WordDao {
	
	@Delete({"<script>",
				"delete from word where word in ",
					"<foreach item=\"no\" collection=\"list\" open=\"(\" separator=\",\" close=\")\">",
						"#{no}",
					"</foreach>",
				"</script>"})
	int deleteWords(List<String> list);
	
	@Insert("insert into word values (#{word})")
	int insertWord(String word);
	
	@Select("select * from word")
	List<WordDto> allWord();
	
}
