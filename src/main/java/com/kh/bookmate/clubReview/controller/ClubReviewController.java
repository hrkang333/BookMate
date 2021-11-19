package com.kh.bookmate.clubReview.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.kh.bookmate.clubReview.model.service.ClubReviewService;
import com.kh.bookmate.clubReview.model.vo.ClubReview;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class ClubReviewController {
	
	@Autowired
	private ClubReviewService clubReviewService;

	@ResponseBody
	@RequestMapping(value = "checkReview.cl")
	public String selectParticipate(int clubNo, String userId) {
		
		int result = clubReviewService.selectParticipate(clubNo, userId);
		if(result == 0) {
			return "fail";
		}
		
		int result1 = clubReviewService.selectBefReview(clubNo, userId);
		return String.valueOf(result1);
	}
	
	@ResponseBody
	@RequestMapping(value = "insertReview.cl",method = RequestMethod.POST , consumes ={"multipart/form-data"})
	public String insertReview(ClubReview cr, @RequestParam(value = "rPhoto", required=false) MultipartFile file, HttpServletRequest request) {
		
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		cr.setReviewWriter(userId);

		if(!file.getOriginalFilename().equals("")) { //첨부파일 등록한 경우
			String changeName = saveFile(file,request);  //수정할때도 쓸라고 savefile로 뺀다.
			if(changeName != null) {
				cr.setReviewPhoto(changeName);
			}
		}
		clubReviewService.insertReview(cr);
		//포인트 증정하는 메소드
		
		return "success";  //cr은 안된다
	}
	
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources"); 
		String savePath = resources + File.separator+"upload_files"+File.separator+"club_img"+File.separator;
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			//throw new CommException("file Upload error");
		}
		return changeName;
	}
	
	@ResponseBody
	@RequestMapping(value="selectReview.cl", produces="application/json; charset=utf-8")
	private String selectReviewList(int clubNo) {
		
		List<ClubReview> list = clubReviewService.selectReviewList(clubNo);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="deleteReview.cl")
	private String deleteReview(int clubNo, String userId, String fileName, HttpServletRequest request) {

		clubReviewService.deleteReview(clubNo, userId);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		return "success";
	}
	
	private void deleteFile(String changeName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + File.separator+"upload_files"+File.separator+"club_img"+File.separator;

		File deleteFile = new File(savePath+changeName);
		deleteFile.delete();
	}
	
}
