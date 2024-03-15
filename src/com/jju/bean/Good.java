package com.jju.bean;

public class Good {
	private int gid;   //商品编号
	private String gname;     //商品名称
	private int number;    //商品数量
	private String gphoto;    //商品地址
	private double price;    //商品价格
	private int tid;   //商品类型   外键为type的tid
	private int cid;    //商品类别     外键为category的cid
	
	public Good() {
		super();
	}
	public Good(int gid, String gname, int number, String gphoto, double price, int tid, int cid) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.number = number;
		this.gphoto = gphoto;
		this.price = price;
		this.tid = tid;
		this.cid = cid;
	}
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
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getGphoto() {
		return gphoto;
	}
	public void setGphoto(String gphoto) {
		this.gphoto = gphoto;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
}
