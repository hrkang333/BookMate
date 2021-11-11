package com.kh.bookmate.clubApply.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ClubApplyDao {

	public int selectCheckApply(SqlSessionTemplate sqlSession, List<Integer> times, String userId) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("times", times);
		map.put("userId", userId);
		
		return sqlSession.selectOne("clubApplyMapper.checkBeforeApply",map);
	}

	//1. club_apply테이블에 insert하기
	public int insertApply(SqlSessionTemplate sqlSession, List<Integer> times, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("times", times);
		map.put("userId", userId);
		
		return sqlSession.insert("clubApplyMapper.insertApply",map);
	}

	//1-2.club_time테이블에 'apply_count'컬럼 update하기
	public int insertApplyTime(SqlSessionTemplate sqlSession, List<Integer> times) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubApplyMapper.insertApplyTime",times);
	}

	//2. 찜목록 : club_wish테이블에서 값 있는지 체크하기
	public int selectCheckHeart(SqlSessionTemplate sqlSession, int clubNo, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubNo", clubNo);
		map.put("userId", userId);
		
		return sqlSession.selectOne("clubApplyMapper.selectCheckHeart",map);
	}

	public int insertHeart(SqlSessionTemplate sqlSession, String userId, int clubNo) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("clubNo", clubNo);
		
		return sqlSession.insert("clubApplyMapper.insertHeart",map);
	}

	public int updateHeartCount(SqlSessionTemplate sqlSession, int clubNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubApplyMapper.updateHeartCount", clubNo);
	}

}
