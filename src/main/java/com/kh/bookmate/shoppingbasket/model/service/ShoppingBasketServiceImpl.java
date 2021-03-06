package com.kh.bookmate.shoppingbasket.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.shoppingbasket.model.dao.ShoppingBasketDao;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;

@Service
public class ShoppingBasketServiceImpl implements ShoppingBasketService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ShoppingBasketDao shoppingBasketDao;

	@Override
	public void insertBasket(ShoppingBasket basket) {

		shoppingBasketDao.insertBasket(sqlSession,basket);
		
		
	}

	@Override
	public List<ShoppingBasket> selectCartList(String user_Id) {
		// TODO Auto-generated method stub
		return shoppingBasketDao.selectCartList(sqlSession,user_Id);
	}

	@Override
	public List<Book> selectBookList(List<ShoppingBasket> basketList) {
		// TODO Auto-generated method stub
		List<Book> selectBookList = shoppingBasketDao.selectBookList(sqlSession,basketList);
		if(selectBookList == null) {
			throw new RuntimeException("장바구니 북리스트 가져오기 오류");
		}
		return selectBookList;
	}

	@Override
	public int deleteBasket(int basketNo) {
		// TODO Auto-generated method stub
		return shoppingBasketDao.deleteBasket(sqlSession,basketNo);
	}

	@Override
	public ShoppingBasket selectBasket(ShoppingBasket basket) {
		// TODO Auto-generated method stub
		return shoppingBasketDao.selectBasket(sqlSession,basket);
	}

}
