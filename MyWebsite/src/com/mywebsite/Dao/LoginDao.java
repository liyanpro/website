package com.mywebsite.Dao;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

import com.mywebsite.DB.DBAccess;
import com.mywebsite.bean.AlterPwd;
import com.mywebsite.bean.DocInfo;
import com.mywebsite.bean.UserInfo;
import com.sun.istack.internal.logging.Logger;

public class LoginDao {
	/**
	 * 
	 *用户登录数据操作
	 */
	public UserInfo Queryuserinfo(String userName){
	DBAccess dbAccess=new DBAccess();
	UserInfo userinfo=new UserInfo();
	SqlSession sqlSession=null;
	try {
		sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
		//通过sqlSession执行SQL语句
		userinfo=sqlSession.selectOne("UserInfo.queryUserinfo",userName);
	} catch (IOException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}finally{
		if(sqlSession!=null){
			sqlSession.close();
		}
		
	  }return userinfo;
  }
  
   /**
    * 
    * 社区医生登录用户操作
    */
   public DocInfo Querydocinfo(String DName){
	   DBAccess dbAccess=new DBAccess();
		DocInfo docinfo=new DocInfo();
		SqlSession sqlSession=null;
		try {
			sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
			//通过sqlSession执行SQL语句
			docinfo=sqlSession.selectOne("UserInfo.queryDocinfo",DName);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally{
			if(sqlSession!=null){
				sqlSession.close();
			}
			
		  }return docinfo;
   }
   /*
    * 管理员登录数据操作
    */
    public String QueryPassword(String adname){
    	DBAccess dbAccess=new DBAccess();
		SqlSession sqlSession=null;
		String adpassword="";
		try {
			sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
			//通过sqlSession执行SQL语句
            adpassword=sqlSession.selectOne("UserInfo.querypassword",adname);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally{
			if(sqlSession!=null){
				sqlSession.close();
			}
			
		  }return adpassword;
    }
   /*
    * 根据用户账号查询幼儿身份证号
    */
   public String Queryusername(String idnum){
	   DBAccess dbAccess=new DBAccess();
	   SqlSession sqlSession=null;
	   String idNum=null;
	   try{
		   sqlSession=dbAccess.getSqlSession();
		   idNum=sqlSession.selectOne("UserInfo.queryUsername",idnum);
	   } catch (IOException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}finally{
		   if(sqlSession!=null){
				sqlSession.close();
			 }
	   }
	   return idNum;
   }
   /*
    * 用户密码修改
    */
   public void ChangeUserPwd(String newpwd,String username){
		DBAccess dbAccess=new DBAccess();
		SqlSession sqlSession=null;
		AlterPwd alterPwd=new AlterPwd();
		try {
			alterPwd.setUserPwd(newpwd);
			alterPwd.setUsername(username);
			sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
			//通过sqlSession执行SQL语句
            sqlSession.selectOne("UserInfo.alterUserPwd",alterPwd);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally{
			if(sqlSession!=null)
				sqlSession.close();
		  }
	  }
   /*
    * 医生密码修改
    */
   public void ChangeDocPwd(String newpwd,String dusername){
		DBAccess dbAccess=new DBAccess();
		SqlSession sqlSession=null;
		AlterPwd alterPwd=new AlterPwd();
		try {
			alterPwd.setDocPwd(newpwd);
			alterPwd.setDusername(dusername);
			sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
			//通过sqlSession执行SQL语句
            sqlSession.selectOne("UserInfo.alterDocPwd",alterPwd);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally{
			if(sqlSession!=null)
				sqlSession.close();
		  }
	  }
   Logger log;
}
