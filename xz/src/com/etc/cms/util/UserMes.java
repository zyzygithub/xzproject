package com.etc.cms.util;

public class UserMes {
	private int sellcount;
	private int pingfen;
	private int likecount;
	public int getSellcount() {
		return sellcount;
	}
	public void setSellcount(int sellcount) {
		this.sellcount = sellcount;
	}
	public int getPingfen() {
		return pingfen;
	}
	public void setPingfen(int pingfen) {
		this.pingfen = pingfen;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	@Override
	public String toString() {
		return "UserMes [sellcount=" + sellcount + ", pingfen=" + pingfen + ", likecount=" + likecount + "]";
	}public UserMes() {
		// TODO Auto-generated constructor stub
	}
	public UserMes(int sellcount, int pingfen, int likecount) {
		super();
		this.sellcount = sellcount;
		this.pingfen = pingfen;
		this.likecount = likecount;
	}
}
