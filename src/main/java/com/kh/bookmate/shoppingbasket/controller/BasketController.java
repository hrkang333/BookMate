package com.kh.bookmate.shoppingbasket.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.bookmate.addressBook.model.service.AddressBookService;
import com.kh.bookmate.addressBook.model.vo.AddressBook;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.shoppingbasket.model.service.ShoppingBasketService;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class BasketController {
	
	@Autowired
	ShoppingBasketService shoppingBasketService;
	
	@Autowired
	AddressBookService addressBookService;

	
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
		String shipDate = new SimpleDateFormat("yyyy-MM-dd").format(ShipDate());
		basketList = shoppingBasketService.selectCartList(user_Id);
		cartItemList = shoppingBasketService.selectBookList(basketList);
		mo.addAttribute("basketList", basketList);
		mo.addAttribute("cartItemList", cartItemList);
		mo.addAttribute("shipDate", shipDate);
		
		return "basket/shoppingCart";
		
	}
	
	@RequestMapping("movePayment.sc")
	public String selectPaymentPage(ShoppingBasket basketList,@SessionAttribute("loginUser") User user) {
		
		List<ShoppingBasket> newBasketList = basketList.getBasketList();
		List<Book> cartItemList = null;
		List<PaymentDetail> orderList = new ArrayList<PaymentDetail>();
		Payment order = null;		
		PaymentDetail orderDetail = null;
		Book tempBook = null;
		AddressBook abook = null;
		ShoppingBasket tempBasket = null;
		int totalCost = 0;
		int getPoint = 0;
		String shippingName, shippingAddress, shippingPhone;
		cartItemList = shoppingBasketService.selectBookList(newBasketList);
		
		for(int i = 0 ; i < newBasketList.size() ; i++ ) {
			tempBook = cartItemList.get(i);
			tempBasket = newBasketList.get(i);
			orderDetail = new PaymentDetail(tempBook.getBookISBN(), tempBook.getBookMainImg(), tempBook.getBookTitle(), tempBasket.getQuantity(), tempBook.getBookPrice(), (int)(tempBook.getBookPrice()*0.9), (int)(tempBook.getBookPrice()*0.05));
			orderDetail.setDeliveryDate(ShipDate());
			orderList.add(orderDetail);
			totalCost += (int)(tempBook.getBookPrice()*0.9*tempBasket.getQuantity());
		}
		getPoint = (int)(totalCost*0.05);
		
		abook = addressBookService.selcetAddressBook(user.getUserId());
		if(abook != null) {
			String[] arrTemp = abook.getMainAddress().split("|");
			shippingName = arrTemp[0];
			shippingAddress = arrTemp[1];
			shippingPhone = arrTemp[2];
		}else {
			shippingName = user.getUserName();
			shippingAddress = user.getAddress();
			shippingPhone = user.getPhone();
			String strTemp = shippingName+"|"+shippingAddress+"|"+shippingPhone;
			abook = new AddressBook(user.getUserId(), strTemp);
			addressBookService.insertAddressBook(abook);
		}
		
		order = new Payment(user.getUserId(), shippingName, shippingAddress, shippingPhone, totalCost, null, getPoint);
		System.out.println(order);
		return null;
		
	}
	
	public Date ShipDate() {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"),Locale.KOREA);
		Date date = cal.getTime();
		if(16 > Integer.parseInt(new SimpleDateFormat("HH").format(date))) {

//			new SimpleDateFormat("yyyy-MM-dd").format(date);
			return date;
		}else {
			cal.add(cal.DATE,1);
//			new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			return cal.getTime();
		}
	}
	
}
