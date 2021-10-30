/* 파일 설명 : 컨트롤러(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.10.30
 * 수정사항 : 독서모임 개설신청 db 연동중
 * 수정필요사항 : loginUser 세션에 넣어줘야 함
 * 			  message로 상황 알려줘야 함
 * */
package com.kh.bookmate.club.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmate.club.model.service.ClubService;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class ClubController {

	@Autowired
	private ClubService clubService;
	
	//0. insert 첫단계 화면 띄우기
	@RequestMapping("insertForm1.cl")
	public String insertForm1() {
		return "club/insertForm1";
	}
	
	//1. 호스트명 중복 확인
	@ResponseBody
	@RequestMapping(value="/hostCheck.cl", method=RequestMethod.POST)
	public String checkHost(String hostName) {

		int result = clubService.checkHost(hostName);
		if(result > 0) {  //이미 이름 있는 경우
			return "duplicate";
		}else {
			return "use";
		}
	}
	
	//2. 개설신청 1단계 저장 : c, ca, userId 총 3개 보내기
	/* 1) value에 기본값 넣기 & required=false로 받기 2가지 중 후자로 해봄 */	
	@RequestMapping(value={"saveStep1.cl", "insertClub1.cl"}) 
	public String saveStep1(HttpServletRequest request, @ModelAttribute Club c,
							@RequestParam(name="hostPhoto", required=false) MultipartFile file,
							@RequestParam(name="phwhatTodo", required=false) String[] phwhatTodo){
		
		//String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		String userId = "user02";  //로그인 기능없어서 임시로 만듦.
		c.setUserId(userId);
		
		System.out.println("=========테스트===========");
		System.out.println(c.getHostName());
		System.out.println(c.getHostComment());
		System.out.println(c.getHstartDate());  //2021-09-28,2021-10-19
		System.out.println(c.getHendDate());    //2021-10-13,2021-10-28
		System.out.println(file);
		
		String hwhatTodo = "";
		for(int i=0; i< phwhatTodo.length; i++) {
			hwhatTodo += phwhatTodo[i]+"|";  //글자 중에 ,있는 경우 구분이 안되서 이렇게 바꿈
		}
		c.setHwhatTodo(hwhatTodo);
		System.out.println(c.getHwhatTodo());
	
		ClubAttachment ca = null;
		int imageType = 1;
		
		ca = preSaveFile(ca, file, request, imageType);

		clubService.saveStep1(c, ca);
		
		//다중 매핑 (10.30) 후 url판별하여 분기처리
		if(request.getServletPath().equals("saveStep1.cl")) {
			return "index";
		}else {
			return "club/insertForm2";
		}
	}
	
	public ClubAttachment preSaveFile(ClubAttachment ca, MultipartFile file, HttpServletRequest request, int imageType) {
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file,request);
			
			if(changeName != null) {
				ca = new ClubAttachment();
				ca.setOriginalName(file.getOriginalFilename());
				ca.setChangeName(changeName);
				ca.setFileType(imageType);  //이미지종류-1 : 호스트이미지
			}
		}
		return ca;
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
	
	//2.5임시임시
	@RequestMapping("insertForm2.cl")
	public String insertClub() {
		
		return "club/insertForm2";
	}
	
	//3. 개설신청 2단계 저장 후 다음단계로
	@RequestMapping(value={"saveStep2.cl", "insertClub2.cl"}) 
	public String saveStep2(HttpServletRequest request, @ModelAttribute Club c,
							@RequestParam(name="coverPhoto", required=false) MultipartFile file) {
		ClubAttachment ca = null;
		int imageType = 2;
		
		ca = preSaveFile(ca, file, request, imageType);

		//clubService.saveStep2(c, ca);

		System.out.println("=========테스트===========");
		System.out.println(c.getCategory());
		System.out.println(c.getClubTitle());
		System.out.println(c.getIntro());
		System.out.println(c.getActivity());
		System.out.println(c.getWant());
		System.out.println(c.getNotwant());
		System.out.println(c.getClubCapacity());

		if(request.getServletPath().equals("saveStep2.cl")) {
			return "index";
		}else {
			return "club/insertForm3";
		}
	}
	
	
}
