package friendsgram.a.kyh.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.kyh.dao.Board05Dao;
import friendsgram.board05.dto.Board05Dto;
import friendsgram.board05.dto.Board05_CodeDto;

@Service
public class Board05Service {

    @Autowired
    private Board05Dao dao;

    public int insert(Board05Dto dto, List<String> programmingLanguages) {
        int result = dao.insert(dto);
        
        if (result > 0 && dto.getB_no05() > 0) {
            List<Board05_CodeDto> codeList = new ArrayList<>();

            for (String code : programmingLanguages) {
                Board05_CodeDto codeDto = new Board05_CodeDto();
                codeDto.setCode(code);
                codeDto.setB_no05(dto.getB_no05());
                codeList.add(codeDto);
            }

            dao.insertCodes(codeList);
        }

        return result;
    }
    
    public void saveProgrammingLanguages(int b_no05, List<String> programmingLanguages) {
        for (String language : programmingLanguages) {
            Board05_CodeDto codeDto = new Board05_CodeDto();
            codeDto.setB_no05(b_no05);
            codeDto.setCode(language);
            dao.insertCode(codeDto);
        }
    }
    
    //selectCodesByBoardNo 메서드를 호출하여 데이터를 가져오는 메서드를 추가합니다.
    public List<String> getCodesByBoardNo(int b_no05) {
        return dao.selectCodesByBoardNo(b_no05);
    }

    public int count(int searchn, String search) {
        return dao.count(searchn, search);
    }

    public List<Board05Dto> boardListSearch(int searchn, String search, int startRow) {
        return dao.boardListSearch(searchn, search, startRow, 10); // 한 페이지에 보일 글의 갯수는 10으로 고정
    }

    public List<Board05Dto> selectList(int start, int count) {
        return dao.selectList(start, count);
    }

    public Board05Dto selectOne(int no) {
        return dao.selectOne(no);
    }

    public int update(Board05Dto dto) {
        return dao.update(dto);
    }

    public int delete(int no) {
        return dao.delete(no);
    }
}
