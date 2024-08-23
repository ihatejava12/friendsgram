package friendsgram.a.skw.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface JoinDao {
	
	 @Insert("INSERT INTO board04_join (b_no04,date,id) VALUES (#{b_no04}, now(),#{id})")
	    int insertJoin(@Param("b_no04") int b_no04, @Param("id") String id) throws DataAccessException;
}
