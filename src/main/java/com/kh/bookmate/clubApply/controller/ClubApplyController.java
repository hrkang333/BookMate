package com.kh.bookmate.clubApply.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookmate.clubApply.model.service.ClubApplyService;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class ClubApplyController {
	
	@Autowired
	private ClubApplyService clubApplyService;

	@ResponseBody
	@RequestMapping("apply.cl")
	//1. 독서모임 신청
	public String insertApply(@RequestParam(value="times[]") List<Integer> times, String userId) { //String[] times -> 이렇게 배열 받으면 안됨;;
		
		//1)이전에 신청한 적 있는지 확인
		int befApply = clubApplyService.selectCheckApply(times, userId);
		//2)이전에 신청한 적 없는 경우에만 신청되게하기
		if(befApply > 0) {
			return "fail";
		}

		//2-1)club_apply : insert
		//2-2)club_time : apply_count +1
		int result = clubApplyService.insertApply(times, userId);	

		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("heart.cl")
	//2.찜하기
	public String insertHeart(String userId, int clubNo) {
		
		//1)이전에 찜한 적 있는지 확인
		int befHeart = clubApplyService.selectCheckHeart(userId, clubNo);
		if(befHeart > 0) {
			return "fail";
		}
		//2)이전에 찜한 적 없는 경우 찜할 수 있도록하기
		int result = clubApplyService.insertHeart(userId, clubNo);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("heartCancle.cl")
	//3.찜 삭제
	public String deleteHeart(String userId, int clubNo) {
		List<Integer> clubNoList = new ArrayList<>();
		clubNoList.add(clubNo);
		
		int result = clubApplyService.deleteHeart(userId, clubNoList);
		
		return String.valueOf(result);
	}
	
	
	@RequestMapping("deleteClub2.cl")
	//3-6.마이페이지2(찜목록)에서 찜 삭제
	//clubController에 있었는데 복잡해서 여기로 뺐다.
	public String deleteClub2(int[] clubNo, HttpServletRequest request) {
	
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		List<Integer> clubNos = Arrays.stream(clubNo).boxed().collect(Collectors.toList());
				
		//1.db 업데이트(delete시키기)
		int result = clubApplyService.deleteHeart(userId, clubNos);
		
		return "redirect:mypage2.cl";
	}

}
