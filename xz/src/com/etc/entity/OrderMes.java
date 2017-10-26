package com.etc.entity;
/**
 * 订单详情实体类
 * @author Administrator
 *
 */
public class OrderMes {
	private int ORDERMESID;
	private int GOODID;
	private int BUYCOUNT;
	private int ORDERID;public OrderMes() {
		// TODO Auto-generated constructor stub
	}
	public OrderMes(int oRDERMESID, int gOODID, int bUYCOUNT, int oRDERID) {
		super();
		ORDERMESID = oRDERMESID;
		GOODID = gOODID;
		BUYCOUNT = bUYCOUNT;
		ORDERID = oRDERID;
	}
	@Override
	public String toString() {
		return "OrderMes [ORDERMESID=" + ORDERMESID + ", GOODID=" + GOODID + ", BUYCOUNT=" + BUYCOUNT + ", ORDERID="
				+ ORDERID + "]";
	}
	public int getORDERMESID() {
		return ORDERMESID;
	}
	public void setORDERMESID(int oRDERMESID) {
		ORDERMESID = oRDERMESID;
	}
	public int getGOODID() {
		return GOODID;
	}
	public void setGOODID(int gOODID) {
		GOODID = gOODID;
	}
	public int getBUYCOUNT() {
		return BUYCOUNT;
	}
	public void setBUYCOUNT(int bUYCOUNT) {
		BUYCOUNT = bUYCOUNT;
	}
	public int getORDERID() {
		return ORDERID;
	}
	public void setORDERID(int oRDERID) {
		ORDERID = oRDERID;
	}
}
