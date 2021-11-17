package com.kh.bookmate.clubApply.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.clubApply.model.dao.ClubApplyDao;
import com.kh.bookmate.clubApply.model.vo.ClubApply;
import com.kh.bookmate.common.PageInfo;

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
	public int insertApply(List<Integer> times, String userId, int clubNo, String c_times) {
		//2-1)club_apply : insert
		//2-2)club_time : apply_count +1
		int result1;
		if(c_times.equals("한 번 만나요")) {
			result1 = clubApplyDao.insertApply(sqlSession, times, userId,clubNo);
		}else {
			//'여러번 만나요'일때 club_apply테이블에 한 번만 들어갈 수 있도록 한다.
			//마이페이지 - 신청목록에서 여러 번 뜨면 페이징처리가 어렵다.
			List<Integer> subList = new ArrayList<>(times.subList(0, 1));
			result1 = clubApplyDao.insertApply(sqlSession, subList, userId,clubNo);
		}
		
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
	public List<ClubApply> selectApplyList(String userId , PageInfo pi) {
		// TODO Auto-generated method stub
		return clubApplyDao.selectApplyList(sqlSession, userId, pi);
	}

	@Override
	public int updateCancel(String userId, int timeNo, String times) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("timeNo", timeNo);
		
		//1) club_apply테이블 apply_cancle컬럼 'n'으로 바꾸기
		int result1 = clubApplyDao.updateCancel(sqlSession,map);

		//2) club_time테이블 apply_count컬럼 -1해주기
		int result2 = 0;
		if(times.equals("여러 번 만나요")) {
			map.put("columnValue", map.get("clubNo"));
			map.put("column", "REF_CLUB_NO");
			result2 = clubApplyDao.updateCancelTime(sqlSession,map);
		}else {
			map.put("columnValue", timeNo);
			map.put("column", "CLUB_TIME_NO");
			result2 = clubApplyDao.updateCancelTime(sqlSession,map);
		}
		
		
		if(result1<0 || result2<0) {
			//ㅇ예외처리
		}
		return (int) map.get("clubNo");
	}

	@Override
	public List<ClubApply> selectApplyList(int clubNo) {
		// TODO Auto-generated method stub
		return clubApplyDao.selectApplyList(sqlSession, clubNo);
	}

	@Override
	public int updateUserApply(List<Integer> applyNoList) {
		// TODO Auto-generated method stub
		return clubApplyDao.updateUserApply(sqlSession, applyNoList);
	}

	@Override
	public int selectParticipate(int clubNo, String userId) {
		// TODO Auto-generated method stub
		return clubApplyDao.selectParticipate(sqlSession, clubNo, userId);
	}
	
	


}
