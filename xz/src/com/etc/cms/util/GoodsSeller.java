package com.etc.cms.util;

import com.etc.entity.User;

/**
 *商品实体类
 * @author Administrator
 *
 */
public class GoodsSeller{
private int GOODID;
private String USERNAME;
private String GOODTITLE;
private double GOODPRICE;
private String GOODREMARK;
private double ORIGINALPRICE;
private String GOODPIC;
private int GOODCLICK;
public GoodsSeller() {
	// TODO Auto-generated constructor stub
}
public int getGOODID() {
	return GOODID;
}
public void setGOODID(int gOODID) {
	GOODID = gOODID;
}
public String getUSERNAME() {
	return USERNAME;
}
public void setUSERNAME(String uSERNAME) {
	USERNAME = uSERNAME;
}
public String getGOODTITLE() {
	return GOODTITLE;
}
public void setGOODTITLE(String gOODTITLE) {
	GOODTITLE = gOODTITLE;
}
public double getGOODPRICE() {
	return GOODPRICE;
}
public void setGOODPRICE(double gOODPRICE) {
	GOODPRICE = gOODPRICE;
}
public String getGOODREMARK() {
	return GOODREMARK;
}
public void setGOODREMARK(String gOODREMARK) {
	GOODREMARK = gOODREMARK;
}
public double getORIGINALPRICE() {
	return ORIGINALPRICE;
}
public void setORIGINALPRICE(double oRIGINALPRICE) {
	ORIGINALPRICE = oRIGINALPRICE;
}
public String getGOODPIC() {
	return GOODPIC;
}
public void setGOODPIC(String gOODPIC) {
	GOODPIC = gOODPIC;
}
public int getGOODCLICK() {
	return GOODCLICK;
}
public void setGOODCLICK(int gOODCLICK) {
	GOODCLICK = gOODCLICK;
}
public GoodsSeller(int gOODID, String uSERNAME, String gOODTITLE, double gOODPRICE, String gOODREMARK,
		double oRIGINALPRICE, String gOODPIC, int gOODCLICK) {
	super();
	GOODID = gOODID;
	USERNAME = uSERNAME;
	GOODTITLE = gOODTITLE;
	GOODPRICE = gOODPRICE;
	GOODREMARK = gOODREMARK;
	ORIGINALPRICE = oRIGINALPRICE;
	GOODPIC = gOODPIC;
	GOODCLICK = gOODCLICK;
}
@Override
public String toString() {
	return "GoodsSeller [GOODID=" + GOODID + ", USERNAME=" + USERNAME + ", GOODTITLE=" + GOODTITLE + ", GOODPRICE="
			+ GOODPRICE + ", GOODREMARK=" + GOODREMARK + ", ORIGINALPRICE=" + ORIGINALPRICE + ", GOODPIC=" + GOODPIC
			+ ", GOODCLICK=" + GOODCLICK + "]";
}





}
