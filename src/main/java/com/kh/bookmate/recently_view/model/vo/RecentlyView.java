package com.kh.bookmate.recently_view.model.vo;

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

public class RecentlyView {
	
	private int recentNo;
	private String bookIsbn;
	private String userId;
	

}
