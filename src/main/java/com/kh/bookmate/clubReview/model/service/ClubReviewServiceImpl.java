package com.kh.bookmate.clubReview.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.clubReview.model.dao.ClubReviewDao;
import com.kh.bookmate.clubReview.model.vo.ClubQna;
import com.kh.bookmate.clubReview.model.vo.ClubQnaAnswer;
import com.kh.bookmate.clubReview.model.vo.ClubReview;

@Service
public class ClubReviewServiceImpl implements ClubReviewService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubReviewDao clubReviewDao;
	
	@Override
	public int selectParticipate(int clubNo, String userId) {
		// TODO Auto-generated method stub
		return clubReviewDao.selectParticipate(sqlSession, clubNo, userId);
	}
	
	@Override
	public int selectBefReview(int clubNo, String userId) {
		// TODO Auto-generated method stub
		return clubReviewDao.selectBefReview(sqlSession, clubNo, userId);
	}

	@Override
	public void insertReview(ClubReview cr) {
		// TODO Auto-generated method stub
		int result = clubReviewDao.insertReview(sqlSession,cr);
		if(result < 0) {
			//error
		}
	}

	@Override
	public List<ClubReview> selectReviewList(int clubNo) {
		// TODO Auto-generated method stub
		return clubReviewDao.selectReviewList(sqlSession, clubNo);
	}

	@Override
	public void deleteReview(int clubNo, String userId) {
		// TODO Auto-generated method stub
		int result = clubReviewDao.deleteReview(sqlSession,clubNo,userId);
		if(result < 0) {
			//error
		}
	}

	@Override
	public void insertQna(ClubQna cq) {
		int result = clubReviewDao.insertQna(sqlSession,cq);
		if(result < 0) {
			//error
		}
	}

	@Override
	public List<ClubReview> selectQnaList(int clubNo) {
		// TODO Auto-generated method stub
		return clubReviewDao.selectQnaList(sqlSession, clubNo);
	}

	@Override
	public ClubQna selectQna(int qnaNo) {
		// TODO Auto-generated method stub
		return clubReviewDao.selectQna(sqlSession, qnaNo);
	}

	@Override
	public void insertQnaAnswer(ClubQnaAnswer cqa) {
		int result = clubReviewDao.insertQnaAnswer(sqlSession,cqa);
		if(result < 0) {
			//error
		}
	}

	@Override
	public void updateQna(int qnaNo) {
		int result = clubReviewDao.updateQna(sqlSession,qnaNo);
		if(result < 0) {
			//error
		}
	}
}
