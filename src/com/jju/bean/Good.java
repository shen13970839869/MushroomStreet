package com.jju.bean;

public class Good {
	private int gid;   //��Ʒ���
	private String gname;     //��Ʒ����
	private int number;    //��Ʒ����
	private String gphoto;    //��Ʒ��ַ
	private double price;    //��Ʒ�۸�
	private int tid;   //��Ʒ����   ���Ϊtype��tid
	private int cid;    //��Ʒ���     ���Ϊcategory��cid
	
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
