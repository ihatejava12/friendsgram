package friendsgram.a.skw.dao;

import java.sql.SQLException;

import friendsgram.board04.dto.Board04_JoinDto;

public interface Board04JoinDao {
	void save(Board04_JoinDto board04JoinDto) throws SQLException;
}
