package com.mywebsite.Dao;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;



import com.mywebsite.DB.DBAccess;
import com.mywebsite.bean.UserInfo;

public class RegisterDao {
	/*
	 * 添加用户个人信息
	 */
	public void adduserinfo(String userName,String passwordMD5,String email,String name,String gender,String mobile,String homephone,String birthplace){
		DBAccess dbAccess=new DBAccess();
		UserInfo userinfo=new UserInfo();
		SqlSession sqlSession=null;
		try {
			sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
			//通过sqlSession执行SQL语句
			userinfo.setUsername(userName);
			userinfo.setPassword(passwordMD5);
			userinfo.setEmail(email);
			userinfo.setName(name);
			userinfo.setGender(gender);
			userinfo.setMobile(mobile);
			userinfo.setHomephone(homephone);
			userinfo.setBirthplace(birthplace);
		    sqlSession.insert("UserInfo.addUserinfo",userinfo);
		    sqlSession.commit();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally{
			if(sqlSession!=null){
				sqlSession.close();
			}
			
		  }
   }
}
