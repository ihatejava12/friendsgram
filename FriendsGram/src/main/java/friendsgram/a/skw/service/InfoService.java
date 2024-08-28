package friendsgram.a.skw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import friendsgram.a.skw.dao.InfoDao;
import friendsgram.member.dto.Member_InfoDto;

@Service
public class InfoService {
    
    private static final Logger logger = LoggerFactory.getLogger(InfoService.class);
    
    @Autowired
    private InfoDao dao;
    
    /**
     * Inserts a new Member_InfoDto record into the database.
     * 
     * @param dto The Member_InfoDto object to be inserted.
     * @return The number of rows affected.
     */
    @Transactional
    public int insertInfo(Member_InfoDto dto) {
        logger.info("Inserting member info: {}", dto);
        try {
            return dao.insertInfo(dto);
        } catch (DataAccessException e) {
            logger.error("Failed to insert member info: {}", e.getMessage());
            throw e;  // Rethrow the exception to allow higher layers to handle it.
        }
    }
    
    public Member_InfoDto midto() {
    	return dao.midto();
    }
}