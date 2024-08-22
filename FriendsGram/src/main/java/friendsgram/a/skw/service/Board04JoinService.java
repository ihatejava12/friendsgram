package friendsgram.a.skw.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.skw.dao.Board04JoinDao;
import friendsgram.board04.dto.Board04_JoinDto;

@Service
public class Board04JoinService {
	private final Board04JoinDao board04JoinDao;

    @Autowired
    public Board04JoinService(Board04JoinDao board04JoinDao) {
        this.board04JoinDao = board04JoinDao;
    }

    public void saveJoinInfo(Board04_JoinDto board04JoinDto) throws SQLException {
        board04JoinDao.save(board04JoinDto);
    }
}