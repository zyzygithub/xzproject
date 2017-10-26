package com.etc.cms.util;

public class LikeMes {
	private int LIKEID;
	private String USERNAME;
	private String SELERNAME;
	private String GOODID;
	private String GOODTITLE;
	private String GOODREMARK;
	private String GOODPRICE;
	private String GOODPIC;
	private int GOODCLICK;
	//·â×°
	public int getLIKEID() {
		return LIKEID;
	}
	public void setLIKEID(int lIKEID) {
		LIKEID = lIKEID;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getGOODID() {
		return GOODID;
	}
	public void setGOODID(String gOODID) {
		GOODID = gOODID;
	}
	public String getGOODTITLE() {
		return GOODTITLE;
	}
	public void setGOODTITLE(String gOODTITLE) {
		GOODTITLE = gOODTITLE;
	}
	public String getGOODREMARK() {
		return GOODREMARK;
	}
	public void setGOODREMARK(String gOODREMARK) {
		GOODREMARK = gOODREMARK;
	}
	public String getGOODPRICE() {
		return GOODPRICE;
	}
	public void setGOODPRICE(String gOODPRICE) {
		GOODPRICE = gOODPRICE;
	}
	
	public LikeMes() {
		super();
	}
	public String getSELERNAME() {
		return SELERNAME;
	}
	public void setSELERNAME(String sELERNAME) {
		SELERNAME = sELERNAME;
	}
	public String getGOODPIC() {
		return GOODPIC;
	}
	public void setGOODPIC(String gOODPIC) {
		GOODPIC = gOODPIC;
	}
	@Override
	public String toString() {
		return "LikeMes [LIKEID=" + LIKEID + ", USERNAME=" + USERNAME + ", SELERNAME=" + SELERNAME + ", GOODID="
				+ GOODID + ", GOODTITLE=" + GOODTITLE + ", GOODREMARK=" + GOODREMARK + ", GOODPRICE=" + GOODPRICE
				+ ", GOODPIC=" + GOODPIC + ", GOODCLICK=" + GOODCLICK + "]";
	}
	public int getGOODCLICK() {
		return GOODCLICK;
	}
	public void setGOODCLICK(int gOODCLICK) {
		GOODCLICK = gOODCLICK;
	}
	public LikeMes(int lIKEID, String uSERNAME, String sELERNAME, String gOODID, String gOODTITLE, String gOODREMARK,
			String gOODPRICE, String gOODPIC, int gOODCLICK) {
		super();
		LIKEID = lIKEID;
		USERNAME = uSERNAME;
		SELERNAME = sELERNAME;
		GOODID = gOODID;
		GOODTITLE = gOODTITLE;
		GOODREMARK = gOODREMARK;
		GOODPRICE = gOODPRICE;
		GOODPIC = gOODPIC;
		GOODCLICK = gOODCLICK;
	}
	
	
	
	
	

}
