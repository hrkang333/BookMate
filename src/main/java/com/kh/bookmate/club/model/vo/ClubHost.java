package com.kh.bookmate.club.model.vo;

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
public class ClubHost {
	private int hostNo;
	private int clubNo;
	private String hostName;
	private String hostHistory;
	private String hostComment;
}
