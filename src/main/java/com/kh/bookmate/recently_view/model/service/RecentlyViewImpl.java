package com.kh.bookmate.recently_view.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.recently_view.model.dao.RecentlyViewDao;

@Service
public class RecentlyViewImpl implements RecentlyViewService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RecentlyViewDao recentlyViewDao;
}
