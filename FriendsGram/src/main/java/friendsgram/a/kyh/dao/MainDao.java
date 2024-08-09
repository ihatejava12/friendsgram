package friendsgram.a.kyh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import friendsgram.admin.dto.NoticeDto;
import friendsgram.board05.dto.Board05Dto;

@Mapper
public interface MainDao {
	
	@Select("SELECT n_no AS nNo, title, content, date, id FROM notice ORDER BY date DESC LIMIT 6")
    List<NoticeDto> mainnotice();

	 @Select("SELECT * FROM board05 ORDER BY date DESC LIMIT 2")
	    List<Board05Dto> mainboard05();
	
}
