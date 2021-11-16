package com.kh.bookmate.payment.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

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
		String key = encPwd.substring(0, 16);
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
		paymentMethodService.insertPMDetail(paymentMethod,PMDetail);
		
		System.out.println(pmd);
		return "sss";
		
	}
	@RequestMapping("selectPaymentMethod")
	@ResponseBody
	public Map<String, Object> selectMethod(int selectMethodIndex,PaymentMethod paymentMethod){
		Map<String, Object>  map = new HashMap<String, Object>();
		System.out.println(paymentMethod);
		PaymentMethodDetail PMDetail = new PaymentMethodDetail();
		PMDetail.setBankAccount("asfafaf");
		map.put("pop", PMDetail);
		map.put("11", 3);
		
		return map;
		
	}
	
	@RequestMapping("insertPayment")
	public String insertPayment(PaymentDetail paymentDetailList, Payment payment) {
		
		
		System.out.println(paymentDetailList.getPaymentDetailList());
		System.out.println(payment);
		
		
		return null;
		
		
		
	}
}
