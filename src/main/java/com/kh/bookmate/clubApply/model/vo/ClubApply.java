package com.kh.bookmate.clubApply.model.vo;

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
public class ClubApply {

	private int applyNo;
	private int timeNo;
	private String userId;
	private String applyCancle;
	private String applyAccept;
	private String applyParti;
	private String status;
}
