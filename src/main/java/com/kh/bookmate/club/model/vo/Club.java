package com.kh.bookmate.club.model.vo;

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
public class Club {
	private int clubNo;
	private int placeNo;
	private String userId;
	private String clubTitle;
	private String intro;
	private String activity;
	private String want;
	private String notwant;
	private String times;
	private String onoffLine;
	private int clubCapacity;
	private Date clubStartDate;
	private Date clubEndDate;
	private String bkName;
	private String bkWriter;
	private String bkPublisher;
	private Date createDate;
	private int condition;
	private String status;
	//10.29 추가 (HOST, HOSTTIME 테이블 삭제)
	private String hostName;
	private String hostComment;
	private String hstartDate;
	private String hendDate;
	private String hwhatTodo;
	private String category;
}
