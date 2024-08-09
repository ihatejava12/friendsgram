package friendsgram.a.kyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.kyh.dao.MainDao;
import friendsgram.admin.dto.NoticeDto;
import friendsgram.board05.dto.Board05Dto;

@Service
public class MainService {
	
	@Autowired
	MainDao maindao;
	
	public List<NoticeDto> getRecentMainNotices() {
        return maindao.mainnotice();
    }
	
	public List<Board05Dto> getRecentMainBoard05() {
        return maindao.mainboard05();
    }

}