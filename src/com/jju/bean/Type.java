package com.jju.bean;

public class Type {
	private int tid;   //类型id
	private String tname;   //类型名称
	private int cid;    //所属类别名称   外键  连接Category对象
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
}
