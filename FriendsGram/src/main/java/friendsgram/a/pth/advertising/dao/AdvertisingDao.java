package friendsgram.a.pth.advertising.dao;

import org.apache.ibatis.annotations.Mapper;

import friendsgram.advertising.dto.AdvertisingDto;

@Mapper
public interface AdvertisingDao {

	// 광고문의글 1개 받아와서, DB에 저장
	int addAdvertisingQuestion(AdvertisingDto advertise);
	
	
}
