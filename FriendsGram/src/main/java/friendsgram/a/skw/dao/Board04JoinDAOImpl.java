package friendsgram.a.skw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import friendsgram.board04.dto.Board04_JoinDto;

@Repository
public class Board04JoinDAOImpl implements Board04JoinDao {
	private final DataSource dataSource;

	public Board04JoinDAOImpl(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void save(Board04_JoinDto board04JoinDto) throws SQLException {
		String sql = "INSERT INTO board04_join (b_no04, id) VALUES (?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, board04JoinDto.getB_no04());
			ps.setString(2, board04JoinDto.getId());
			// 필요한 필드를 추가하여 PreparedStatement에 설정

			ps.executeUpdate();
		}
	}
}