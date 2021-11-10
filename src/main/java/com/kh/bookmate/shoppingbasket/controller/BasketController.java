package com.kh.bookmate.shoppingbasket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookmate.book.model.vo.Book;
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
		shoppingBasketService.insertBasket(basket);
		return "success";
	}
	
	@RequestMapping("shoppingCart.sc")
	public String selectCartList(String user_Id,Model mo) {
		
		List<ShoppingBasket> basketList = null;
		List<Book> cartItemList = null;
		System.out.println(user_Id);
		
		basketList = shoppingBasketService.selectCartList(user_Id);
		cartItemList = shoppingBasketService.selectBookList(basketList);
		mo.addAttribute("basketList", basketList);
		mo.addAttribute("cartItemList", cartItemList);
		for(Book s : cartItemList) {
			System.out.println(s);
		}
		
		return "basket/shoppingCart";
		
	}
}
