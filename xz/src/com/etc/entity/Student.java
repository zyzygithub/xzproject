package com.etc.entity;

public class Student {
	private int ID;
	private String NAME;
	private String XUEHAO;
	public Student(int iD, String nAME, String xUEHAO) {
		super();
		ID = iD;
		NAME = nAME;
		XUEHAO = xUEHAO;
	}
	public Student() {
		super();
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getXUEHAO() {
		return XUEHAO;
	}
	public void setXUEHAO(String xUEHAO) {
		XUEHAO = xUEHAO;
	}
	@Override
	public String toString() {
		return "Student [ID=" + ID + ", NAME=" + NAME + ", XUEHAO=" + XUEHAO + "]";
	}
	
}
