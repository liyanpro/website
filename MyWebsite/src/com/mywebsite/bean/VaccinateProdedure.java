package com.mywebsite.bean;

public class VaccinateProdedure {
   
	private int age;//幼儿年龄
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getVaccine() {
		return vaccine;
	}
	public void setVaccine(String vaccine) {
		this.vaccine = vaccine;
	}
	public String getVaccinetimes() {
		return vaccinetimes;
	}
	public void setVaccinetimes(String vaccinetimes) {
		this.vaccinetimes = vaccinetimes;
	}
	private String vaccine;//接种疫苗
	private String vaccinetimes;//接种剂量
}
