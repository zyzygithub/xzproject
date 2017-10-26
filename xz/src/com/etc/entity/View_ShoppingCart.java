package com.etc.entity;

public class View_ShoppingCart {
	private int GOODID;
	private int GOODSCOUNT;
	private String GOODTITLE;
	private double GOODPRICE;
	private String GOODPIC;
	private double ORIGINALPRICE;
	private int USERID;
	private String USERNAME;
	private String GOODSTATE;
	private int GOODSELER;
	private int SCID;
	private int GOODCOUNT;
	private double USERBALANCE;
	public View_ShoppingCart(int gOODID, int gOODSCOUNT, String gOODTITLE, double gOODPRICE, String gOODPIC,
			double oRIGINALPRICE, int uSERID, String uSERNAME, String gOODSTATE, int gOODSELER, int sCID, int gOODCOUNT,
			double uSERBALANCE, double tOTALPRICE) {
		super();
		GOODID = gOODID;
		GOODSCOUNT = gOODSCOUNT;
		GOODTITLE = gOODTITLE;
		GOODPRICE = gOODPRICE;
		GOODPIC = gOODPIC;
		ORIGINALPRICE = oRIGINALPRICE;
		USERID = uSERID;
		USERNAME = uSERNAME;
		GOODSTATE = gOODSTATE;
		GOODSELER = gOODSELER;
		SCID = sCID;
		GOODCOUNT = gOODCOUNT;
		USERBALANCE = uSERBALANCE;
		TOTALPRICE = tOTALPRICE;
	}
	public double getUSERBALANCE() {
		return USERBALANCE;
	}
	public void setUSERBALANCE(double uSERBALANCE) {
		USERBALANCE = uSERBALANCE;
	}
	private double TOTALPRICE;
	
	
	public View_ShoppingCart(int gOODID, int gOODSCOUNT, String gOODTITLE, double gOODPRICE, String gOODPIC,
			double oRIGINALPRICE, int uSERID, String uSERNAME, String gOODSTATE, int gOODSELER, int sCID, int gOODCOUNT,
			double tOTALPRICE) {
		super();
		GOODID = gOODID;
		GOODSCOUNT = gOODSCOUNT;
		GOODTITLE = gOODTITLE;
		GOODPRICE = gOODPRICE;
		GOODPIC = gOODPIC;
		ORIGINALPRICE = oRIGINALPRICE;
		USERID = uSERID;
		USERNAME = uSERNAME;
		GOODSTATE = gOODSTATE;
		GOODSELER = gOODSELER;
		SCID = sCID;
		GOODCOUNT = gOODCOUNT;
		TOTALPRICE = tOTALPRICE;
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
	public String getGOODSTATE() {
		return GOODSTATE;
	}
	public void setGOODSTATE(String gOODSTATE) {
		GOODSTATE = gOODSTATE;
	}
	public int getSCID() {
		return SCID;
	}
	public void setSCID(int sCID) {
		SCID = sCID;
	}
	public int getGOODCOUNT() {
		return GOODCOUNT;
	}
	public void setGOODCOUNT(int gOODCOUNT) {
		GOODCOUNT = gOODCOUNT;
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
	public double getGOODPRICE() {
		return GOODPRICE;
	}
	public void setGOODPRICE(double gOODPRICE) {
		GOODPRICE = gOODPRICE;
	}
	public String getGOODPIC() {
		return GOODPIC;
	}
	public void setGOODPIC(String gOODPIC) {
		GOODPIC = gOODPIC;
	}
	public double getORIGINALPRICE() {
		return ORIGINALPRICE;
	}
	public void setORIGINALPRICE(double oRIGINALPRICE) {
		ORIGINALPRICE = oRIGINALPRICE;
	}
	public int getGOODSELER() {
		return GOODSELER;
	}
	public void setGOODSELER(int gOODSELER) {
		GOODSELER = gOODSELER;
	}
	public double getTOTALPRICE() {
		return TOTALPRICE;
	}
	public void setTOTALPRICE(double tOTALPRICE) {
		TOTALPRICE = tOTALPRICE;
	}
	@Override
	public String toString() {
		return "View_ShoppingCart [GOODID=" + GOODID + ", GOODSCOUNT=" + GOODSCOUNT + ", GOODTITLE=" + GOODTITLE
				+ ", GOODPRICE=" + GOODPRICE + ", GOODPIC=" + GOODPIC + ", ORIGINALPRICE=" + ORIGINALPRICE + ", USERID="
				+ USERID + ", USERNAME=" + USERNAME + ", GOODSTATE=" + GOODSTATE + ", GOODSELER=" + GOODSELER
				+ ", SCID=" + SCID + ", GOODCOUNT=" + GOODCOUNT + ", USERBALANCE=" + USERBALANCE + ", TOTALPRICE="
				+ TOTALPRICE + "]";
	}
	public View_ShoppingCart(int gOODID, int gOODSCOUNT, String gOODTITLE,
			double gOODPRICE, String gOODPIC, double oRIGINALPRICE,
			int gOODSELER, double tOTALPRICE) {
		super();
		GOODID = gOODID;
		GOODSCOUNT = gOODSCOUNT;
		GOODTITLE = gOODTITLE;
		GOODPRICE = gOODPRICE;
		GOODPIC = gOODPIC;
		ORIGINALPRICE = oRIGINALPRICE;
		GOODSELER = gOODSELER;
		TOTALPRICE = tOTALPRICE;
	}
	public View_ShoppingCart() {
		// TODO Auto-generated constructor stub
	}
	
}
