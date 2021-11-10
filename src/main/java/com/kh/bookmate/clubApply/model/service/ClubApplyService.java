package com.kh.bookmate.clubApply.model.service;

import java.util.List;

public interface ClubApplyService {

	int selectCheckApply(List<Integer> times, String userId);

	void insertApply(List<Integer> times, String userId);

}
