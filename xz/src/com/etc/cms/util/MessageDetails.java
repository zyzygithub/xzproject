package com.etc.cms.util;

public class MessageDetails {
	private int MESSAGEID;
	private int GOODID;
	private int FROMID;
	private String FROMNAME;
	private String MESSAGEDATE;
	private String MESSAGESTATE;
	private int TOID;
	private String USERNAME;
	private String MESSAGECONTENT;
	private int MESSAGETYPE;
	public int getMESSAGETYPE() {
		return MESSAGETYPE;
	}
	public void setMESSAGETYPE(int mESSAGETYPE) {
		MESSAGETYPE = mESSAGETYPE;
	}
	public int getMESSAGEID() {
		return MESSAGEID;
	}
	public void setMESSAGEID(int mESSAGEID) {
		MESSAGEID = mESSAGEID;
	}
	public int getGOODID() {
		return GOODID;
	}
	public void setGOODID(int gOODID) {
		GOODID = gOODID;
	}
	public int getFROMID() {
		return FROMID;
	}
	public void setFROMID(int fROMID) {
		FROMID = fROMID;
	}
	public String getFROMNAME() {
		return FROMNAME;
	}
	public void setFROMNAME(String fROMNAME) {
		FROMNAME = fROMNAME;
	}
	public String getMESSAGEDATE() {
		return MESSAGEDATE;
	}
	public void setMESSAGEDATE(String mESSAGEDATE) {
		MESSAGEDATE = mESSAGEDATE;
	}
	public String getMESSAGESTATE() {
		return MESSAGESTATE;
	}
	public void setMESSAGESTATE(String mESSAGESTATE) {
		MESSAGESTATE = mESSAGESTATE;
	}
	public int getTOID() {
		return TOID;
	}
	public void setTOID(int tOID) {
		TOID = tOID;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getMESSAGECONTENT() {
		return MESSAGECONTENT;
	}
	public void setMESSAGECONTENT(String mESSAGECONTENT) {
		MESSAGECONTENT = mESSAGECONTENT;
	}
	
	@Override
	public String toString() {
		return "MessageDetails [MESSAGEID=" + MESSAGEID + ", GOODID=" + GOODID + ", FROMID=" + FROMID + ", FROMNAME="
				+ FROMNAME + ", MESSAGEDATE=" + MESSAGEDATE + ", MESSAGESTATE=" + MESSAGESTATE + ", TOID=" + TOID
				+ ", USERNAME=" + USERNAME + ", MESSAGECONTENT=" + MESSAGECONTENT + ", MESSAGETYPE=" + MESSAGETYPE
				+ "]";
	}
	
	
	
	public MessageDetails(int mESSAGEID, int gOODID, int fROMID, String fROMNAME, String mESSAGEDATE,
			String mESSAGESTATE, int tOID, String uSERNAME, String mESSAGECONTENT, int mESSAGETYPE) {
		super();
		MESSAGEID = mESSAGEID;
		GOODID = gOODID;
		FROMID = fROMID;
		FROMNAME = fROMNAME;
		MESSAGEDATE = mESSAGEDATE;
		MESSAGESTATE = mESSAGESTATE;
		TOID = tOID;
		USERNAME = uSERNAME;
		MESSAGECONTENT = mESSAGECONTENT;
		MESSAGETYPE = mESSAGETYPE;
	}
	public MessageDetails() {
		// TODO Auto-generated constructor stub
	}
}
