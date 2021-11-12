package com.kh.bookmate.clubApply.model.service;

import java.util.List;

import com.kh.bookmate.clubApply.model.vo.ClubApply;

public interface ClubApplyService {

	int selectCheckApply(List<Integer> times, String userId);

	int insertApply(List<Integer> times, String userId);

	int selectCheckHeart(String userId, int clubNo);

	int insertHeart(String userId, int clubNo);

	int deleteHeart(String userId, List<Integer> clubNoList);

	List<ClubApply> selectApplyList(String userId);

}
