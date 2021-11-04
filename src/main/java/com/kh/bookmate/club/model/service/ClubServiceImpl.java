/* 파일 설명 : 서비스(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.11.01
 * 수정필요 : 오류처리 (dao결과에 따른)
 * */
package com.kh.bookmate.club.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.club.model.dao.ClubDao;
import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;
import com.kh.bookmate.club.model.vo.ClubTime;
import com.kh.bookmate.common.PageInfo;

@Service
public class ClubServiceImpl implements ClubService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubDao clubDao;
	
	
	@Override
	public int checkHost(String hostName) {
		
		return clubDao.checkHost(sqlSession, hostName);
	}

	@Override
	public int saveStep1(Club c, ClubAttachment ca) {
		// TODO Auto-generated method stub
		int result = 0;
		result = clubDao.saveStep1(sqlSession, c);  	 //1) Club테이블에 넣기
		if(ca != null) {
			result = clubDao.saveStep1(sqlSession, ca);  //2) Club_attachment 테이블에 넣기
		}
		
		if(result < 0) {
			//오류처리
		}
		
		return c.getClubNo(); //바로 앞에 추가한 행 clubNo컨트롤러로
	}

	@Override
	public void saveStep2(Club c, ClubAttachment ca) {
		// TODO Auto-generated method stub

		int result1 = clubDao.saveStep2(sqlSession, c);  	 //1) Club테이블에 넣기
		int result2=0;
		if(ca != null) {
			result2 = clubDao.saveStep2(sqlSession, ca);  //2) Club_attachment 테이블에 넣기
		}

		if(result1 < 0 || result2 < 0) {
			//오류처리
		}
	}

	@Override
	public void saveStep3(Club c, ClubAttachment ca, Map<String, Object> map) {
		int result1 = clubDao.saveStep3(sqlSession, c);  	 //1) Club테이블에 넣기
		int result2 = clubDao.saveStep3(sqlSession, map);    //2) ClubTime테이블에 넣기
		int result3 =0;
		if(ca != null) {
			result3 = clubDao.saveStep2(sqlSession, ca);  //3) Club_attachment 테이블에 넣기
		}

		if(result1 < 0 || result2 < 0 || result3 < 0) {
			//오류처리
		}
		
	}

	@Override
	public void insertClub(Club c, ClubAttachment ca, Map<String, Object> map) {
		int result1 = clubDao.insertClub(sqlSession, c);  	 //1) Club테이블에 넣기
		int result2 = clubDao.saveStep3(sqlSession, map);    //2) ClubTime테이블에 넣기
		int result3 =0;
		if(ca != null) {
			result3 = clubDao.saveStep2(sqlSession, ca);  //3) Club_attachment 테이블에 넣기
		}

		if(result1 < 0 || result2 < 0 || result3 < 0) {
			//오류처리
		}		
	}

	@Override
	public ArrayList<Club> selectList3(String userId, PageInfo pi) {

		ArrayList<Club> list = clubDao.selectList3(sqlSession, userId, pi);
		
		return list;
	}

	@Override
	public ArrayList<ClubAttachment> selectPhotoList(List<Integer> clubNo) {
		
		ArrayList<ClubAttachment> plist = clubDao.selectPhotoList(sqlSession,clubNo);
		
		return plist;
	}

	@Override
	public void deleteClub3(List<Integer> clubNo) {
		
		int result = clubDao.deleteClub3(sqlSession, clubNo);
		if(result < 0) {
			//오류처리
		}
		
	}

	@Override
	public int selectListCount(String userId) {
		// TODO Auto-generated method stub
		return clubDao.selectListCount(sqlSession,userId);
	}

	
	
	
}
