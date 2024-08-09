package friendsgram.a.jhk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.dao.NoticeDao;
import friendsgram.admin.dto.NoticeDto;

@Service
public class NoticeService {

	@Autowired
	NoticeDao dao;
	
	public int updateNotice(String title, String content, int n_no) {
		return dao.updateNotice(title, content, n_no);
	}
	
	public int insertNotice(String title, String content, String id) {
		return dao.insertNotice(title, content, id);
	}
	
	public int deleteNoticeOne(int n_no) {
		return dao.deleteNoticeOne(n_no);
	}
	
	public NoticeDto noticeContent(int n_no) {
		return dao.noticeContent(n_no);
	}
	
	public int deleteNotice(List<Integer> list) {
		return dao.deleteNotice(list);
	}
	
	public List<NoticeDto> noticeList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.noticeList(m);
	}
	
	public int noticeCount() {
		return dao.noticeCount();
	}
	
}
