package com.mywebsite.bean;

import java.util.Date;


/*
 * 用于封装用户幼儿信息
 */
public class ChildInfo {
	//幼儿的姓名
   private String childname;
   //幼儿的性别
   private String childgender;
   //幼儿的出生日期
   private Date childbirth;
   //幼儿的身份证号
   private String idnum;
   //用户的用户名
   private String username;
   private int age;
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
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
public String getChildgender() {
	return childgender;
}
public void setChildgender(String childgender) {
	this.childgender = childgender;
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
   
   
}
