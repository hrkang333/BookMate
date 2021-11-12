package com.kh.bookmate.clubApply.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.clubApply.model.dao.ClubApplyDao;
import com.kh.bookmate.clubApply.model.vo.ClubApply;

@Service
public class ClubApplyServiceImpl implements ClubApplyService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubApplyDao clubApplyDao;
	
	
	@Override  //1. 신청: 이전에 신청했는지 확인
	public int selectCheckApply(List<Integer> times, String userId) {
		int befApply = clubApplyDao.selectCheckApply(sqlSession, times, userId);

		return befApply;
	}

	@Override  //2. 신청: insert, update
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

	@Override  //3. 찜: 이전에 찜했는지 확인
	public int selectCheckHeart(String userId, int clubNo) {
		// TODO Auto-generated method stub
		return clubApplyDao.selectCheckHeart(sqlSession, clubNo, userId);
	}

	@Override  //4. 찜: insert, update
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

	@Override  //5.찜 : 찜 삭제
	public int deleteHeart(String userId, List<Integer> clubNoList) {
		// TODO Auto-generated method stub
		int result1 = clubApplyDao.deleteHeart(sqlSession, userId, clubNoList);
		int result2 = clubApplyDao.updateHeartCount2(sqlSession, clubNoList);
		
		if(result1 < 0 || result2 < 0) {
			//예외처리
		}
		
		return result1*result2;
	}

	@Override
	public List<ClubApply> selectApplyList(String userId) {
		// TODO Auto-generated method stub
		System.out.println("club-apply-service 여기 오는거맞니?" + clubApplyDao.selectApplyList(sqlSession, userId).toString());
		return clubApplyDao.selectApplyList(sqlSession, userId);
	}
	
	


}
