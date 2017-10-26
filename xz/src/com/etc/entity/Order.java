package com.etc.entity;
/**
 * 订单实体类
 * @author Administrator
 *
 */
public class Order {
	private int ORDERID;
	private int USERID;
	private int SENDPOSITION;
	private int RECEIVEPOSITION;
	private String ORDERDATE;
	private String ORDERREMARK;
	private String ORDERSTATE;
	private String MONEYSTATE;
	public String getMONEYSTATE() {
		return MONEYSTATE;
	}
	public void setMONEYSTATE(String mONEYSTATE) {
		MONEYSTATE = mONEYSTATE;
	}
	public Order() {
		// TODO Auto-generated constructor stub
	}
	public Order(int oRDERID, int uSERID, int sENDPOSITION, int rECEIVEPOSITION, String oRDERDATE, String oRDERREMARK,
			String oRDERSTATE) {
		super();
		ORDERID = oRDERID;
		USERID = uSERID;
		SENDPOSITION = sENDPOSITION;
		RECEIVEPOSITION = rECEIVEPOSITION;
		ORDERDATE = oRDERDATE;
		ORDERREMARK = oRDERREMARK;
		ORDERSTATE = oRDERSTATE;
	}
	public Order(int oRDERID, int uSERID, int sENDPOSITION, int rECEIVEPOSITION, String oRDERDATE, String oRDERREMARK,
			String oRDERSTATE, String mONEYSTATE) {
		super();
		ORDERID = oRDERID;
		USERID = uSERID;
		SENDPOSITION = sENDPOSITION;
		RECEIVEPOSITION = rECEIVEPOSITION;
		ORDERDATE = oRDERDATE;
		ORDERREMARK = oRDERREMARK;
		ORDERSTATE = oRDERSTATE;
		MONEYSTATE = mONEYSTATE;
	}
	@Override
	public String toString() {
		return "Order [ORDERID=" + ORDERID + ", USERID=" + USERID + ", SENDPOSITION=" + SENDPOSITION
				+ ", RECEIVEPOSITION=" + RECEIVEPOSITION + ", ORDERDATE=" + ORDERDATE + ", ORDERREMARK=" + ORDERREMARK
				+ ", ORDERSTATE=" + ORDERSTATE + ", MONEYSTATE=" + MONEYSTATE + "]";
	}
	public int getORDERID() {
		return ORDERID;
	}
	public void setORDERID(int oRDERID) {
		ORDERID = oRDERID;
	}
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public int getSENDPOSITION() {
		return SENDPOSITION;
	}
	public void setSENDPOSITION(int sENDPOSITION) {
		SENDPOSITION = sENDPOSITION;
	}
	public int getRECEIVEPOSITION() {
		return RECEIVEPOSITION;
	}
	public void setRECEIVEPOSITION(int rECEIVEPOSITION) {
		RECEIVEPOSITION = rECEIVEPOSITION;
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
	public String getORDERSTATE() {
		return ORDERSTATE;
	}
	public void setORDERSTATE(String oRDERSTATE) {
		ORDERSTATE = oRDERSTATE;
	}
}
