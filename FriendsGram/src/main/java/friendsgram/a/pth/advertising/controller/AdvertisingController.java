package friendsgram.a.pth.advertising.controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import friendsgram.a.pth.advertising.service.AdvertisingService;
import friendsgram.advertising.dto.AdvertisingDto;

@Controller
public class AdvertisingController {

	@Autowired
	AdvertisingService advertisingservice;
	
	
	 private String makeFileName(String origName) {
	      //ms+_random.확장자
	      long currentTime = System.currentTimeMillis();
	      Random random = new Random();
	      int r = random.nextInt(50); // 0 ~ 49 랜덤 발생
	      int index = origName.lastIndexOf(".");
	      String ext = origName.substring(index + 1);
	      
	      return currentTime+"_"+r+"."+ext;
	   }
	
	 
	 private String upload(MultipartFile file) {// 임시경로에 업로드 되어있는 file
			String newFileName = makeFileName(file.getOriginalFilename());// 중복안되는 파일명 만들기 
			File newFile = null;
			
			try {
				String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
				                                  // src/main/static/upload/
				newFile = new File(path, newFileName);// 두개를 합쳐서 하나의 경로로 만들고, 그 경로를 가진 파일 객체를 만듬 
				file.transferTo(newFile);// 임시 업로드되어있는 file의 내용을 newFile에  옮김 
			} catch (IOException | IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return newFileName;
		}
	
	
	
	
	
	@GetMapping("advertising/question")
	String advertisingQuestion() {	
		return "pth/advertising/question";
	}
	
	
	@PostMapping("advertising/question")
	String sendAdvertisingQuestion(@RequestParam("file")MultipartFile file, @ModelAttribute("advertise")AdvertisingDto advertise) {
		
		if(!file.getOriginalFilename().equals("")) {
			// upload 하고  
			String adverfilename = upload(file);// 내가 원하는 폴더에 업로드 된 파일명 
			
			// DB에 insert
			advertise.setFilename(adverfilename);// AdvertisingDto 에 파일 이름 저장
			advertise.setAdd_file("/upload/"+adverfilename);// AdvertisingDto 에 파일 경로 저장
			
		}
		
		
		// advertise 객체 1개, DB Advertising Table에 저장
		advertisingservice.addAdvertisingQuestion(advertise);
		
		
		
		
		return "pth/advertising/questionconfirm";
	}
	
	
	
	
}
