package com.kh.bookmate.notice.model.vo;

import java.util.Date;

public class Notice {
	
	private int noticeNo;
	private int eventNo;
	private String noticeCategory;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int noticeReadCount;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(int noticeNo, int eventNo, String noticeCategory, String noticeTitle, String noticeContent,
			Date noticeDate, int noticeReadCount) {
		super();
		this.noticeNo = noticeNo;
		this.eventNo = eventNo;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeReadCount = noticeReadCount;
	}

	public Notice(int eventNo, String noticeCategory, String noticeTitle, String noticeContent) {
		super();
		this.eventNo = eventNo;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
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

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeReadCount() {
		return noticeReadCount;
	}

	public void setNoticeReadCount(int noticeReadCount) {
		this.noticeReadCount = noticeReadCount;
	}

	@Override
	public String toString() {
		return "NoticeVo [noticeNo=" + noticeNo + ", eventNo=" + eventNo + ", noticeCategory=" + noticeCategory
				+ ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate
				+ ", noticeReadCount=" + noticeReadCount + "]";
	}
	
	

}
