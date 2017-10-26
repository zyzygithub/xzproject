package com.etc.entity;

public class GOODS_GOODSTYPE {
	

	
	private int GOODID;
	private int GOODSELER;
	private String GOODTITLE;
	private int GOODTYPE;
	private double GOODPRICE;
	private String GOODREMARK;
	private String GOODPIC;
	private int GOODCLICK;
	private int GOODCOUNT;
	private String GOODSTATE;
	private int TYPEID;
	private String TYPENAME;
	private String TYPEMESNAME;
	private String GOODUP;
	private String GOODDOWN;
	
	private double ORIGINALPRICE;
	
	public GOODS_GOODSTYPE() {
		// TODO Auto-generated constructor stub
	}

	public GOODS_GOODSTYPE(int gOODID, int gOODSELER, String gOODTITLE, int gOODTYPE, double gOODPRICE,
			String gOODREMARK, String gOODPIC, int gOODCLICK, int gOODCOUNT, String gOODSTATE, int tYPEID,
			String tYPENAME, String tYPEMESNAME, String gOODUP, String gOODDOWN, double oRIGINALPRICE) {
		super();
		GOODID = gOODID;
		GOODSELER = gOODSELER;
		GOODTITLE = gOODTITLE;
		GOODTYPE = gOODTYPE;
		GOODPRICE = gOODPRICE;
		GOODREMARK = gOODREMARK;
		GOODPIC = gOODPIC;
		GOODCLICK = gOODCLICK;
		GOODCOUNT = gOODCOUNT;
		GOODSTATE = gOODSTATE;
		TYPEID = tYPEID;
		TYPENAME = tYPENAME;
		TYPEMESNAME = tYPEMESNAME;
		GOODUP = gOODUP;
		GOODDOWN = gOODDOWN;
		ORIGINALPRICE = oRIGINALPRICE;
	}

	@Override
	public String toString() {
		return "GOODS_GOODSTYPE [GOODID=" + GOODID + ", GOODSELER=" + GOODSELER + ", GOODTITLE=" + GOODTITLE
				+ ", GOODTYPE=" + GOODTYPE + ", GOODPRICE=" + GOODPRICE + ", GOODREMARK=" + GOODREMARK + ", GOODPIC="
				+ GOODPIC + ", GOODCLICK=" + GOODCLICK + ", GOODCOUNT=" + GOODCOUNT + ", GOODSTATE=" + GOODSTATE
				+ ", TYPEID=" + TYPEID + ", TYPENAME=" + TYPENAME + ", TYPEMESNAME=" + TYPEMESNAME + ", GOODUP="
				+ GOODUP + ", GOODDOWN=" + GOODDOWN + ", ORIGINALPRICE=" + ORIGINALPRICE + "]";
	}

	public int getGOODID() {
		return GOODID;
	}

	public void setGOODID(int gOODID) {
		GOODID = gOODID;
	}

	public int getGOODSELER() {
		return GOODSELER;
	}

	public void setGOODSELER(int gOODSELER) {
		GOODSELER = gOODSELER;
	}

	public String getGOODTITLE() {
		return GOODTITLE;
	}

	public void setGOODTITLE(String gOODTITLE) {
		GOODTITLE = gOODTITLE;
	}

	public int getGOODTYPE() {
		return GOODTYPE;
	}

	public void setGOODTYPE(int gOODTYPE) {
		GOODTYPE = gOODTYPE;
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

	public int getGOODCOUNT() {
		return GOODCOUNT;
	}

	public void setGOODCOUNT(int gOODCOUNT) {
		GOODCOUNT = gOODCOUNT;
	}

	public String getGOODSTATE() {
		return GOODSTATE;
	}

	public void setGOODSTATE(String gOODSTATE) {
		GOODSTATE = gOODSTATE;
	}

	public int getTYPEID() {
		return TYPEID;
	}

	public void setTYPEID(int tYPEID) {
		TYPEID = tYPEID;
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

	public String getGOODUP() {
		return GOODUP;
	}

	public void setGOODUP(String gOODUP) {
		GOODUP = gOODUP;
	}

	public String getGOODDOWN() {
		return GOODDOWN;
	}

	public void setGOODDOWN(String gOODDOWN) {
		GOODDOWN = gOODDOWN;
	}

	public double getORIGINALPRICE() {
		return ORIGINALPRICE;
	}

	public void setORIGINALPRICE(double oRIGINALPRICE) {
		ORIGINALPRICE = oRIGINALPRICE;
	}
	
	
}
