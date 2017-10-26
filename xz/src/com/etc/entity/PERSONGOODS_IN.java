package com.etc.entity;

public class PERSONGOODS_IN {
private int ORDERID;
private int BUYCOUNT;
private String USERREALNAME;
private String USERNAME;
private String GPPOSITOIN;
private String GPPHONE;
private String GOODTITLE;
private int GOODPRICE;
private String GOODREMARK;
private String GOODPIC;
private String TYPENAME;
private String TYPEMESNAME;
private String ORDERSTATE;
private Object SENDPOSITION;
private String ORDERDATE;
private String ORDERREMARK;
private String GPNAME;

public PERSONGOODS_IN(int oRDERID, int bUYCOUNT, String uSERREALNAME, String uSERNAME, String gPPOSITOIN,
		String gPPHONE, String gOODTITLE, int gOODPRICE, String gOODREMARK, String gOODPIC, String tYPENAME,
		String tYPEMESNAME, String oRDERSTATE, Object sENDPOSITION, String oRDERDATE, String oRDERREMARK,
		String gPNAME) {
	super();
	ORDERID = oRDERID;
	BUYCOUNT = bUYCOUNT;
	USERREALNAME = uSERREALNAME;
	USERNAME = uSERNAME;
	GPPOSITOIN = gPPOSITOIN;
	GPPHONE = gPPHONE;
	GOODTITLE = gOODTITLE;
	GOODPRICE = gOODPRICE;
	GOODREMARK = gOODREMARK;
	GOODPIC = gOODPIC;
	TYPENAME = tYPENAME;
	TYPEMESNAME = tYPEMESNAME;
	ORDERSTATE = oRDERSTATE;
	SENDPOSITION = sENDPOSITION;
	ORDERDATE = oRDERDATE;
	ORDERREMARK = oRDERREMARK;
	GPNAME = gPNAME;
}

public String getGPNAME() {
	return GPNAME;
}

public void setGPNAME(String gPNAME) {
	GPNAME = gPNAME;
}

@Override
public String toString() {
	return "PERSONGOODS_IN [ORDERID=" + ORDERID + ", BUYCOUNT=" + BUYCOUNT + ", USERREALNAME=" + USERREALNAME
			+ ", USERNAME=" + USERNAME + ", GPPOSITOIN=" + GPPOSITOIN + ", GPPHONE=" + GPPHONE + ", GOODTITLE="
			+ GOODTITLE + ", GOODPRICE=" + GOODPRICE + ", GOODREMARK=" + GOODREMARK + ", GOODPIC=" + GOODPIC
			+ ", TYPENAME=" + TYPENAME + ", TYPEMESNAME=" + TYPEMESNAME + ", ORDERSTATE=" + ORDERSTATE
			+ ", SENDPOSITION=" + SENDPOSITION + ", ORDERDATE=" + ORDERDATE + ", ORDERREMARK=" + ORDERREMARK
			+ ", GPNAME=" + GPNAME + "]";
}

public PERSONGOODS_IN() {
	// TODO Auto-generated constructor stub
}

public PERSONGOODS_IN(int oRDERID, int bUYCOUNT, String uSERREALNAME, String uSERNAME, String gPPOSITOIN,
		String gPPHONE, String gOODTITLE, int gOODPRICE, String gOODREMARK, String gOODPIC, String tYPENAME,
		String tYPEMESNAME, String oRDERSTATE, Object sENDPOSITION, String oRDERDATE, String oRDERREMARK) {
	super();
	ORDERID = oRDERID;
	BUYCOUNT = bUYCOUNT;
	USERREALNAME = uSERREALNAME;
	USERNAME = uSERNAME;
	GPPOSITOIN = gPPOSITOIN;
	GPPHONE = gPPHONE;
	GOODTITLE = gOODTITLE;
	GOODPRICE = gOODPRICE;
	GOODREMARK = gOODREMARK;
	GOODPIC = gOODPIC;
	TYPENAME = tYPENAME;
	TYPEMESNAME = tYPEMESNAME;
	ORDERSTATE = oRDERSTATE;
	SENDPOSITION = sENDPOSITION;
	ORDERDATE = oRDERDATE;
	ORDERREMARK = oRDERREMARK;
}

public int getORDERID() {
	return ORDERID;
}

public void setORDERID(int oRDERID) {
	ORDERID = oRDERID;
}

public int getBUYCOUNT() {
	return BUYCOUNT;
}

public void setBUYCOUNT(int bUYCOUNT) {
	BUYCOUNT = bUYCOUNT;
}

public String getUSERREALNAME() {
	return USERREALNAME;
}

public void setUSERREALNAME(String uSERREALNAME) {
	USERREALNAME = uSERREALNAME;
}

public String getUSERNAME() {
	return USERNAME;
}

public void setUSERNAME(String uSERNAME) {
	USERNAME = uSERNAME;
}

public String getGPPOSITOIN() {
	return GPPOSITOIN;
}

public void setGPPOSITOIN(String gPPOSITOIN) {
	GPPOSITOIN = gPPOSITOIN;
}

public String getGPPHONE() {
	return GPPHONE;
}

public void setGPPHONE(String gPPHONE) {
	GPPHONE = gPPHONE;
}

public String getGOODTITLE() {
	return GOODTITLE;
}

public void setGOODTITLE(String gOODTITLE) {
	GOODTITLE = gOODTITLE;
}

public int getGOODPRICE() {
	return GOODPRICE;
}

public void setGOODPRICE(int gOODPRICE) {
	GOODPRICE = gOODPRICE;
}

public String getGOODREMARK() {
	return GOODREMARK;
}

public void setGOODREMARK(String gOODREMARK) {
	GOODREMARK = gOODREMARK;
}

public String getGOODPIC() {
	return GOODPIC;
}

public void setGOODPIC(String gOODPIC) {
	GOODPIC = gOODPIC;
}

public String getTYPENAME() {
	return TYPENAME;
}

public void setTYPENAME(String tYPENAME) {
	TYPENAME = tYPENAME;
}

public String getTYPEMESNAME() {
	return TYPEMESNAME;
}

public void setTYPEMESNAME(String tYPEMESNAME) {
	TYPEMESNAME = tYPEMESNAME;
}

public String getORDERSTATE() {
	return ORDERSTATE;
}

public void setORDERSTATE(String oRDERSTATE) {
	ORDERSTATE = oRDERSTATE;
}

public Object getSENDPOSITION() {
	return SENDPOSITION;
}

public void setSENDPOSITION(Object sENDPOSITION) {
	SENDPOSITION = sENDPOSITION;
}

public String getORDERDATE() {
	return ORDERDATE;
}

public void setORDERDATE(String oRDERDATE) {
	ORDERDATE = oRDERDATE;
}

public String getORDERREMARK() {
	return ORDERREMARK;
}

public void setORDERREMARK(String oRDERREMARK) {
	ORDERREMARK = oRDERREMARK;
}

}
