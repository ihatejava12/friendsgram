package friendsgram.a.skw.dao;

import org.apache.ibatis.annotations.Mapper;

import friendsgram.member.dto.Member_InfoDto;

@Mapper
public interface InfoDao {
	
	int insertInfo(Member_InfoDto dto);
}
