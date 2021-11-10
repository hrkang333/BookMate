package com.kh.bookmate.clubApply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookmate.clubApply.model.service.ClubApplyService;

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
		System.out.println("apply컨트롤러 : " + befApply);
		//2)이전에 신청한 적 없는 경우에만 신청되게하기
		if(befApply > 0) {
			return "fail";
		}
		
		//2-1)club_apply : insert
		//2-2)club_time : apply_count +1
		clubApplyService.insertApply(times, userId);		

		return String.valueOf(1);
	}
}
