package com.kh.bookmate.notice.model.vo;

import java.util.Date;

public class Notice {
	
	private int noticeNo;
	private String noticeCategory;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private Date noticeDate;
	private int noticeViews;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(int noticeNo, String noticeCategory, String noticeTitle, String noticeContent, String noticeWriter,
			Date noticeDate, int noticeViews) {
		super();
		this.noticeNo = noticeNo;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
		this.noticeViews = noticeViews;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeCategory() {
		return noticeCategory;
	}

	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeViews() {
		return noticeViews;
	}

	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeCategory=" + noticeCategory + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeWriter=" + noticeWriter + ", noticeDate=" + noticeDate
				+ ", noticeViews=" + noticeViews + "]";
	}



}
