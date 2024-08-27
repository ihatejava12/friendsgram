package friendsgram.a.pth.advertising.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.pth.advertising.dao.AdvertisingDao;
import friendsgram.advertising.dto.AdvertisingDto;

@Service
public class AdvertisingService {

	@Autowired
	AdvertisingDao advertisingdao;
	
	
	// 광고문의글 1개 받아와서, DB에 저장
	public	int addAdvertisingQuestion(AdvertisingDto advertise) {
		return advertisingdao.addAdvertisingQuestion(advertise);
	}
	
	
}
