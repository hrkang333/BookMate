/* 파일 설명 : 컨트롤러(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.10.28
 * */
package com.kh.bookmate.club.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmate.club.model.service.ClubService;
import com.kh.bookmate.club.model.vo.ClubAttachment;
import com.kh.bookmate.club.model.vo.ClubHost;

@Controller
public class ClubController {

	@Autowired
	private ClubService clubService;
	
	//1. 호스트명 중복 확인
	@RequestMapping("hostCheck.cl")
	public String checkHost(String hostName) {
		
		int result = clubService.checkHost(hostName);
		if(result > 0) {  //이미 이름 있는 경우
			return "duplicate";
		}else {
			return "use";
		}
	}
	
	//2. 개설신청 1단계 저장
	@RequestMapping("saveStep1.cl")
	public String saveStep1(HttpServletRequest request, @ModelAttribute ClubHost ch,
							@RequestParam(name="hostPhoto", required=false) MultipartFile file,
							@RequestParam(name="startDate[]", required=false) String startDate,
							@RequestParam(name="endDate[]", required=false) String endDate,
							@RequestParam(name="endDate[]", required=false) String WhatTodo) {
		//hostComment, hostName 사용가능
		//hostPhoto, startDate[], endDate[], WhatTodo[]
		
//		ClubAttachment ca;
//		
//		if(!file.getOriginalFilename().equals("")) {
//			String changeName = saveFile(file,request);
//			
//			if(changeName != null) {
//				ca = new ClubAttachment();
//				ca.setOriginalName(file.getOriginalFilename());
//				ca.setChangeName(changeName);
//			}
//		}
//		
//		int result = clubService.saveStep1(ca);
		
//		return String.valueOf(result);
		return " test";
		
	}
	
	
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources"); 
		System.out.println("resources : " + resources);
		
		String savePath = resources+"\\upload_files\\";
		
		System.out.println("savePath : " + savePath);
		
		String originName = file.getOriginalFilename();		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
		try {
			//new File(savePath + changeName) : 파일을 저장하기 위한 파일 객체 생성
			//new File(저장경로 + 저장할이름)
			file.transferTo(new File(savePath + changeName));
			//transferTo : 파일 저장
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//throw new CommException("file Upload error");
		}
		return changeName;
	}
	
	//3. 개설신청 1단계 저장 후 다음단계로
	@RequestMapping("insert.cl")
	public String insertClub() {
		
		return "club/insertClub";
	}
	
	
}
