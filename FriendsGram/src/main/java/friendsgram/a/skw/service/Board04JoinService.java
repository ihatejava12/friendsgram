package friendsgram.a.skw.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import friendsgram.a.skw.dao.JoinDao;

@Service
@Transactional
public class Board04JoinService {
	
	private static final Logger logger = LoggerFactory.getLogger(Board04JoinService.class);
	
	@Autowired
	    private JoinDao joinDao;

	    public boolean join(int b_no04, String id) {
	    	 if (b_no04 <= 0 || id == null || id.isEmpty()) {
	    	        throw new IllegalArgumentException("잘못된 입력 데이터");
	    	    } 
	    	try {
	        return joinDao.insertJoin(b_no04, id) > 0;
	    }catch (DataAccessException e) {
            // 예외 처리 및 로깅
            throw new RuntimeException("데이터베이스 처리 중 오류 발생", e);
	}

}
}