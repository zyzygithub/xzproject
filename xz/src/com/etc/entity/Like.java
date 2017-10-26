package com.etc.entity;
/**
 * 用户收藏实体类
 * @author Administrator
 *
 */
public class Like {
	private int LIKEID;
	private int GOODSID;
	private int USERID;public Like() {
		// TODO Auto-generated constructor stub
	}
	public int getLIKEID() {
		return LIKEID;
	}
	public void setLIKEID(int lIKEID) {
		LIKEID = lIKEID;
	}
	public int getGOODSID() {
		return GOODSID;
	}
	public void setGOODSID(int gOODSID) {
		GOODSID = gOODSID;
	}
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	@Override
	public String toString() {
		return "Like [LIKEID=" + LIKEID + ", GOODSID=" + GOODSID + ", USERID=" + USERID + "]";
	}
	public Like(int lIKEID, int gOODSID, int uSERID) {
		super();
		LIKEID = lIKEID;
		GOODSID = gOODSID;
		USERID = uSERID;
	}
	
}
