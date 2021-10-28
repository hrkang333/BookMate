package com.kh.bookmate.bookqna.model.vo;

import java.util.Date;

public class BookQna {

	private int qnaNo;
	private String user_Id;
	private String bookISBN;
	private String bookTitle;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int qnaAnswer;
	
	public BookQna() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookQna(int qnaNo, String user_Id, String bookISBN, String bookTitle, String qnaCategory, String qnaTitle,
			String qnaContent, Date qnaDate, int qnaAnswer) {
		super();
		this.qnaNo = qnaNo;
		this.user_Id = user_Id;
		this.bookISBN = bookISBN;
		this.bookTitle = bookTitle;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qnaAnswer = qnaAnswer;
	}
	public BookQna(String user_Id, String bookISBN, String bookTitle, String qnaCategory, String qnaTitle,
			String qnaContent) {
		super();
		this.user_Id = user_Id;
		this.bookISBN = bookISBN;
		this.bookTitle = bookTitle;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getBookISBN() {
		return bookISBN;
	}
	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public int getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(int qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	@Override
	public String toString() {
		return "BookQnaVo [qnaNo=" + qnaNo + ", user_Id=" + user_Id + ", bookISBN=" + bookISBN + ", bookTitle="
				+ bookTitle + ", qnaCategory=" + qnaCategory + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent
				+ ", qnaDate=" + qnaDate + ", qnaAnswer=" + qnaAnswer + "]";
	}
	
	
	
	
}
