/* 파일 설명 : 서비스(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.10.30
 * 수정필요 : 오류처리 (dao결과에 따른)
 * */
package com.kh.bookmate.club.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.club.model.dao.ClubDao;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;

@Service
public class ClubServiceImpl implements ClubService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubDao clubDao;
	
	private int keyClubNo;  //insert할때 단계 건너뛸 때 clubNo전역변수로 저장해두고 쓰려고 만듦/currval은 한번만 쓰고
	
	
	@Override
	public int checkHost(String hostName) {
		
		return clubDao.checkHost(sqlSession, hostName);
	}

	@Override
	public void saveStep1(Club c, ClubAttachment ca) {
		// TODO Auto-generated method stub
		int result = 0;
		result = clubDao.saveStep1(sqlSession, c);  	 //1) Club테이블에 넣기
		if(ca != null) {
			result = clubDao.saveStep1(sqlSession, ca);  //2) Club_attachment 테이블에 넣기
		}
		
		keyClubNo = c.getClubNo();
		
		if(result < 0) {
			//오류처리
		}
	}

}
