package com.kh.bookmate.exchange_item.model.service;

import java.util.List;

import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;

public interface ExchangeItemService {

	void insertExchangeItem(ExchangeItem exchangeBook);

	List<ExchangeItem> selectExchangeList();

	List<ExchangeItem> selectOrderDetailNoList(List<Integer> exchangeDetailNoList);




 
 
}
   