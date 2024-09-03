package friendsgram.a.jhk.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.admin.dao.AdminAdvertisingDao;
import friendsgram.advertising.dto.AdvertisingDto;
import friendsgram.advertising.dto.Advertising_AnswerDto;

@Service
public class AdminAdvertisingService {
	
	@Autowired
	AdminAdvertisingDao dao;
	
	public int davertisingUpdate(int a_no) {
		return dao.advertisingUpdate(a_no);
	}
	
	public int advertisingAnswer(Advertising_AnswerDto dto) {
		return dao.advertisingAnswer(dto);
	}
	
	public AdvertisingDto advertisingContent(int a_no) {
		return dao.advertisingContent(a_no);
	}
	
	public List<AdvertisingDto> advertisingList(String search, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.advertisingList(m);
	}
	
	public int count(String search) {
		return dao.count(search);
	}
	
}
