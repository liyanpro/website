package com.mywebsite.bean;

import java.sql.Date;
/*
 * 用于封装预约信息
 */
public class ChildAppointInfo {
  //疫苗名称
	private String vaccine;
  //预约时间
	private Date appointtime;
  //用户ID
	private String username;
  //医生ID
	private String dusername;
	//医生姓名
	private String drelname;
	//幼儿姓名
	private String childname;
	//幼儿身份证号
    private String idnum;
    //幼儿目前年龄
    private int age;
public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
public String getIdnum() {
		return idnum;
	}
	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}
public String getChildname() {
		return childname;
	}
	public void setChildname(String childname) {
		this.childname = childname;
	}
public String getDrelname() {
		return drelname;
	}
	public void setDrelname(String drelname) {
		this.drelname = drelname;
	}
public String getVaccine() {
	return vaccine;
}
public void setVaccine(String vaccine) {
	this.vaccine = vaccine;
}
public Date getAppointtime() {
	return appointtime;
}
public void setAppointtime(Date appointtime) {
	this.appointtime = appointtime;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getDusername() {
	return dusername;
}
public void setDusername(String dusername) {
	this.dusername = dusername;
}
  
}
