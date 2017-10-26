package com.etc.entity;
/**
 * 商品类型实体类
 * @author Administrator
 *
 */
public class Types {
	private int TYPEID;
	private String TYPENAME;
	private String TYPEMESNAME;
	public Types() {
		// TODO Auto-generated constructor stub
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
	@Override
	public String toString() {
		return "Types [TYPEID=" + TYPEID + ", TYPENAME=" + TYPENAME + ", TYPEMESNAME=" + TYPEMESNAME + "]";
	}
	public Types(int tYPEID, String tYPENAME, String tYPEMESNAME) {
		super();
		TYPEID = tYPEID;
		TYPENAME = tYPENAME;
		TYPEMESNAME = tYPEMESNAME;
	}
	
}
