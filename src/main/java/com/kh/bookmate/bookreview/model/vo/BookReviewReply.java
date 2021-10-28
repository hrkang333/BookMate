package com.kh.bookmate.bookreview.model.vo;

import java.util.Date;

public class BookReviewReply {

	private int reviewReplyNo;
	private int reviewNo;
	private String reviewReplyWriter;
	private String reviewReplyContent;
	private Date reviewReplyDate;
	private int reviewReplyStatus;
	
	public BookReviewReply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookReviewReply(int reviewReplyNo, int reviewNo, String reviewReplyWriter, String reviewReplyContent,
			Date reviewReplyDate, int reviewReplyStatus) {
		super();
		this.reviewReplyNo = reviewReplyNo;
		this.reviewNo = reviewNo;
		this.reviewReplyWriter = reviewReplyWriter;
		this.reviewReplyContent = reviewReplyContent;
		this.reviewReplyDate = reviewReplyDate;
		this.reviewReplyStatus = reviewReplyStatus;
	}

	public BookReviewReply(int reviewNo, String reviewReplyWriter, String reviewReplyContent) {
		super();
		this.reviewNo = reviewNo;
		this.reviewReplyWriter = reviewReplyWriter;
		this.reviewReplyContent = reviewReplyContent;
	}

	public int getReviewReplyNo() {
		return reviewReplyNo;
	}

	public void setReviewReplyNo(int reviewReplyNo) {
		this.reviewReplyNo = reviewReplyNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewReplyWriter() {
		return reviewReplyWriter;
	}

	public void setReviewReplyWriter(String reviewReplyWriter) {
		this.reviewReplyWriter = reviewReplyWriter;
	}

	public String getReviewReplyContent() {
		return reviewReplyContent;
	}

	public void setReviewReplyContent(String reviewReplyContent) {
		this.reviewReplyContent = reviewReplyContent;
	}

	public Date getReviewReplyDate() {
		return reviewReplyDate;
	}

	public void setReviewReplyDate(Date reviewReplyDate) {
		this.reviewReplyDate = reviewReplyDate;
	}

	public int getReviewReplyStatus() {
		return reviewReplyStatus;
	}

	public void setReviewReplyStatus(int reviewReplyStatus) {
		this.reviewReplyStatus = reviewReplyStatus;
	}

	@Override
	public String toString() {
		return "BookReviewReplyVo [reviewReplyNo=" + reviewReplyNo + ", reviewNo=" + reviewNo + ", reviewReplyWriter="
				+ reviewReplyWriter + ", reviewReplyContent=" + reviewReplyContent + ", reviewReplyDate="
				+ reviewReplyDate + ", reviewReplyStatus=" + reviewReplyStatus + "]";
	}
	
	
	
}
