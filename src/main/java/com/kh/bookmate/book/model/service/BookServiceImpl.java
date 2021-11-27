package com.kh.bookmate.book.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.dao.BookDao;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.main.model.service.MainService;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.user.model.vo.User;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private MainService mainService;

	@Override
	public Book selectBook(String bookISBN) {
		
		Book book = null;
		
		book = bookDao.selectBook(sqlSession,bookISBN);
		
		if(book==null) {
			throw new RuntimeException("도서 세부정보 불러오기 오류");
		}
		
		return book;
	}

	@Override
	public Book selectBookStock(String bookISBN) {
		
		Book book = null;
		
		book = bookDao.selectBook(sqlSession,bookISBN);
		
		
		return book;
	}
	
	@Override
	public void insertBook(Book book) {
		
		int reulst = bookDao.insertBook(sqlSession,book);
		
		if(reulst < 0 ) {
			throw new RuntimeException("도서 입고 오류");
						
		}
		
	}

	

	@Override
	public List<Book> selectCategoryBookList(int i) {
		
		return bookDao.selectCategoryBookList(sqlSession,i);
	}

	@Override
	public void sellDateInsert(List<Book> bookList) {
		
		
		for(Book book : bookList) {
			
			int result = bookDao.sellDateInsert(sqlSession,book);
			if(result < 0) {
				throw new RuntimeException("판매부수 입력 오류"); 
			}
			
		}
		
	}

	@Override
	public List<Book> selectBestBookList(int bookSubCategory) {
		// TODO Auuto-generated method stub
		return bookDao.selectBestBookList(sqlSession,bookSubCategory);
	}

	@Override
	public List<Book> selectNewBookList(int bookSubCategory) {
		// TODO Auto-generated method stub
		return bookDao.selectNewBookList(sqlSession,bookSubCategory);
	}

	@Override
	public int selectAllBestRank(String bookISBN) {
		// TODO Auto-generated method stub
		return bookDao.selectAllBestRank(sqlSession, bookISBN);
	}

	@Override
	public int selectCategoryBestRank(Book book) {
		// TODO Auto-generated method stub
		return bookDao.selectCategoryBestRank(sqlSession, book);
	}

	@Override
	public Book selectCheckISBN(String bookISBN) {
		Book book = null;
		
		book = bookDao.selectBook(sqlSession,bookISBN);
		
		
		return book;
	}

	//화제의 신간
	@Override
	public ArrayList<Book> selectHotTopicBook() {
		return bookDao.selectHotTopicBook(sqlSession);
	}

	@Override
	public void insertRecentView(String userId, String bookISBN) {
		

	         mainService.insertRecentView(bookISBN, userId);
	}

	
	@Override
	public void updateBookPlusStock(Map<String, Object> map) {
		int result=bookDao.updateBookPlusStock(sqlSession,map);
		if(result < 0) {
			throw new RuntimeException("도서 재고 등록중 db 오류");
		}
		
	}

	

}
