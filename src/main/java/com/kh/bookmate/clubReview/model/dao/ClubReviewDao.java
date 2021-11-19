package com.kh.bookmate.clubReview.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.clubReview.model.vo.ClubReview;

@Repository
public class ClubReviewDao {

	public int selectParticipate(SqlSessionTemplate sqlSession, int clubNo, String userId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("clubNo", clubNo);
		return sqlSession.selectOne("clubApplyMapper.selectParticipate", map);
	}
	
	public int selectBefReview(SqlSessionTemplate sqlSession, int clubNo, String userId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("clubNo", clubNo);
		return sqlSession.selectOne("clubApplyMapper.selectBefReview", map);
	}

	public int insertReview(SqlSessionTemplate sqlSession, ClubReview cr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("clubApplyMapper.insertReview", cr);
	}

	public List<ClubReview> selectReviewList(SqlSessionTemplate sqlSession, int clubNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("clubApplyMapper.selectReviewList", clubNo);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int clubNo, String userId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("clubNo", clubNo);
		return sqlSession.update("clubApplyMapper.deleteReview", map);
	}
}
