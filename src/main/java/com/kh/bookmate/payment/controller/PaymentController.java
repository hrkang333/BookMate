package com.kh.bookmate.payment.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookmate.common.AES;
import com.kh.bookmate.payment.model.service.PaymentService;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.paymentmethod.model.service.PaymentMethodService;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethod;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethodDetail;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;

	@Autowired
	PaymentMethodService paymentMethodService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping("insertPaymentMethod.sc")
	@ResponseBody
	public String insertPaymentMethod(PaymentMethodDetail pmd) {
		PaymentMethodDetail PMDetail = new PaymentMethodDetail();
		PaymentMethod paymentMethod = null;
		paymentMethod = paymentMethodService.selectPaymentMethod(pmd.getUser_Id());

		String encPwd = bCryptPasswordEncoder.encode(pmd.getMethodPwd());
		
		PMDetail = AESEncodeJob(pmd,encPwd);
		
		
		int paymentMethodDetailNo = paymentMethodService.insertPMDetail(paymentMethod,PMDetail);
		
		return paymentMethodDetailNo+"";
		
	}
	@RequestMapping("selectPaymentMethod")
	@ResponseBody
	public PaymentMethodDetail selectMethod(int selectMethodIndex,PaymentMethod paymentMethod){
		
		List<PaymentMethodDetail> PMDetailList = null;
		PMDetailList = paymentMethodService.selectPMDetailList(paymentMethod);
		PaymentMethodDetail PMDetail = AESDecodeJob(PMDetailList.get(selectMethodIndex));
		
		
		return PMDetail;
		
	}
	
	@RequestMapping("insertPayment")
	public String insertPayment(PaymentDetail paymentDetailList, Payment payment,ShoppingBasket basketList) {
		
		System.out.println(basketList);
		
		List<ShoppingBasket> deleteBasketList = basketList.getBasketList();
		Payment temp = payment;
		List<PaymentDetail> list = new ArrayList<PaymentDetail>();
		temp.setShippingAddress(payment.getShippingPostCode()+"/"+payment.getShippingAddress()+"/"+payment.getShippingAddressDetail());
		
		
		for(int i= 0 ; i < paymentDetailList.getPaymentDetailList().size();i++ ) {
			paymentDetailList.getPaymentDetailList().get(i).setDeliveryDate(ShipDate());
			list.add(paymentDetailList.getPaymentDetailList().get(i));
			
		}
		paymentService.insertPayment(temp,list,deleteBasketList);
		
		
		return "payment/orderComplete";
		
		
		
	}
	
	private PaymentMethodDetail AESDecodeJob(PaymentMethodDetail pmd){

		PaymentMethodDetail PMDetail = new PaymentMethodDetail();
		try {
			AES aes = new AES(pmd.getMethodPwd().substring(0, 16));
			
		if(pmd.getMethodStatus()==1) {
			PMDetail.setCardCompany(aes.aesDecode(pmd.getCardCompany()));
			PMDetail.setCardNo(aes.aesDecode(pmd.getCardNo()));
			PMDetail.setCardCVC(aes.aesDecode(pmd.getCardCVC()));
		}else if(pmd.getMethodStatus()==2){
			PMDetail.setBankName(aes.aesDecode(pmd.getBankName()));
			PMDetail.setBankAccount(aes.aesDecode(pmd.getBankAccount()));
			PMDetail.setBankPwd(aes.aesDecode(pmd.getBankPwd()));
			PMDetail.setUserReg(aes.aesDecode(pmd.getUserReg()));
		}else {
			PMDetail.setPhoneNo(aes.aesDecode(pmd.getPhoneNo()));
			PMDetail.setUserReg(aes.aesDecode(pmd.getUserReg()));
		}
		PMDetail.setUser_Id(pmd.getUser_Id());
		PMDetail.setMethodStatus(pmd.getMethodStatus());
		PMDetail.setMethodPwd(pmd.getMethodPwd());
		PMDetail.setPaymentMethodDetailNo(pmd.getPaymentMethodDetailNo());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PMDetail;
	
	}
	
	private PaymentMethodDetail AESEncodeJob(PaymentMethodDetail pmd,String encPwd){
		String key = encPwd.substring(0, 16);
		PaymentMethodDetail PMDetail = new PaymentMethodDetail();
		try {
			AES aes = new AES(key);
		
		if(pmd.getMethodStatus()==1) {
			PMDetail.setCardCompany(aes.aesEncode(pmd.getCardCompany()));
			PMDetail.setCardNo(aes.aesEncode(pmd.getCardNo()));
			PMDetail.setCardCVC(aes.aesEncode(pmd.getCardCVC()));
		}else if(pmd.getMethodStatus()==2){
			PMDetail.setBankName(aes.aesEncode(pmd.getBankName()));
			PMDetail.setBankAccount(aes.aesEncode(pmd.getBankAccount()));
			PMDetail.setBankPwd(aes.aesEncode(pmd.getBankPwd()));
			PMDetail.setUserReg(aes.aesEncode(pmd.getUserReg()));
		}else {
			PMDetail.setPhoneNo(aes.aesEncode(pmd.getPhoneNo()));
			PMDetail.setUserReg(aes.aesEncode(pmd.getUserReg()));
		}
		PMDetail.setUser_Id(pmd.getUser_Id());
		PMDetail.setMethodStatus(pmd.getMethodStatus());
		PMDetail.setMethodPwd(encPwd);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PMDetail;
	
	}
	
	@RequestMapping("checkPayPwd")
	@ResponseBody
	public String checkPayPwd(PaymentMethodDetail pmd) {
		
		System.out.println(pmd);
		
		PaymentMethodDetail PMDTemp = paymentMethodService.selectPaymentMethodDetail(pmd.getPaymentMethodDetailNo());
		
		
		if (!bCryptPasswordEncoder.matches(pmd.getMethodPwd(), PMDTemp.getMethodPwd())) {
			return "fail";
		}else {

			return "pass";
		}
		
	}
	
	public Date ShipDate() {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"), Locale.KOREA);
		Date date = cal.getTime();
		if (16 > Integer.parseInt(new SimpleDateFormat("HH").format(date))) {

			return date;
		} else {
			cal.add(cal.DATE, 1);
			return cal.getTime();
		}
	}
	
	
	@RequestMapping("checkStockForm.pm")
	@ResponseBody
	public String checkStock(ShoppingBasket basketList) {
		String checkStr = "fail";
		List<ShoppingBasket> checkList = basketList.getBasketList();
		
		for(ShoppingBasket basket : checkList) {
			if(paymentService.checkStock(basket)) {
				checkStr = "pass";
			}
		}
		
		return checkStr;
		
	}
	
}
