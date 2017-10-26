package com.etc.entity;

public class USER_COMMENT {
	
	private String USERNAME;
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	private String COMMENTCONTENT;
	private String COMMENTSCORE;
	private String COMMENTDATE;
	
	

	public USER_COMMENT(String uSERNAME, String cOMMENTCONTENT, String cOMMENTSCORE, String cOMMENTDATE) {
		super();
		USERNAME = uSERNAME;
		COMMENTCONTENT = cOMMENTCONTENT;
		COMMENTSCORE = cOMMENTSCORE;
		COMMENTDATE = cOMMENTDATE;
	}
	public String getCOMMENTCONTENT() {
		return COMMENTCONTENT;
	}
	public void setCOMMENTCONTENT(String cOMMENTCONTENT) {
		COMMENTCONTENT = cOMMENTCONTENT;
	}
	public String getCOMMENTSCORE() {
		return COMMENTSCORE;
	}
	public void setCOMMENTSCORE(String cOMMENTSCORE) {
		COMMENTSCORE = cOMMENTSCORE;
	}
	public String getCOMMENTDATE() {
		return COMMENTDATE;
	}
	public void setCOMMENTDATE(String cOMMENTDATE) {
		COMMENTDATE = cOMMENTDATE;
	}

	public USER_COMMENT(){
		
	}
	@Override
	public String toString() {
		return "USER_COMMENT [USERNAME=" + USERNAME + ", COMMENTCONTENT=" + COMMENTCONTENT + ", COMMENTSCORE="
				+ COMMENTSCORE + ", COMMENTDATE=" + COMMENTDATE + "]";
	}
	

	
	
	
	
	
	
	
}
