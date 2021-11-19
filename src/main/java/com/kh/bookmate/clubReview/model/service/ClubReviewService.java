package com.kh.bookmate.clubReview.model.service;

import java.util.List;

import com.kh.bookmate.clubReview.model.vo.ClubReview;

public interface ClubReviewService {

	int selectParticipate(int clubNo, String userId);
	
	int selectBefReview(int clubNo, String userId);

	void insertReview(ClubReview cr);

	List<ClubReview> selectReviewList(int clubNo);

	void deleteReview(int clubNo, String userId);
}
