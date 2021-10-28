/* 파일 설명 : 레포지토리(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.10.28
 * */
package com.kh.bookmate.club.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ClubDao {

	public int checkHost(SqlSessionTemplate sqlSession, String hostName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("clubMapper.checkHost", hostName);
	}

}
