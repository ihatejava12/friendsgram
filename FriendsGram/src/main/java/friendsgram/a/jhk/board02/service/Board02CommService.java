package friendsgram.a.jhk.board02.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.board02.dao.Board02CommDao;

@Service
public class Board02CommService {

	@Autowired
	Board02CommDao dao;
	
	public int insertPComm(String coment, String id, int b_no02) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("coment",coment);
		m.put("id", id);
		m.put("b_no02", b_no02);
		return dao.insertPComm(m);
	}
	
}
