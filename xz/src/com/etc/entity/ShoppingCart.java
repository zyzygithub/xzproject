package com.etc.entity;
/**
 * 购物车实体类
 * @author Administrator
 *
 */
public class ShoppingCart {
	private String SELERNAME;
	public ShoppingCart(String sELERNAME, int gOODID, int gOODSCOUNT,
			String gOODTITLE, float gOODPRICE, String gOODPIC,
			float oRIGINALPRICE, int uSERID, String uSERNAME, int sCID,
			int gOODCOUNT, int gOODSELER, double tOTALMOENY) {
		super();
		SELERNAME = sELERNAME;
		GOODID = gOODID;
		GOODSCOUNT = gOODSCOUNT;
		GOODTITLE = gOODTITLE;
		GOODPRICE = gOODPRICE;
		GOODPIC = gOODPIC;
		ORIGINALPRICE = oRIGINALPRICE;
		USERID = uSERID;
		USERNAME = uSERNAME;
		SCID = sCID;
		GOODCOUNT = gOODCOUNT;
		GOODSELER = gOODSELER;
		TOTALMOENY = tOTALMOENY;
	}










	public String getSELERNAME() {
		return SELERNAME;
	}










	public void setSELERNAME(String sELERNAME) {
		SELERNAME = sELERNAME;
	}










	private int GOODID;
	private int GOODSCOUNT;
	private String GOODTITLE;
	private float GOODPRICE;
	private String GOODPIC;
	private float ORIGINALPRICE;
	private int USERID;
	private String USERNAME;
	private int SCID;
	private int GOODCOUNT;
	private int GOODSELER;
	private double TOTALMOENY;
	



	




	public ShoppingCart(int gOODID, int gOODSCOUNT, String gOODTITLE, float gOODPRICE, String gOODPIC,
			float oRIGINALPRICE, int uSERID, String uSERNAME, int sCID, int gOODCOUNT, int gOODSELER,
			double tOTALMOENY) {
		super();
		GOODID = gOODID;
		GOODSCOUNT = gOODSCOUNT;
		GOODTITLE = gOODTITLE;
		GOODPRICE = gOODPRICE;
		GOODPIC = gOODPIC;
		ORIGINALPRICE = oRIGINALPRICE;
		USERID = uSERID;
		USERNAME = uSERNAME;
		SCID = sCID;
		GOODCOUNT = gOODCOUNT;
		GOODSELER = gOODSELER;
		TOTALMOENY = tOTALMOENY;
	}










	public int getGOODSELER() {
		return GOODSELER;
	}










	public void setGOODSELER(int gOODSELER) {
		GOODSELER = gOODSELER;
	}










	public double getTOTALMOENY() {
		return TOTALMOENY;
	}










	public void setTOTALMOENY(double tOTALMOENY) {
		TOTALMOENY = tOTALMOENY;
	}










	public ShoppingCart(int gOODID, int gOODSCOUNT, String gOODTITLE, float gOODPRICE, String gOODPIC,
			float oRIGINALPRICE, int uSERID, String uSERNAME, int sCID, int gOODCOUNT, double tOTALMOENY) {
		super();
		GOODID = gOODID;
		GOODSCOUNT = gOODSCOUNT;
		GOODTITLE = gOODTITLE;
		GOODPRICE = gOODPRICE;
		GOODPIC = gOODPIC;
		ORIGINALPRICE = oRIGINALPRICE;
		USERID = uSERID;
		USERNAME = uSERNAME;
		SCID = sCID;
		GOODCOUNT = gOODCOUNT;
		TOTALMOENY = tOTALMOENY;
	}










	public int getGOODCOUNT() {
		return GOODCOUNT;
	}










	public void setGOODCOUNT(int gOODCOUNT) {
		GOODCOUNT = gOODCOUNT;
	}










	public ShoppingCart(int gOODID, int gOODSCOUNT, String gOODTITLE, float gOODPRICE, String gOODPIC,
			float oRIGINALPRICE, int uSERID, String uSERNAME, int sCID) {
		super();
		GOODID = gOODID;
		GOODSCOUNT = gOODSCOUNT;
		GOODTITLE = gOODTITLE;
		GOODPRICE = gOODPRICE;
		GOODPIC = gOODPIC;
		ORIGINALPRICE = oRIGINALPRICE;
		USERID = uSERID;
		USERNAME = uSERNAME;
		SCID = sCID;
	}










	@Override
	public String toString() {
		return "ShoppingCart [SELERNAME=" + SELERNAME + ", GOODID=" + GOODID
				+ ", GOODSCOUNT=" + GOODSCOUNT + ", GOODTITLE=" + GOODTITLE
				+ ", GOODPRICE=" + GOODPRICE + ", GOODPIC=" + GOODPIC
				+ ", ORIGINALPRICE=" + ORIGINALPRICE + ", USERID=" + USERID
				+ ", USERNAME=" + USERNAME + ", SCID=" + SCID + ", GOODCOUNT="
				+ GOODCOUNT + ", GOODSELER=" + GOODSELER + ", TOTALMOENY="
				+ TOTALMOENY + "]";
	}










	public int getGOODID() {
		return GOODID;
	}










	public void setGOODID(int gOODID) {
		GOODID = gOODID;
	}










	public int getGOODSCOUNT() {
		return GOODSCOUNT;
	}










	public void setGOODSCOUNT(int gOODSCOUNT) {
		GOODSCOUNT = gOODSCOUNT;
	}










	public String getGOODTITLE() {
		return GOODTITLE;
	}










	public void setGOODTITLE(String gOODTITLE) {
		GOODTITLE = gOODTITLE;
	}










	public float getGOODPRICE() {
		return GOODPRICE;
	}










	public void setGOODPRICE(float gOODPRICE) {
		GOODPRICE = gOODPRICE;
	}










	public String getGOODPIC() {
		return GOODPIC;
	}










	public void setGOODPIC(String gOODPIC) {
		GOODPIC = gOODPIC;
	}










	public float getORIGINALPRICE() {
		return ORIGINALPRICE;
	}










	public void setORIGINALPRICE(float oRIGINALPRICE) {
		ORIGINALPRICE = oRIGINALPRICE;
	}










	public int getUSERID() {
		return USERID;
	}










	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}










	public String getUSERNAME() {
		return USERNAME;
	}










	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}










	public int getSCID() {
		return SCID;
	}










	public void setSCID(int sCID) {
		SCID = sCID;
	}










	public ShoppingCart() {
		// TODO Auto-generated constructor stub
	}

	
	

}