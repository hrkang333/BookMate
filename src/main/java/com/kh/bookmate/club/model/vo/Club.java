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
	private int times;
	private int onoffLine;
	private int clubCapacity;
	private Date startDate;
	private Date endDate;
	private String bkName;
	private String bkWriter;
	private String bkPublisher;
	private Date createDate;
	private int condition;
	private String status;
}
