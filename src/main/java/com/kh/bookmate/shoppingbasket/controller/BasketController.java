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
import com.kh.bookmate.paymentmethod.model.service.PaymentMethodService;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethod;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethodDetail;
import com.kh.bookmate.shoppingbasket.model.service.ShoppingBasketService;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class BasketController {

	@Autowired
	private ShoppingBasketService shoppingBasketService;

	@Autowired
	private AddressBookService addressBookService;
	
	@Autowired
	private PaymentMethodService paymentMethodService;

	@RequestMapping("insertBasket.ba")
	@ResponseBody
	public String insertBasket(ShoppingBasket basket) {

		System.out.println(basket);
		shoppingBasketService.insertBasket(basket);
		return "success";
	}

	@RequestMapping("shoppingCart.sc")
	public String selectCartList(String user_Id, Model mo) {

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
	public String selectPaymentPage(ShoppingBasket basketList, @SessionAttribute("loginUser") User user,Model mo) {

		List<ShoppingBasket> newBasketList = basketList.getBasketList();
		List<Book> cartItemList = null;
		List<PaymentDetail> orderList = new ArrayList<PaymentDetail>();
		Payment order = null;
		PaymentDetail orderDetail = null;
		Book tempBook = null;
		AddressBook abook = null;
		ShoppingBasket tempBasket = null;
		PaymentMethod paymentMethod = null;
		List<PaymentMethodDetail> PMDetailList = null;
		int totalCost = 0;
		int getPoint = 0;
		String shippingName, shippingAddress, shippingPhone;
		String[] shippingAddressArr;

		//주문 페이지로 가져갈 장바구니 상품들과 주문테이블에 표시될 금액 정보 처리
		cartItemList = shoppingBasketService.selectBookList(newBasketList);
		for (int i = 0; i < newBasketList.size(); i++) {
			tempBook = cartItemList.get(i);
			tempBasket = newBasketList.get(i);
			orderDetail = new PaymentDetail(tempBook.getBookISBN(), tempBook.getBookMainImg(), tempBook.getBookTitle(),
					tempBasket.getQuantity(), tempBook.getBookPrice(), (int) (tempBook.getBookPrice() * 0.9),
					(int) (tempBook.getBookPrice() * 0.05));
			orderDetail.setDeliveryDate(ShipDate());
			orderList.add(orderDetail);
			totalCost += (int) (tempBook.getBookPrice() * 0.9 * tempBasket.getQuantity());
		}
		getPoint = (int) (totalCost * 0.05);

		
		//주문 페이지로 가져갈 주소록 처리
		abook = addressBookService.selcetAddressBook(user.getUserId());
		if (abook != null) {
			String[] arrTemp = abook.getMainAddress().split("_");
			shippingName = arrTemp[0];
			shippingAddress = arrTemp[1];
			shippingPhone = arrTemp[2];
		} else {
			shippingName = user.getUserName();
			shippingAddress = user.getAddress();
			shippingPhone = user.getPhone();
			String strTemp = shippingName + "_" + shippingAddress + "_" + shippingPhone;
			abook = new AddressBook(user.getUserId(), strTemp);
			addressBookService.insertAddressBook(abook);
		}
		
		//주문 페이지로 가져갈 저장된 결제수단 처리
		paymentMethod = paymentMethodService.selectPaymentMethod(user.getUserId());
		if(paymentMethod==null) {
			paymentMethodService.insertPaymentMethod(user.getUserId());
		}else {
			if(paymentMethod.getMainPayment()!=0) {
				PMDetailList = paymentMethodService.selectPMDetailList(paymentMethod);
				mo.addAttribute("PMDetailList", PMDetailList);
			}
		}

		shippingAddressArr = shippingAddress.split("/");
		
		order = new Payment(user.getUserId(), shippingName, shippingAddressArr[0], shippingAddressArr[1],shippingAddressArr[2],shippingPhone, totalCost, getPoint);
		
		mo.addAttribute("order", order);
		mo.addAttribute("orderList", orderList);
		return "payment/orderDetail";

	}

	public Date ShipDate() {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"), Locale.KOREA);
		Date date = cal.getTime();
		if (16 > Integer.parseInt(new SimpleDateFormat("HH").format(date))) {

//			new SimpleDateFormat("yyyy-MM-dd").format(date);
			return date;
		} else {
			cal.add(cal.DATE, 1);
//			new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			return cal.getTime();
		}
	}
	
	@RequestMapping("deleteBasket.sc")
	@ResponseBody
	public String deleteBasket(int basketNo) {
		
		int result = shoppingBasketService.deleteBasket(basketNo);
		if(result > 0) {
			return "pass";
		}
		
		return "fail";
		
	}

}
