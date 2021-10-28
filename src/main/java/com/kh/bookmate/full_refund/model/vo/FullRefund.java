package com.kh.bookmate.full_refund.model.vo;

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
public class FullRefund {
	
	private int refundNo; //환불 번호 
	private int returnNo; //반품 번호 
	private int paymentDetailNo; // 상세결제번호
	private int paymentNo; // 결제번호
	private Date refundDate;
	private Date refundAccept;
	private String refundStatus; //환불 처리상태 Y/N
	private int totalRefund; //환불 총금액 
	private int refundParcel; //환불배송비 
	private int refundPoint;//환불포인트
	private int refundMethod; //환불 수단 
	

}
