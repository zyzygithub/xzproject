package com.etc.cms.util;

public class GoodsDetails {
	private int GOODID;
	private int GOODSELER;
	private String SELERNAME;
	private String GOODTITLE;
	private String TYPENAME;
	private String TYPEMESNAME;
	private double ORIGINALPRICE;
	private double GOODPRICE;
	private String GOODREMARK;
	private String GOODPIC;
	private int GOODCLICK;
	private int GOODCOUNT;
	private String GOODSTATE;
	private String GOODUP;
	private int LIKECOUNT;
	private String PICFIRST;
	private String PICSECOND;
	private String PICTHIRD;
	

	public GoodsDetails() {
		// TODO Auto-generated constructor stub
	}

	
	
	public String getTYPENAME() {
		return TYPENAME;
	}



	public void setTYPENAME(String tYPENAME) {
		TYPENAME = tYPENAME;
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


	public String getSELERNAME() {
		return SELERNAME;
	}


	public void setSELERNAME(String sELERNAME) {
		SELERNAME = sELERNAME;
	}


	public String getGOODTITLE() {
		return GOODTITLE;
	}


	public void setGOODTITLE(String gOODTITLE) {
		GOODTITLE = gOODTITLE;
	}


	public String getTYPEMESNAME() {
		return TYPEMESNAME;
	}


	public void setTYPEMESNAME(String tYPEMESNAME) {
		TYPEMESNAME = tYPEMESNAME;
	}


	public double getORIGINALPRICE() {
		return ORIGINALPRICE;
	}


	public void setORIGINALPRICE(double oRIGINALPRICE) {
		ORIGINALPRICE = oRIGINALPRICE;
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


	public String getGOODUP() {
		return GOODUP;
	}


	public void setGOODUP(String gOODUP) {
		GOODUP = gOODUP;
	}


	public int getLIKECOUNT() {
		return LIKECOUNT;
	}


	public void setLIKECOUNT(int lIKECOUNT) {
		LIKECOUNT = lIKECOUNT;
	}


	public String getPICFIRST() {
		return PICFIRST;
	}


	public void setPICFIRST(String pICFIRST) {
		PICFIRST = pICFIRST;
	}


	public String getPICSECOND() {
		return PICSECOND;
	}


	public void setPICSECOND(String pICSECOND) {
		PICSECOND = pICSECOND;
	}


	public String getPICTHIRD() {
		return PICTHIRD;
	}


	public void setPICTHIRD(String pICTHIRD) {
		PICTHIRD = pICTHIRD;
	}



	public GoodsDetails(int gOODID, int gOODSELER, String sELERNAME, String gOODTITLE, String tYPENAME,
			String tYPEMESNAME, double oRIGINALPRICE, double gOODPRICE, String gOODREMARK, String gOODPIC,
			int gOODCLICK, int gOODCOUNT, String gOODSTATE, String gOODUP, int lIKECOUNT, String pICFIRST,
			String pICSECOND, String pICTHIRD) {
		super();
		GOODID = gOODID;
		GOODSELER = gOODSELER;
		SELERNAME = sELERNAME;
		GOODTITLE = gOODTITLE;
		TYPENAME = tYPENAME;
		TYPEMESNAME = tYPEMESNAME;
		ORIGINALPRICE = oRIGINALPRICE;
		GOODPRICE = gOODPRICE;
		GOODREMARK = gOODREMARK;
		GOODPIC = gOODPIC;
		GOODCLICK = gOODCLICK;
		GOODCOUNT = gOODCOUNT;
		GOODSTATE = gOODSTATE;
		GOODUP = gOODUP;
		LIKECOUNT = lIKECOUNT;
		PICFIRST = pICFIRST;
		PICSECOND = pICSECOND;
		PICTHIRD = pICTHIRD;
	}



	@Override
	public String toString() {
		return "GoodsDetails [GOODID=" + GOODID + ", GOODSELER=" + GOODSELER + ", SELERNAME=" + SELERNAME
				+ ", GOODTITLE=" + GOODTITLE + ", TYPENAME=" + TYPENAME + ", TYPEMESNAME=" + TYPEMESNAME
				+ ", ORIGINALPRICE=" + ORIGINALPRICE + ", GOODPRICE=" + GOODPRICE + ", GOODREMARK=" + GOODREMARK
				+ ", GOODPIC=" + GOODPIC + ", GOODCLICK=" + GOODCLICK + ", GOODCOUNT=" + GOODCOUNT + ", GOODSTATE="
				+ GOODSTATE + ", GOODUP=" + GOODUP + ", LIKECOUNT=" + LIKECOUNT + ", PICFIRST=" + PICFIRST
				+ ", PICSECOND=" + PICSECOND + ", PICTHIRD=" + PICTHIRD + "]";
	}


	


	
	
	
	
}
