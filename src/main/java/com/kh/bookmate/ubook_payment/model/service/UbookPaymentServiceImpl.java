package com.kh.bookmate.ubook_payment.model.service;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.ubook_cart.model.vo.UbookCart;
import com.kh.bookmate.ubook_payment.model.dao.UbookPaymentDao;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;
import com.kh.bookmate.user.model.dao.UserDao;

@Service
public class UbookPaymentServiceImpl implements UbookPaymentService {

	@Autowired
	private SqlSessionTemplate sqlSession;
		
	@Autowired 
	private UbookPaymentDao ubookPaymentDao;
 

	@Override
	public int insertUbookPayment(UbookPayment temp, List<UbookPaymentDetail> list, List<UbookCart> deleteCartList) {
		
		int result = ubookPaymentDao.insertUbookPayment(sqlSession,temp);
		if(result < 0) {
			throw new RuntimeException("결제 정보 저장 오류");
		}
		int paymentNoUb = temp.getPaymentNoUb();
		for(UbookPaymentDetail upd : list) {
			upd.setPaymentNoUb(paymentNoUb);
			int result2 = ubookPaymentDao.insertUbookPaymentDetail(sqlSession,upd);
			if(result2 < 0) {
				throw new RuntimeException("세부 결제 정보 저장 오류");
			}
		}
		for(UbookCart cart : deleteCartList) {
			int result3 = ubookPaymentDao.deleteCart(sqlSession,cart.getCartNo());
			if(result3 < 0) {
				throw new RuntimeException("결제후 장바구니 삭제 오류");
			}
		}
		/*
		 * for(UbookCart cart : updateUbookStock) {
		 * System.out.println("paymentServiceImpl cart" + cart);
		 * System.out.println("paymentServiceImpl getCartUbNo" + cart.getCartUbNo());
		 * int result4 =
		 * ubookPaymentDao.updateUbookStock(sqlSession,cart.getCartUbNo()); if(result4 <
		 * 0) { throw new RuntimeException("결제후 수량 변경 삭제 오류"); } }
		 */
		return result;
	}
	
	/*@Override
	public void insertUbookPayment(UbookPayment temp, List<UbookPaymentDetail> list, List<UbookCart> deleteCartList, List<UbookCart> updateUbookStock) {
		
		int result = ubookPaymentDao.insertUbookPayment(sqlSession,temp);
		if(result < 0) {
			throw new RuntimeException("결제 정보 저장 오류");
		}
		int paymentNoUb = temp.getPaymentNoUb();
		for(UbookPaymentDetail upd : list) {
			upd.setPaymentNoUb(paymentNoUb);
			int result2 = ubookPaymentDao.insertUbookPaymentDetail(sqlSession,upd);
			if(result2 < 0) {
				throw new RuntimeException("세부 결제 정보 저장 오류");
			}
		}
		for(UbookCart cart : deleteCartList) {
			int result3 = ubookPaymentDao.deleteCart(sqlSession,cart.getCartNo());
			if(result3 < 0) {
				throw new RuntimeException("결제후 장바구니 삭제 오류");
			}
		}
		for(UbookCart cart : updateUbookStock) {
		System.out.println("paymentServiceImpl cart" + cart);
		System.out.println("paymentServiceImpl getCartUbNo" + cart.getCartUbNo());
			int result4 = ubookPaymentDao.updateUbookStock(sqlSession,cart.getCartUbNo());
			if(result4 < 0) {
				throw new RuntimeException("결제후 수량 변경 삭제 오류");
			}
		}
	}*/


	@Override
	public List<UbookPayment> selectMyOrderList(String loginUser) {
		List<UbookPayment> list = ubookPaymentDao.selectMyOrderList(sqlSession, loginUser);
		return list;
	}


	@Override
	public int selectListCount(String loginUser) {
		// TODO Auto-generated method stub
		return ubookPaymentDao.selectListCount(sqlSession,loginUser);
	}


	@Override
	public List<UbookPaymentDetail> selectMyOrderListDetail(int paymentNoUb) {
		List<UbookPaymentDetail> list = ubookPaymentDao.selectMyOrderListDetail(sqlSession,paymentNoUb);
		return list;
	}


	@Override
	public int confirmOrder(int paymentDetailNoUb) {
		int list = ubookPaymentDao.confirmOrder(sqlSession,paymentDetailNoUb);
		return list;
	}


	@Override
	public UbookPayment selectPaymentNo(int paymentNoUb) {
		UbookPayment list = ubookPaymentDao.selectPaymentNo(sqlSession,paymentNoUb);
		return list;
	}


	@Override
	public void updateUpdateDelivery(UbookPaymentDetail ubookPaymentDeatil) {
		
	}


	@Override
	public List<UbookPaymentDetail> selectDeliveryList() {
		List<UbookPaymentDetail> list = ubookPaymentDao.selectDeliveryList(sqlSession);
		return list;
	}


	@Override
	public List<UbookPayment> selectDeliveryPaymentNoList(List<Integer> deliveryDetailNoList) {
		List<UbookPayment> paymentNoList = ubookPaymentDao.selectDeliveryPaymentNoList(sqlSession,deliveryDetailNoList);
		return paymentNoList;
	}


	@Override
	public int updateUbookStock(int cartUbNo) {
		return ubookPaymentDao.updateUbookStock(sqlSession,cartUbNo);
	}

	
}
