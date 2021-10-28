package com.kh.bookmate.exchange_item.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
 

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ExchageItem {
	
	private int exchageNo;
	private int paymentDetailNo;
	private int paymentNo;
	private Date exchageDate;
	private Date exchageAccept;
	private String exchageStatus;
	

}
