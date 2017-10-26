package com.etc.entity;
/**
 * Comment 评价实体类
 * @author Administrator
 *
 */
public class Comment {
private int COMMENTID;
private int SELER;
private int BUYER;
private int COMMENTSCORE;
private String COMMENTCONTENT;
private String COMMENTDATE;
public Comment() {
	// TODO Auto-generated constructor stub
}
public int getCOMMENTID() {
	return COMMENTID;
}
public void setCOMMENTID(int cOMMENTID) {
	COMMENTID = cOMMENTID;
}
public int getSELER() {
	return SELER;
}
public void setSELER(int sELER) {
	SELER = sELER;
}
public int getBUYER() {
	return BUYER;
}
public void setBUYER(int bUYER) {
	BUYER = bUYER;
}
public int getCOMMENTSCORE() {
	return COMMENTSCORE;
}
public void setCOMMENTSCORE(int cOMMENTSCORE) {
	COMMENTSCORE = cOMMENTSCORE;
}
public String getCOMMENTCONTENT() {
	return COMMENTCONTENT;
}
public void setCOMMENTCONTENT(String cOMMENTCONTENT) {
	COMMENTCONTENT = cOMMENTCONTENT;
}
public String getCOMMENTDATE() {
	return COMMENTDATE;
}
public void setCOMMENTDATE(String cOMMENTDATE) {
	COMMENTDATE = cOMMENTDATE;
}
@Override
public String toString() {
	return "Comment [COMMENTID=" + COMMENTID + ", SELER=" + SELER + ", BUYER=" + BUYER + ", COMMENTSCORE="
			+ COMMENTSCORE + ", COMMENTCONTENT=" + COMMENTCONTENT + ", COMMENTDATE=" + COMMENTDATE + "]";
}
public Comment(int cOMMENTID, int sELER, int bUYER, int cOMMENTSCORE, String cOMMENTCONTENT, String cOMMENTDATE) {
	super();
	COMMENTID = cOMMENTID;
	SELER = sELER;
	BUYER = bUYER;
	COMMENTSCORE = cOMMENTSCORE;
	COMMENTCONTENT = cOMMENTCONTENT;
	COMMENTDATE = cOMMENTDATE;
}


}
