package friendsgram.a.skw.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.skw.dao.Board04Dao;
import friendsgram.board04.dto.Board04Dto;
import friendsgram.board04.dto.Board04_CodeDto;
import friendsgram.mailham.dto.MailhamDto;
import friendsgram.member.dto.Member_InfoDto;

@Service
public class Board04Service {
	@Autowired
	Board04Dao dao;
	
	public int count(int cousearch ,String search) {
		return dao.countSearch(cousearch , search);
	}
	
	public int write(Board04Dto dto, List<String> programmingLanguages) {
        int result = dao.write(dto);
        
        if (result > 0 && dto.getB_no04() > 0) {
            List<Board04_CodeDto> codeList = new ArrayList<>();

            for (String code : programmingLanguages) {
                Board04_CodeDto codeDto = new Board04_CodeDto();
                codeDto.setCode(code);
                codeDto.setB_no04(dto.getB_no04());
                codeList.add(codeDto);
            }

            dao.insertCodes(codeList);
        }

        return result;
    }
	
	 public void saveProgrammingLanguages(int b_no04, List<String> programmingLanguages) {
	        for (String language : programmingLanguages) {
	            Board04_CodeDto codeDto = new Board04_CodeDto();
	            codeDto.setB_no04(b_no04);
	            codeDto.setCode(language);
	            dao.insertCode(codeDto);
	        }
	    }
	 public List<String> getCodes(int b_no04) {
	        return dao.selectCodes(b_no04);
	    }

	    public List<Board04Dto> boardSearchList(int cousearch, String search, int startRow) {
	        return dao.boardSearchList(cousearch, search, startRow, 5);
	    }
	    public List<Board04Dto> selectList(int start, int count) {
	        return dao.countList(start, count);
}
	public Board04Dto boardOne(int b_no04) {
		Board04Dto board = dao.boardOne(b_no04);
        if (board != null) {
            List<String> codes = dao.selectCodes(b_no04);
            board.setCodes(codes);
        }
		return board;
	}
	public int updateBoard(Board04Dto dto, List<String> programmingLanguages) {
		int result = dao.updateBoard(dto);
		
		  if (result > 0) { // 기존 코드를 삭제하고 새로운 코드 목록을 삽입합니다.
		  dao.deleteCodes(dto.getB_no04()); saveProgrammingLanguages(dto.getB_no04(),
		  programmingLanguages); }
		 
        return result;
	}
	public int deleteBoard(int b_no04) {
		return dao.deleteBoard(b_no04);
	}
	
	public List<Board04Dto> boardListSearch(String language, String workType, String region, String keyword, int start, int count) {
        List<Board04Dto> boards = dao.searchBoards(language, workType, region, keyword, start, count);
		
        for (Board04Dto board : boards) {
            List<String> codes = dao.selectCodes(board.getB_no04());
            board.setCodes(codes);  // 각 board에 대한 코드 리스트를 설정
        }

        return boards;
	}
	public int countBoards(String language, String workType, String region, String keyword) {
        return dao.countBoards(language, workType, region, keyword);
    }
    
    public int b_04post(MailhamDto mdto) {
        return dao.b_04post(mdto);
    }
    
    public Member_InfoDto minfo(String id) {
    	return dao.memberinfo(id);
    }
    
    public Board04Dto cpdto(int b_no04) {
    	return dao.cpdto(b_no04);
    }
}
