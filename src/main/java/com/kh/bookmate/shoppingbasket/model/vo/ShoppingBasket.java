package com.kh.bookmate.shoppingbasket.model.vo;

public class ShoppingBasket {
	
	private int basketNo;
	private String bookISBN;
	private String user_Id;
	private int quantity;
	
	public ShoppingBasket() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShoppingBasket(int basketNo, String bookISBN, String user_Id, int quantity) {
		super();
		this.basketNo = basketNo;
		this.bookISBN = bookISBN;
		this.user_Id = user_Id;
		this.quantity = quantity;
	}

	public ShoppingBasket(String bookISBN, String user_Id, int quantity) {
		super();
		this.bookISBN = bookISBN;
		this.user_Id = user_Id;
		this.quantity = quantity;
	}

	public int getBasketNo() {
		return basketNo;
	}

	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}

	public String getBookISBN() {
		return bookISBN;
	}

	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "ShoppingBasketVo [basketNo=" + basketNo + ", bookISBN=" + bookISBN + ", user_Id=" + user_Id
				+ ", quantity=" + quantity + "]";
	}
	
	

}
