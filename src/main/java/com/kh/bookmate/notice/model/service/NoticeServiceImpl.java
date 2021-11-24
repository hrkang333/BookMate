package com.kh.bookmate.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.notice.model.dao.NoticeDao;
import com.kh.bookmate.notice.model.vo.Notice;



@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Notice> selectNoticeList(String temp, RowBounds rb) {
		// TODO Auto-generated method stub
		return noticeDao.selectNoticeList(sqlSession,temp,rb);
	}

	@Override
	public int selectNoticeCount(String temp) {
		// TODO Auto-generated method stub
		return noticeDao.selectNoticeCount(sqlSession,temp);
	}

	@Override
	public Notice selectNoticeDetail(int noticeNo) {
		
		Notice notice = noticeDao.selectNoticeDetail(sqlSession,noticeNo);
		int result = noticeDao.updateReadCount(sqlSession,noticeNo);
		if(notice==null) {
			throw new RuntimeException("공지사항 상세보기 db 오류");
		}
		if(result<0) {
			throw new RuntimeException("공지사항 조회수 업데이트 db 오류");
		}
		return notice;
	}

}
