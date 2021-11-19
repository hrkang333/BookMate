package com.kh.bookmate.clubApply.model.service;

import java.util.List;

import com.kh.bookmate.clubApply.model.vo.ClubApply;
import com.kh.bookmate.common.PageInfo;

public interface ClubApplyService {

	int selectCheckApply(List<Integer> times, String userId);

	int insertApply(List<Integer> times, String userId, int clubNo, String c_times);

	int selectCheckHeart(String userId, int clubNo);

	int insertHeart(String userId, int clubNo);

	int deleteHeart(String userId, List<Integer> clubNoList);

	List<ClubApply> selectApplyList(String userId, PageInfo pi);

	int updateCancel(String userId, int timeNo, String times);

	List<ClubApply> selectApplyList(int clubNo);

	int updateUserApply(List<Integer> applyNoList);


}
