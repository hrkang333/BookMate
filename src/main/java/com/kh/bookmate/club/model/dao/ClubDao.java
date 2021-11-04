/* 파일 설명 : 레포지토리(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.10.28
 * */
package com.kh.bookmate.club.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;
import com.kh.bookmate.common.PageInfo;

@Repository
public class ClubDao {

	public int checkHost(SqlSessionTemplate sqlSession, String hostName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("clubMapper.checkHost", hostName);
	}

	//1) Club테이블에 넣기
	public int saveStep1(SqlSessionTemplate sqlSession, Club c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("clubMapper.saveStep1_1", c);
	}

	//2) Club_attachment 테이블에 넣기
	public int saveStep1(SqlSessionTemplate sqlSession, ClubAttachment ca) {
		// TODO Auto-generated method stub
		return sqlSession.insert("clubMapper.saveStep1_2", ca);
	}

	public int saveStep2(SqlSessionTemplate sqlSession, Club c) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubMapper.saveStep2_1", c);
	}

	public int saveStep2(SqlSessionTemplate sqlSession, ClubAttachment ca) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubMapper.saveStep2_2", ca);
	}

	public int saveStep3(SqlSessionTemplate sqlSession, Club c) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubMapper.saveStep3_1", c);
	}

	public int saveStep3(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("clubMapper.saveStep3_2", map);
	}

	public int insertClub(SqlSessionTemplate sqlSession, Club c) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubMapper.insertClub", c);
	}

	public ArrayList<Club> selectList3(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage()-1)*(pi.getBoardLimit());
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("clubMapper.selectList3", userId, rowBounds);
	}

	public ArrayList<ClubAttachment> selectPhotoList(SqlSessionTemplate sqlSession, List<Integer> clubNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("clubMapper.selectPhotoList", clubNo);
	}

	public int deleteClub3(SqlSessionTemplate sqlSession, List<Integer> clubNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("clubMapper.deleteClub3",clubNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("clubMapper.selectListCount",userId);
	}

}
