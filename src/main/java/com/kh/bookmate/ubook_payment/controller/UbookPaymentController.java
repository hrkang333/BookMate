package com.kh.bookmate.ubook_payment.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bookmate.ubook_payment.model.service.UbookPaymentService;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;

@Controller
public class UbookPaymentController {

	@Autowired
	UbookPaymentService ubookPaymentService;
	
	@RequestMapping("insertUbookPayment")
	public String insertUbookPayment(UbookPaymentDetail ubookPaymentDetailList, UbookPayment ubookPayment) {
		
		UbookPayment temp = ubookPayment;
		List<UbookPaymentDetail> list = new ArrayList<UbookPaymentDetail>();
		temp.setShippingAddressUb(ubookPayment.getShippingPostCodeUb()+"/"+ubookPayment.getShippingAddressUb()+"/"+ubookPayment.getShippingAddressDetailUb());
		
		
		for(int i= 0 ; i < ubookPaymentDetailList.getUbookPaymentDetailList().size();i++ ) {
			ubookPaymentDetailList.getUbookPaymentDetailList().get(i).setDeliveryDateUb(ShipDate());
			list.add(ubookPaymentDetailList.getUbookPaymentDetailList().get(i));
			
		}
		ubookPaymentService.insertUbookPayment(temp,list);
		
		
		return "ubook_payment/ubookOrderComplete";
		
		
		
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
	
	
}
