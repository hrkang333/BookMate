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
public class ClubHostTime {
	private int historyNo;
	private int clubNo;
	private Date startDate;
	private Date endDate;
	private String whatTodo;
}
