package com.mywebsite.bean;

public class DocInfo {
  //医生职工号
	private String dusername;
  //登录密码
	private String dpassword;
  //医生真实姓名
	private String  drelname;
	public String getDmobile() {
		return dmobile;
	}
	public void setDmobile(String dmobile) {
		this.dmobile = dmobile;
	}
	//医生性别
	private String dgender;
	//医生手机号
	private String dmobile;
	//医生职业方向
	private String major;
	public String getDusername() {
		return dusername;
	}
	public void setDusername(String dusername) {
		this.dusername = dusername;
	}
	public String getDpassword() {
		return dpassword;
	}
	public void setDpassword(String dpassword) {
		this.dpassword = dpassword;
	}
	public String getdrelname() {
		return drelname;
	}
	public void setdrelname(String dname) {
		this.drelname = dname;
	}
	public String getDgender() {
		return dgender;
	}
	public void setDgender(String dgender) {
		this.dgender = dgender;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
}
