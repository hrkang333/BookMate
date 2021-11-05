package com.kh.bookmate.shoppingbasket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookmate.shoppingbasket.model.service.ShoppingBasketService;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;

@Controller
public class BasketController {
	
	@Autowired
	ShoppingBasketService shoppingBasketService;
	
	@RequestMapping("insertBasket.ba")
	@ResponseBody
	public String insertBasket(ShoppingBasket basket) {
		
		System.out.println(basket);
		return "success";
	}
}
