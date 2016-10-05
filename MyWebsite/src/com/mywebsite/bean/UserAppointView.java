package com.mywebsite.bean;

import java.sql.Date;
/*
 * 用户预约视图信息封装
 */
public class UserAppointView {
 
	//幼儿姓名
	private String childname;
	//幼儿出生日期
	private Date childbirth;
	//预约时间
	private Date appointtime;
	//医生姓名
	private String drelname;
	//医生职工号
	private String dusername;
	//疫苗名称
	private String vaccine;
	//用户账号
	private String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getChildname() {
		return childname;
	}
	public void setChildname(String childname) {
		this.childname = childname;
	}
	public Date getChildbirth() {
		return childbirth;
	}
	public void setChildbirth(Date childbirth) {
		this.childbirth = childbirth;
	}
	public Date getAppointtime() {
		return appointtime;
	}
	public void setAppointtime(Date appointtime) {
		this.appointtime = appointtime;
	}
	public String getDrelname() {
		return drelname;
	}
	public void setDrelname(String drelname) {
		this.drelname = drelname;
	}
	public String getDusername() {
		return dusername;
	}
	public void setDusername(String dusername) {
		this.dusername = dusername;
	}
	public String getVaccine() {
		return vaccine;
	}
	public void setVaccine(String vaccine) {
		this.vaccine = vaccine;
	}
	
}
