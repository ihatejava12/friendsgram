package friendsgram.a.skw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.skw.dao.MemberDao;
import friendsgram.member.dto.MemberDto;

@Service
public class MemberService {
		@Autowired
		MemberDao dao;
		
		public int updatePw(MemberDto dto, String nwPw) {
			return dao.updatePw(dto.getId(), dto.getName(), nwPw);
		}
		public String idCheck(String id) {
			return dao.idCheck(id);
		}
		public int insertMem(MemberDto dto) {
			return dao.insertMem(dto);
		}
		public MemberDto login(MemberDto dto) {
			return dao.login(dto);
		}
		public int updateMem(MemberDto dto) {
			return dao.updateMem(dto);
		}
		public int deleteMem(String formpw, MemberDto dto ) {
			String pw = dto.getPassword();
			if(pw.equals(formpw)) {
				return dao.deleteMem(dto.getId());
			}else {
				return 0;
			}
		}
		public List<MemberDto> memsInfo(){
			return dao.memsInfo();
		}
	}