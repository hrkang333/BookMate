/* 파일 설명 : 서비스(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.11.01
 * */
package com.kh.bookmate.club.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;
import com.kh.bookmate.club.model.vo.ClubTime;
import com.kh.bookmate.common.PageInfo;

public interface ClubService {

	int checkHost(String hostName);

	int saveStep1(Club c, ClubAttachment ca);

	void saveStep2(Club c, ClubAttachment ca);

	void saveStep3(Club c, ClubAttachment ca, Map<String, Object> map);

	void insertClub(Club c, ClubAttachment ca, Map<String, Object> map);

	ArrayList<Club> selectList3(String userId, PageInfo pi);

	ArrayList<ClubAttachment> selectPhotoList(List<Integer> clubNo);

	void deleteClub3(List<Integer> clubNo);

	int selectListCount(String userId);

	ArrayList<Club> selectCateList(String category);  

}
