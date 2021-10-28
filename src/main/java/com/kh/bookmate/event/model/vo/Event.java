package com.kh.bookmate.event.model.vo;

import java.util.Date;

public class Event {
	
	private int eventNo;
	private int noticeNo;
	private String eventImg;
	private Date eventStartDate;
	private Date eventEndDate;
	
	public Event() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Event(int eventNo, int noticeNo, String eventImg, Date eventStartDate, Date eventEndDate) {
		super();
		this.eventNo = eventNo;
		this.noticeNo = noticeNo;
		this.eventImg = eventImg;
		this.eventStartDate = eventStartDate;
		this.eventEndDate = eventEndDate;
	}

	public Event(int noticeNo, String eventImg) {
		super();
		this.noticeNo = noticeNo;
		this.eventImg = eventImg;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getEventImg() {
		return eventImg;
	}

	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}

	public Date getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(Date eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public Date getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

	@Override
	public String toString() {
		return "EventVo [eventNo=" + eventNo + ", noticeNo=" + noticeNo + ", eventImg=" + eventImg + ", eventStartDate="
				+ eventStartDate + ", eventEndDate=" + eventEndDate + "]";
	}
	
	
	
}
