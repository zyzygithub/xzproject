package com.etc.entity;
/**
 * ¡Ù—‘ µÃÂ¿‡
 * @author Administrator
 *
 */
public class Account_Message {
	private int MESSAGEID;
	private int GOODID;
	private int FROMID;
	private String MESSAGEDATE;
	private String MESSAGESTATE;
	private int TOID;public Account_Message() {
		// TODO Auto-generated constructor stub
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
	public Account_Message(int mESSAGEID, int gOODID, int fROMID, String mESSAGEDATE, String mESSAGESTATE, int tOID) {
		super();
		MESSAGEID = mESSAGEID;
		GOODID = gOODID;
		FROMID = fROMID;
		MESSAGEDATE = mESSAGEDATE;
		MESSAGESTATE = mESSAGESTATE;
		TOID = tOID;
	}
	@Override
	public String toString() {
		return "Message [MESSAGEID=" + MESSAGEID + ", GOODID=" + GOODID + ", FROMID=" + FROMID + ", MESSAGEDATE="
				+ MESSAGEDATE + ", MESSAGESTATE=" + MESSAGESTATE + ", TOID=" + TOID + "]";
	}
}
