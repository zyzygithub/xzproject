package com.etc.entity;
/**
 * 联系方式实体类
 * @author Administrator
 *
 */
public class GoodPosition {
private int GPID;
private int GPUSERID;
private String GPPOSITOIN;
private String GPPHONE;
private String GPNAME;
public GoodPosition() {
	// TODO Auto-generated constructor stub
}
public int getGPID() {
	return GPID;
}
public void setGPID(int gPID) {
	GPID = gPID;
}
public int getGPUSERID() {
	return GPUSERID;
}
public void setGPUSERID(int gPUSERID) {
	GPUSERID = gPUSERID;
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
public String getGPNAME() {
	return GPNAME;
}
public void setGPNAME(String gPNAME) {
	GPNAME = gPNAME;
}
@Override
public String toString() {
	return "GoodPosition [GPID=" + GPID + ", GPUSERID=" + GPUSERID + ", GPPOSITOIN=" + GPPOSITOIN + ", GPPHONE="
			+ GPPHONE + ", GPNAME=" + GPNAME + "]";
}
public GoodPosition(int gPID, int gPUSERID, String gPPOSITOIN, String gPPHONE, String gPNAME) {
	super();
	GPID = gPID;
	GPUSERID = gPUSERID;
	GPPOSITOIN = gPPOSITOIN;
	GPPHONE = gPPHONE;
	GPNAME = gPNAME;
}

}
