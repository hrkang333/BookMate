package com.kh.bookmate.clubApply.model.service;

import java.util.List;

public interface ClubApplyService {

	int selectCheckApply(List<Integer> times, String userId);

	int insertApply(List<Integer> times, String userId);

	int selectCheckHeart(String userId, int clubNo);

	int insertHeart(String userId, int clubNo);

}
