package friendsgram.a.kyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.kyh.dao.Board05Dao;
import friendsgram.board05.dto.Board05Dto;

@Service
public class Board05Service {

    @Autowired
    private Board05Dao dao;

    public int insert(Board05Dto dto) {
        return dao.insert(dto);
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
