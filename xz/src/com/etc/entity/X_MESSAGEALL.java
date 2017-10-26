package com.etc.entity;

public class X_MESSAGEALL {
	private String USERNAME;
	private String USERPHONE;
	private int GOODID;
	private String MESSAGEDATE;
	private String MESSAGECONTENT;
	private String MESSAGESTATE;
	private String GOODTITLE;
	private String TOID;
	private Object FROMID;
	private int MESSAGEID;
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getUSERPHONE() {
		return USERPHONE;
	}
	public void setUSERPHONE(String uSERPHONE) {
		USERPHONE = uSERPHONE;
	}
	public int getGOODID() {
		return GOODID;
	}
	public void setGOODID(int gOODID) {
		GOODID = gOODID;
	}
	public String getMESSAGEDATE() {
		return MESSAGEDATE;
	}
	public void setMESSAGEDATE(String mESSAGEDATE) {
		MESSAGEDATE = mESSAGEDATE;
	}
	public String getMESSAGECONTENT() {
		return MESSAGECONTENT;
	}
	public void setMESSAGECONTENT(String mESSAGECONTENT) {
		MESSAGECONTENT = mESSAGECONTENT;
	}
	public String getMESSAGESTATE() {
		return MESSAGESTATE;
	}
	public void setMESSAGESTATE(String mESSAGESTATE) {
		MESSAGESTATE = mESSAGESTATE;
	}
	public String getGOODTITLE() {
		return GOODTITLE;
	}
	public void setGOODTITLE(String gOODTITLE) {
		GOODTITLE = gOODTITLE;
	}
	public String getTOID() {
		return TOID;
	}
	public void setTOID(String tOID) {
		TOID = tOID;
	}
	public Object getFROMID() {
		return FROMID;
	}
	public void setFROMID(Object fROMID) {
		FROMID = fROMID;
	}
	public int getMESSAGEID() {
		return MESSAGEID;
	}
	public void setMESSAGEID(int mESSAGEID) {
		MESSAGEID = mESSAGEID;
	}
	@Override
	public String toString() {
		return "X_MESSAGEALL [USERNAME=" + USERNAME + ", USERPHONE=" + USERPHONE + ", GOODID=" + GOODID
				+ ", MESSAGEDATE=" + MESSAGEDATE + ", MESSAGECONTENT=" + MESSAGECONTENT + ", MESSAGESTATE="
				+ MESSAGESTATE + ", GOODTITLE=" + GOODTITLE + ", TOID=" + TOID + ", FROMID=" + FROMID + ", MESSAGEID="
				+ MESSAGEID + "]";
	}
	public X_MESSAGEALL(String uSERNAME, String uSERPHONE, int gOODID, String mESSAGEDATE, String mESSAGECONTENT,
			String mESSAGESTATE, String gOODTITLE, String tOID, Object fROMID, int mESSAGEID) {
		super();
		USERNAME = uSERNAME;
		USERPHONE = uSERPHONE;
		GOODID = gOODID;
		MESSAGEDATE = mESSAGEDATE;
		MESSAGECONTENT = mESSAGECONTENT;
		MESSAGESTATE = mESSAGESTATE;
		GOODTITLE = gOODTITLE;
		TOID = tOID;
		FROMID = fROMID;
		MESSAGEID = mESSAGEID;
	}
public X_MESSAGEALL() {
	// TODO Auto-generated constructor stub
}
	
	
}
