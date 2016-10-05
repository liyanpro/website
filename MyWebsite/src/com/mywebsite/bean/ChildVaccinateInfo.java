package com.mywebsite.bean;

import java.sql.Date;

public class ChildVaccinateInfo {
    
	private String vaccine;//接种疫苗名称
	private Date vaccinetime;//接种时间
	private Date appointtime;//预约时间
	private String vaccinenum;//接种疫苗批号
	private String username;//用户账号
	private String dusername;//医生职工号
	private String idnum;//幼儿身份证号
	private String vaccinetimes;//接种次数
	private int age;//幼儿年（月）龄
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getVaccinetimes() {
		return vaccinetimes;
	}
	public void setVaccinetimes(String vaccinetimes) {
		this.vaccinetimes = vaccinetimes;
	}
	public String getVaccine() {
		return vaccine;
	}
	public void setVaccine(String vaccine) {
		this.vaccine = vaccine;
	}
	public Date getVaccinetime() {
		return vaccinetime;
	}
	public void setVaccinetime(Date vaccinetime) {
		this.vaccinetime = vaccinetime;
	}
	public Date getAppointtime() {
		return appointtime;
	}
	public void setAppointtime(Date appointtime) {
		this.appointtime = appointtime;
	}
	public String getVaccinenum() {
		return vaccinenum;
	}
	public void setVaccinenum(String vaccinenum) {
		this.vaccinenum = vaccinenum;
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
	public String getIdnum() {
		return idnum;
	}
	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}
	
}
