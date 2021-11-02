package com.kh.bookmate.seller.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Seller {

	private String sellerNo;
	private String sellerId;
	private String sellerNickN;
	private String sellerEmail;
	private String sellerPhone;
	private String sellerDel;
	private int sellerDelP1;
	private int sellerDelP2;
	private String sellerAddress;
	private Date sellerEnrollD;
	private Date sellerModifyD;
	private String status;
	/*
	public Seller() {
		super();
	}
	
	public Seller(String sellerNo, String sellerId, String sellerNickN, String sellerEmail, String sellerPhone,
			String sellerDel, int sellerDelP1, int sellerDelP2, String sellerAddress, Date sellerEnrollD,
			Date sellerModifyD, String status) {
		super();
		this.sellerNo = sellerNo;
		this.sellerId = sellerId;
		this.sellerNickN = sellerNickN;
		this.sellerEmail = sellerEmail;
		this.sellerPhone = sellerPhone;
		this.sellerDel = sellerDel;
		this.sellerDelP1 = sellerDelP1;
		this.sellerDelP2 = sellerDelP2;
		this.sellerAddress = sellerAddress;
		this.sellerEnrollD = sellerEnrollD;
		this.sellerModifyD = sellerModifyD;
		this.status = status;
	}

	
	public String getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(String sellerNo) {
		this.sellerNo = sellerNo;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getSellerNickN() {
		return sellerNickN;
	}

	public void setSellerNickN(String sellerNickN) {
		this.sellerNickN = sellerNickN;
	}

	public String getSellerEmail() {
		return sellerEmail;
	}

	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}

	public String getSellerPhone() {
		return sellerPhone;
	}

	public void setSellerPhone(String sellerPhone) {
		this.sellerPhone = sellerPhone;
	}

	public String getSellerDel() {
		return sellerDel;
	}

	public void setSellerDel(String sellerDel) {
		this.sellerDel = sellerDel;
	}

	public int getSellerDelP1() {
		return sellerDelP1;
	}

	public void setSellerDelP1(int sellerDelP1) {
		this.sellerDelP1 = sellerDelP1;
	}

	public int getSellerDelP2() {
		return sellerDelP2;
	}

	public void setSellerDelP2(int sellerDelP2) {
		this.sellerDelP2 = sellerDelP2;
	}

	public String getSellerAddress() {
		return sellerAddress;
	}

	public void setSellerAddress(String sellerAddress) {
		this.sellerAddress = sellerAddress;
	}

	public Date getSellerEnrollD() {
		return sellerEnrollD;
	}

	public void setSellerEnrollD(Date sellerEnrollD) {
		this.sellerEnrollD = sellerEnrollD;
	}

	public Date getSellerModifyD() {
		return sellerModifyD;
	}

	public void setSellerModifyD(Date sellerModifyD) {
		this.sellerModifyD = sellerModifyD;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Seller [sellerNo=" + sellerNo + ", sellerId=" + sellerId + ", sellerNickN=" + sellerNickN
				+ ", sellerEmail=" + sellerEmail + ", sellerPhone=" + sellerPhone + ", sellerDel=" + sellerDel
				+ ", sellerDelP1=" + sellerDelP1 + ", sellerDelP2=" + sellerDelP2 + ", sellerAddress=" + sellerAddress
				+ ", sellerEnrollD=" + sellerEnrollD + ", sellerModifyD=" + sellerModifyD + ", status=" + status + "]";
	}
	*/
	
}
