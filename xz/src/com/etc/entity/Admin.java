package com.etc.entity;
/**
 * 管理员实体类
 * @author Administrator
 *
 */
public class Admin {
	private int ID;
	private String ADMINNAME;
	private String ADMINPWD;
public Admin() {
	// TODO Auto-generated constructor stub
}
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public String getADMINNAME() {
	return ADMINNAME;
}
public void setADMINNAME(String aDMINNAME) {
	ADMINNAME = aDMINNAME;
}
public String getADMINPWD() {
	return ADMINPWD;
}
public void setADMINPWD(String aDMINPWD) {
	ADMINPWD = aDMINPWD;
}
@Override
public String toString() {
	return "Admin [ID=" + ID + ", ADMINNAME=" + ADMINNAME + ", ADMINPWD=" + ADMINPWD + "]";
}
public Admin(int iD, String aDMINNAME, String aDMINPWD) {
	super();
	ID = iD;
	ADMINNAME = aDMINNAME;
	ADMINPWD = aDMINPWD;
}

}
