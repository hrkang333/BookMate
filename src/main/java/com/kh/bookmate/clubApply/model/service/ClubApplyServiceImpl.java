package com.kh.bookmate.clubApply.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.clubApply.model.dao.ClubApplyDao;

@Service
public class ClubApplyServiceImpl implements ClubApplyService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubApplyDao clubApplyDao;
	
	@Override
	public int selectCheckApply(List<Integer> times, String userId) {
		int befApply = clubApplyDao.selectCheckApply(sqlSession, times, userId);

		return befApply;
	}

	@Override
	public int insertApply(List<Integer> times, String userId) {
		//2-1)club_apply : insert
		//2-2)club_time : apply_count +1
		int result1 = clubApplyDao.insertApply(sqlSession, times, userId);
		int result2 = clubApplyDao.insertApplyTime(sqlSession,times);
		
		if(result1 < 0 || result2 < 0) {
			//예외처리
		}
		
		return result1*result2;
	}

	@Override
	public int selectCheckHeart(String userId, int clubNo) {
		// TODO Auto-generated method stub
		return clubApplyDao.selectCheckHeart(sqlSession, clubNo, userId);
	}

	@Override
	public int insertHeart(String userId, int clubNo) {
		//1)club_wish : insert
		//2)club : heart_count +1
		int result1 = clubApplyDao.insertHeart(sqlSession, userId, clubNo);
		int result2 = clubApplyDao.updateHeartCount(sqlSession,clubNo);
		
		if(result1 < 0 || result2 < 0) {
			//예외처리
		}
		
		return result1*result2;
	}

}
