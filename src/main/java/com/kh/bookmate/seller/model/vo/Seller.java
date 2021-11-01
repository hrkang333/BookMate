package com.kh.bookmate.seller.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Seller {

	private String sellerNo;
	private String sellerId;
	private String sellerNickN;
	private String sellerEmail;
	private String sellerPhone;
	private String sellerDel;
	private int sellerDel_p1;
	private int sellerDel_p2;
	private String sellerAddress;
	private Date seller_enrollDate;
	private Date seller_modifyDate;
	private String status;
	
	
}
