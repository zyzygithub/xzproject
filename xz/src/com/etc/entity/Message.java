package com.etc.entity;
/**
 * ¡Ù—‘ µÃÂ¿‡
 * @author Administrator
 *
 */
public class Message {
	private int MESSAGEID;
	private int GOODSID;
	private int FROMID;
	private String MESSAGEDATE;
	private String MESSAGESTATE;
	private int TOID;
	private String MESSAGECONTENT;
	private int MESSAGETYPE;
	public Message(int mESSAGEID, int gOODSID, int fROMID, String mESSAGEDATE, String mESSAGESTATE, int tOID,
			String mESSAGECONTENT, int mESSAGETYPE) {
		super();
		MESSAGEID = mESSAGEID;
		GOODSID = gOODSID;
		FROMID = fROMID;
		MESSAGEDATE = mESSAGEDATE;
		MESSAGESTATE = mESSAGESTATE;
		TOID = tOID;
		MESSAGECONTENT = mESSAGECONTENT;
		MESSAGETYPE = mESSAGETYPE;
	}
	public String getMESSAGECONTENT() {
		return MESSAGECONTENT;
	}
	public void setMESSAGECONTENT(String mESSAGECONTENT) {
		MESSAGECONTENT = mESSAGECONTENT;
	}
	public Message() {
		// TODO Auto-generated constructor stub
	}
	public Message(int mESSAGEID, int gOODSID, int fROMID, String mESSAGEDATE, String mESSAGESTATE, int tOID,
			String mESSAGECONTENT) {
		super();
		MESSAGEID = mESSAGEID;
		GOODSID = gOODSID;
		FROMID = fROMID;
		MESSAGEDATE = mESSAGEDATE;
		MESSAGESTATE = mESSAGESTATE;
		TOID = tOID;
		MESSAGECONTENT = mESSAGECONTENT;
	}
	public int getMESSAGEID() {
		return MESSAGEID;
	}
	public void setMESSAGEID(int mESSAGEID) {
		MESSAGEID = mESSAGEID;
	}
	public int getGOODSID() {
		return GOODSID;
	}
	public void setGOODSID(int gOODSID) {
		GOODSID = gOODSID;
	}
	public int getFROMID() {
		return FROMID;
	}
	public void setFROMID(int fROMID) {
		FROMID = fROMID;
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
	public Message(int mESSAGEID, int gOODSID, int fROMID, String mESSAGEDATE, String mESSAGESTATE, int tOID) {
		super();
		MESSAGEID = mESSAGEID;
		GOODSID = gOODSID;
		FROMID = fROMID;
		MESSAGEDATE = mESSAGEDATE;
		MESSAGESTATE = mESSAGESTATE;
		TOID = tOID;
	}
	@Override
	public String toString() {
		return "Message [MESSAGEID=" + MESSAGEID + ", GOODSID=" + GOODSID + ", FROMID=" + FROMID + ", MESSAGEDATE="
				+ MESSAGEDATE + ", MESSAGESTATE=" + MESSAGESTATE + ", TOID=" + TOID + ", MESSAGECONTENT="
				+ MESSAGECONTENT + ", MESSAGETYPE=" + MESSAGETYPE + "]";
	}
}
