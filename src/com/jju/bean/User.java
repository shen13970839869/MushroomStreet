package com.jju.bean;

public class User {
	private int uid; //�û����
	private String uname;  //�û���¼��
	private String upassword; //�û���¼����
	private String email;    //�û������
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public User(int uid, String uname, String upassword, String email) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upassword = upassword;
		this.email = email;
	}
	public User(int uid, String uname, String upassword) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upassword = upassword;
	}
	public User() {
		super();
	}
	
}
