package com.kh.bookmate.exchange_item.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.bookmate.exchange_item.model.service.ExchageItemService;

@Controller
public class ExchageItemController {

	@Autowired
	private ExchageItemService exchageItemService;
	
	 
}
