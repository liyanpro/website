package com.mywebsite.bean;

import java.sql.Date;
/*
 * 医生预约视图信息封装
 */
public class DocAppointView {
 
	//幼儿姓名
	private String childname;
	//幼儿出生日期
	private Date childbirth;
	//幼儿身份证号
	private String idnum;
	//疫苗名称
	private String vaccine;
	//预约时间
	private Date appointtime;
	//家长姓名
	private String name;
	//联系电话
	private String mobile;
	//医生职工号
	private String dusername;
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
	public String getIdnum() {
		return idnum;
	}
	public void setIdnum(String idnum) {
		this.idnum = idnum;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getDusername() {
		return dusername;
	}
	public void setDusername(String dusername) {
		this.dusername = dusername;
	}
	
}
