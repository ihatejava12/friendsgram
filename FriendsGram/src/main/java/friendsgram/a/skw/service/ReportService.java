package friendsgram.a.skw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import friendsgram.a.skw.dao.ReportDao;
import friendsgram.admin.dto.ReportDto;

@Service
public class ReportService {

    @Autowired
    private ReportDao reportDao; // ReportDao는 신고 정보를 처리하는 DAO

    public void insertReport(ReportDto reportDto) {
        try {
            reportDao.insertReport(reportDto);
        } catch (Exception e) {
            // 예외 로그 추가
            e.printStackTrace();
            throw e; // 예외를 다시 던져서 컨트롤러에서 처리하도록 함
        }
    }
}