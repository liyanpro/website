package com.mywebsite.bean;
/*
 * 用于封装用户信息的JavaBean
 */
public class UserInfo {
		//用户登录的用户名
		private String username;
		//用户登录密码
		private String password;
		//用户邮件地址
		private String email;
		//用户真实姓名
		private String name;
		//用户性别
		private String gender;
		//用户手机号
		private String mobile;
		//用户籍贯
		private String birthplace;
		//用户家庭电话
		private String homephone;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getMobile() {
			return mobile;
		}
		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
		public String getBirthplace() {
			return birthplace;
		}
		public void setBirthplace(String birthplace) {
			this.birthplace = birthplace;
		}
		public String getHomephone() {
			return homephone;
		}
		public void setHomephone(String homephone) {
			this.homephone = homephone;
		}
		
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		

	}
