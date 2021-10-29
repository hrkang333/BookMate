package com.kh.bookmate.fav_writer.model.vo;

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
public class FavWriter {
 
	private int writerNo;
	private String bookIsbn;
	private String userId;
	private String recentlyBook; //최근에 등록된 도서 
	private String publisher;
	private int price;
	private String alertYN;
	
}
