package com.kh.bookmate.full_refund.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.full_refund.model.dao.FullRefundDao;

@Service
public class FullRefundImpl implements FullRefundService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FullRefundDao fullRefundDao;
}
 