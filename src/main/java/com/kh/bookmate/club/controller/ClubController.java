/* 파일 설명 : 컨트롤러(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.11.01
 * 수정사항 : 독서모임 개설신청 db 연동중
 * 수정필요사항 : loginUser 세션에 넣어줘야 함 (V)
 * 			  step2에서 정원 typemismatch 오류남 default=0으로해야겠다.(V)
 * 			  message로 상황 알려줘야 함
 *            오프라인 장소(club_place) 추가해줘야 함
 *            <삭제> 1.club_time, club_attachment -> club삭제되면 해당 clubNo에 맞는 값 delete처리?
 *            
 *            
 * */
package com.kh.bookmate.club.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.kh.bookmate.club.model.service.ClubService;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;
import com.kh.bookmate.club.model.vo.ClubTime;
import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.common.Pagination;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class ClubController {
	
	
	private int keyClubNo;  //insert할때 단계 건너뛸 때 clubNo전역변수로 저장해두고 쓰려고 만듦/currval은 한번만 쓰고

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
		
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
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

		keyClubNo = clubService.saveStep1(c, ca);  //1단계에서 insert한 clubNo
		
		//다중 매핑 (10.30) 후 url판별하여 분기처리
		if(request.getServletPath().equals("/saveStep1.cl")) {
			return "redirect:mypage3.cl";
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
		
		//String savePath = resources+"\\upload_files\\";  -> 맥에서는 적용이안되서 아래로 수정
		String savePath = resources + File.separator+"upload_files"+File.separator+"club_img"+File.separator;
		
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

	//3. 개설신청 2단계 저장 후 다음단계로
	@RequestMapping(value={"saveStep2.cl", "insertClub2.cl"}) 
	public String saveStep2(HttpServletRequest request, @ModelAttribute Club c,
							@RequestParam(name="coverPhoto", required=false) MultipartFile file,
							@RequestParam(name="capacity", required=false, defaultValue="0") int capacity) {
		ClubAttachment ca = null;
		int imageType = 2;	
		ca = preSaveFile(ca, file, request, imageType);

		c.setClubCapacity(capacity); //typeMismatch 오류나서 따로 뺏음(11.03)
		c.setClubNo(keyClubNo);  //앞 단계에서 넣은 ClubNo값 넣기
		
		if(ca != null) {
			ca.setClubNo(keyClubNo);
		}

		clubService.saveStep2(c, ca);

		if(request.getServletPath().equals("/saveStep2.cl")) {
			return "redirect:mypage3.cl";
		}else {
			return "club/insertForm3";
		}
	}
	
	//4. 개설신청 2단계 저장 후 다음단계로
	@RequestMapping(value={"saveStep3.cl", "insertClub3.cl"}) 
	public String saveStep3(HttpServletRequest request, @ModelAttribute Club c, @ModelAttribute ClubTime ct,
							@RequestParam(name="bookPhoto", required=false) MultipartFile file) { 
		ClubAttachment ca = null;
		int imageType = 3;	
		ca = preSaveFile(ca, file, request, imageType);

		c.setClubNo(keyClubNo);  //앞 단계에서 넣은 ClubNo값 넣기
		
		if(ca != null) {
			ca.setClubNo(keyClubNo);
		}
		
		String[] dates = ct.getClubDate().split(",");
		String[] startTimes = ct.getStartTime().split(",");
		String[] endTimes = ct.getEndTime().split(",");
				
		List<ClubTime> list = new ArrayList<ClubTime>();
		
		//clubTime 객체에 값들 set하고 list에 add하기 -> mapper에서 foreach로 insert하기
		for(int i=0; i<dates.length; i++) {
			ClubTime inputCt = new ClubTime();
			inputCt.setClubNo(keyClubNo);
			inputCt.setClubDate(dates[i]);
			inputCt.setStartTime(startTimes[i]);
			inputCt.setEndTime(endTimes[i]);
			
			list.add(inputCt);
		}
		
		System.out.println(list.toString());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);

		if(request.getServletPath().equals("/saveStep3.cl")) {
			clubService.saveStep3(c, ca, map);
			return "redirect:mypage3.cl";  //msg 다르게 처리해야한다.
		}else {
			clubService.insertClub(c, ca, map);  //condition컬럼 값 2로 바꾼다.
			return "index";  //msg 다르게 처리해야한다.
		}
	}
	
	//5. 조회하기
	@RequestMapping("mypage3.cl")
	public String selectListMypage3(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
									HttpServletRequest request, Model model) {
		
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		
		int listCount = clubService.selectListCount(userId);
		System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 7, 5);
		
		ArrayList<Club> list = clubService.selectList3(userId, pi);		
		
		System.out.println("list크기 : " + list.size());
		
		for(Club c : list) {
			System.out.println("list크기 : " + c.toString());
		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);

		return "clubMypage/mypage3";
	}
	
	//6.마이페이지-내독서모임관리-독서모임 삭제
	@RequestMapping("deleteClub3.cl")
	public String deleteClub3(int[] clubNo, HttpServletRequest request) {
		//0.mybatis-foreach문에서 arraylist,list만취급해서 int[] 바꿨는데 다 쓸수있었다,,,
		//참고: https://wook-dragon.tistory.com/8		
		List<Integer> clubNos = Arrays.stream(clubNo).boxed().collect(Collectors.toList());
		
		//1.조회
		ArrayList<ClubAttachment> plist = new ArrayList<>();
		plist = clubService.selectPhotoList(clubNos);
		
		//2.사진삭제(해당 clubNo에 사진있는 경우만)
		if(plist != null) {
			System.out.println("여기 탈텐데");
			for(ClubAttachment ca : plist) {
				deleteFile(ca.getChangeName(),request);
			}
		}
		
		//3.db 업데이트(status='n'말고 다 지우기)
		clubService.deleteClub3(clubNos);
		
		return "redirect:mypage3.cl";
	}

	private void deleteFile(String changeName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + File.separator+"upload_files"+File.separator+"club_img"+File.separator;

		File deleteFile = new File(savePath+changeName);
		deleteFile.delete();
	}
	
	//7.메인페이지
	@RequestMapping("clubMain.cl")
	public String clubMain() {
		return "club/clubMain";
	}
	
	//8.메인페이지-카테고리 선택  -아래 더 공부하기!!
	@ResponseBody
	@RequestMapping(value="categoryList.cl", produces="application/json; charset=utf-8")
	public String categoryList(String category) {
		
		ArrayList<Club> list = clubService.selectCateList(category);
		
		return new GsonBuilder().create().toJson(list);
	}
		
		
}
