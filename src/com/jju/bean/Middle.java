package com.jju.bean;

import java.util.Date;

/*
 * ����ΪΪ����������ʾ���м���
 * */
public class Middle {
	private int oid;    //�������
	private String gname;   //������Ʒ��
	private String uname;   //�����û���
	private int price;    //������Ʒ�ܼ۸�
	private Date date;    //��������ʱ��
	private String status;   //������ǰ״̬
	private String address;   //�����ջ���ַ
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Middle() {
		super();
	}
	public Middle(int oid, String gname, String uname, int price, Date date, String status,String address) {
		super();
		this.oid = oid;
		this.gname = gname;
		this.uname = uname;
		this.price = price;
		this.date = date;
		this.status = status;
		this.address=address;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
