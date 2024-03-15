package com.jju.bean;

public class GoodView {
	private int gid;
	private String gname;
	private int goodNumber;
	private double goodPrice;
	private String gphoto;
	private String cname;
	private String tname;
	
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getGoodNumber() {
		return goodNumber;
	}
	public void setGoodNumber(int goodNumber) {
		this.goodNumber = goodNumber;
	}
	public double getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(double goodPrice) {
		this.goodPrice = goodPrice;
	}
	public String getGphoto() {
		return gphoto;
	}
	public void setGphoto(String gphoto) {
		this.gphoto = gphoto;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public GoodView(int gid, String gname, int goodNumber, double goodPrice, String gphoto, String cname,
			String tname) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.goodNumber = goodNumber;
		this.goodPrice = goodPrice;
		this.gphoto = gphoto;
		this.cname = cname;
		this.tname = tname;
	}
	public GoodView() {
		super();
	}
	
}
