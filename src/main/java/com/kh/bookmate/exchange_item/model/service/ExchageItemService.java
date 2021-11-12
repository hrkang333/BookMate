package com.kh.bookmate.exchange_item.model.service;

import java.util.List;

import com.kh.bookmate.exchange_item.model.vo.ExchageItem;
import com.kh.bookmate.payment.model.vo.PaymentDetail;

public interface ExchageItemService {


	List<ExchageItem> insertExchangeItem(List<PaymentDetail> myOrderListDetail);

	List<ExchageItem> insertExchangeItem(int paymentNo, int paymentDetailNo);


}
   