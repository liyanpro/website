package com.mywebsite.bean;

import java.sql.Date;
/*
 * 用于封装幼儿异常反应记录
 */
public class ExceptionInfo {
	
	String childname;//幼儿姓名
	String idnum;//身份证号
	String vaccine;//疫苗名称
	String factory;//生产厂家
	String vaccinenum;//疫苗批号
	Date indate;//疫苗有效期
	Date vaccinatetime;//接种日期
	Date reaction;//反应日期
	String symptom; //反应症状
	public String getFactory() {
		return factory;
	}
	public void setFactory(String factory) {
		this.factory = factory;
	}
	public String getChildname() {
		return childname;
	}
	public void setChildname(String childname) {
		this.childname = childname;
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
	public String getVaccinenum() {
		return vaccinenum;
	}
	public void setVaccinenum(String vaccinenum) {
		this.vaccinenum = vaccinenum;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public Date getVaccinatetime() {
		return vaccinatetime;
	}
	public void setVaccinatetime(Date vaccinatetime) {
		this.vaccinatetime = vaccinatetime;
	}
	public Date getReaction() {
		return reaction;
	}
	public void setReaction(Date reaction) {
		this.reaction = reaction;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
}
