package friendsgram.a.jhk.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import friendsgram.advertising.dto.AdvertisingDto;
import friendsgram.advertising.dto.Advertising_AnswerDto;

@Mapper
public interface AdminAdvertisingDao {
	
	@Update("update advertising set request = 1 where a_no = #{a_no}")
	int advertisingUpdate(int a_no);
	
	@Insert("insert into advertising_answer (title, content, date, id, a_no) values (#{title}, #{content}, now(), #{id}, #{a_no})")
	int advertisingAnswer(Advertising_AnswerDto dto);
	
	@Select("select * from advertising where a_no = #{a_no}")
	AdvertisingDto advertisingContent(int a_no);
	
	@Select("select * from advertising order by request limit #{start} , #{count}")
	List<AdvertisingDto> advertisingList(Map<String, Object> m);
	
	@Select("select count(*) from advertising")
	int count();
	
}