/* 파일 설명 : 서비스(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.10.28
 * */
package com.kh.bookmate.club.model.service;

import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;

public interface ClubService {

	int checkHost(String hostName);

	void saveStep1(Club c, ClubAttachment ca);

}
