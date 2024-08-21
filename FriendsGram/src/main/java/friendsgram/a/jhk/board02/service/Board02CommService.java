package friendsgram.a.jhk.board02.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.jhk.board02.dao.Board02CommDao;
import friendsgram.board02.dto.Board02_ComentDto;

@Service
public class Board02CommService {

	@Autowired
	Board02CommDao dao;
	
	public int insertComm2(String coment, int ref, String id, int b_no02) {
		return dao.insertComm2(coment, ref, id, b_no02);
	}
	
	public Board02_ComentDto selectOneComm(int c_no02) {
		return dao.selectOneComm(c_no02);
	}
	
	public int deleteRef(int ref) {
		return dao.deleteRef(ref);
	}
	
	public int deleteComm02(int c_no02) {
		return dao.deleteComm02(c_no02);
	}
	
	public int updateRef() {
		return dao.updateRef();
	}
	
	public int insertPComm(String coment, String id, int b_no02) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("coment",coment);
		m.put("id", id);
		m.put("b_no02", b_no02);
		return dao.insertPComm(m);
	}
	
	public List<Board02_ComentDto> selectComm(int b_no02){
		return dao.selectComm(b_no02);
	}
	
}
