package com.etc.entity;
/**
 * 用户表实体类
 * @author Administrator
 *
 */
public class User {
	private int USERID;
	private String USERNAME;
	private String USERPWD;
	private String USERREALNAME;
	private String USERSEX;
	private String USERCD;
	private String USERPHONE;
	private double USERBALANCE;
	private String USERQUESTION;
	private String USERANSWER;
	private String USERSTATE;
	
	
	public User() {
		// TODO Auto-generated constructor stub
	}



	
	
	public String getUSERSTATE() {
		return USERSTATE;
	}





	public void setUSERSTATE(String uSERSTATE) {
		USERSTATE = uSERSTATE;
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



	public String getUSERPWD() {
		return USERPWD;
	}



	public void setUSERPWD(String uSERPWD) {
		USERPWD = uSERPWD;
	}



	public String getUSERREALNAME() {
		return USERREALNAME;
	}



	public void setUSERREALNAME(String uSERREALNAME) {
		USERREALNAME = uSERREALNAME;
	}



	public String getUSERSEX() {
		return USERSEX;
	}



	public void setUSERSEX(String uSERSEX) {
		USERSEX = uSERSEX;
	}



	public String getUSERCD() {
		return USERCD;
	}



	public void setUSERCD(String uSERCD) {
		USERCD = uSERCD;
	}



	public String getUSERPHONE() {
		return USERPHONE;
	}



	public void setUSERPHONE(String uSERPHONE) {
		USERPHONE = uSERPHONE;
	}



	public double getUSERBALANCE() {
		return USERBALANCE;
	}



	public void setUSERBALANCE(double uSERBALANCE) {
		USERBALANCE = uSERBALANCE;
	}



	public String getUSERQUESTION() {
		return USERQUESTION;
	}



	public void setUSERQUESTION(String uSERQUESTION) {
		USERQUESTION = uSERQUESTION;
	}



	public String getUSERANSWER() {
		return USERANSWER;
	}



	public void setUSERANSWER(String uSERANSWER) {
		USERANSWER = uSERANSWER;
	}



	public User(int uSERID, String uSERNAME, String uSERPWD, String uSERREALNAME, String uSERSEX, String uSERCD,
			String uSERPHONE, double uSERBALANCE, String uSERQUESTION, String uSERANSWER) {
		super();
		USERID = uSERID;
		USERNAME = uSERNAME;
		USERPWD = uSERPWD;
		USERREALNAME = uSERREALNAME;
		USERSEX = uSERSEX;
		USERCD = uSERCD;
		USERPHONE = uSERPHONE;
		USERBALANCE = uSERBALANCE;
		USERQUESTION = uSERQUESTION;
		USERANSWER = uSERANSWER;
	}



	@Override
	public String toString() {
		return "User [USERID=" + USERID + ", USERNAME=" + USERNAME + ", USERPWD=" + USERPWD + ", USERREALNAME="
				+ USERREALNAME + ", USERSEX=" + USERSEX + ", USERCD=" + USERCD + ", USERPHONE=" + USERPHONE
				+ ", USERBALANCE=" + USERBALANCE + ", USERQUESTION=" + USERQUESTION + ", USERANSWER=" + USERANSWER
				+ ", USERSTATE=" + USERSTATE + "]";
	}


	
	

	public User(int uSERID, String uSERNAME, String uSERPWD, String uSERREALNAME,String uSERCD) {
		super();
		USERID = uSERID;
		USERNAME = uSERNAME;
		USERPWD = uSERPWD;
		USERREALNAME = uSERREALNAME;
		USERCD = uSERCD;

	}





	public User(int uSERID, String uSERNAME, String uSERPWD, String uSERREALNAME, String uSERSEX, String uSERCD,
			String uSERPHONE, double uSERBALANCE, String uSERQUESTION, String uSERANSWER, String uSERSTATE) {
		super();
		USERID = uSERID;
		USERNAME = uSERNAME;
		USERPWD = uSERPWD;
		USERREALNAME = uSERREALNAME;
		USERSEX = uSERSEX;
		USERCD = uSERCD;
		USERPHONE = uSERPHONE;
		USERBALANCE = uSERBALANCE;
		USERQUESTION = uSERQUESTION;
		USERANSWER = uSERANSWER;
		USERSTATE = uSERSTATE;
	}
	
	
	
}
