package com.mywebsite.Dao;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mywebsite.DB.DBAccess;
import com.mywebsite.bean.ChildAppointInfo;
import com.mywebsite.bean.DocAppointView;
import com.mywebsite.bean.VaccinateProdedure;
import com.sun.istack.internal.logging.Logger;
import com.mywebsite.bean.UserAppointView;
public class ChildAppointInfoDao {
	/*
	 * 查询用户是否预约过当前医生
	 */
	 public ChildAppointInfo Queryappointinfo(String dusername,String username,String idnum){
		   DBAccess dbAccess=new DBAccess();
		   ChildAppointInfo childAppointInfo=new ChildAppointInfo();
			SqlSession sqlSession=null;
			try {
				sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
				//通过sqlSession执行SQL语句
				childAppointInfo.setDusername(dusername);
				childAppointInfo.setUsername(username);
				childAppointInfo.setIdnum(idnum);
				childAppointInfo=sqlSession.selectOne("ChildAppoint.Queryappointinfo",childAppointInfo);
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}finally{
				if(sqlSession!=null){
					sqlSession.close();
				}
				
			  }return childAppointInfo;
	   }
	 /*
      * 添加用户的预约信息
      */
     public void appointinfo(String vaccine,Date appointtime,String dusername,String drelname,String childname,String idnum,String username){
    	 DBAccess dbAccess=new DBAccess();
    	 ChildAppointInfo childappointinfo=new  ChildAppointInfo();
    	 SqlSession sqlSession=null;
    	 try{
    		 //获取sqlSession对象
    		 sqlSession=dbAccess.getSqlSession(); 
    		 //将信息添加到childappointinfo对象中保存
    		 childappointinfo.setVaccine(vaccine);
    		 childappointinfo.setAppointtime(appointtime);
    		 childappointinfo.setDrelname(drelname);
    		 childappointinfo.setDusername(dusername);
    		 childappointinfo.setChildname(childname);
    		 childappointinfo.setIdnum(idnum);
    		 childappointinfo.setUsername(username);
    		 //将childappointinfo对象信息插入相关表中
    		 sqlSession.insert("ChildAppoint.addAppointinfo", childappointinfo);
        	 sqlSession.commit();
    	 } catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
    	 finally{
    		 if(sqlSession!=null){
  				sqlSession.close();
    	 }	 
     }
   }
     /*
      * 获取用户的预约信息
      */
     public List<UserAppointView> QueryAppointinfo(String username){
		   DBAccess dbAccess=new DBAccess();
		   List<UserAppointView> AppointInfolist=new ArrayList<UserAppointView>();
			SqlSession sqlSession=null;
			try {
				sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
				//通过sqlSession执行SQL语句
				AppointInfolist=sqlSession.selectList("ChildAppoint.QueryAppointinfo",username);
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}finally{
				if(sqlSession!=null){
					sqlSession.close();
				}
				
			  }return AppointInfolist;
	   }
     /*
      * 获取目标医生名下的用户预约信息
      */
     public List<DocAppointView> QuerydocAppointinfo(String Dname){
		 //获取数据库会话对象  
    	   DBAccess dbAccess=new DBAccess(); 
		   List<DocAppointView> DocAppointInfolist=new ArrayList<DocAppointView>();
		   SqlSession sqlSession=null;
			try {
		 //打开一个数据库会话		
				sqlSession=dbAccess.getSqlSession();
		 //执行SQL语句返回医生列表集合
				DocAppointInfolist=sqlSession.selectList("ChildAppoint.QueryDocAppointinfo",Dname);
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}finally{
				if(sqlSession!=null){
					sqlSession.close();
				}
				
			  }return DocAppointInfolist;
	   }
     /*
      * 删除用户的预约信息
      */
     public void Deleteappointinfo(String idnum){
    	 DBAccess dbAccess=new DBAccess();
    	 SqlSession sqlSession=null;
    	 try{
    		 sqlSession=dbAccess.getSqlSession();
    		 sqlSession.delete("ChildAppoint.deleteAppointinfo", idnum);
    		 sqlSession.commit();
    	 } catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
    	 finally{
    		 if(sqlSession!=null){
				 sqlSession.close();
    	     }
         }
     }
     /*
      * 查询当前月龄的幼儿应该接种的疫苗名称
      */
     public List<VaccinateProdedure> queryVaccineDao(int age){
    	 DBAccess dbAccess=new DBAccess();
    	 List<VaccinateProdedure> vaccineinfolist=new ArrayList<VaccinateProdedure>();
    	 SqlSession sqlSession=null;
    	 try{
    		 sqlSession=dbAccess.getSqlSession();
    		 vaccineinfolist=sqlSession.selectList("ChildAppoint.queryVaccine", age);
    		 sqlSession.commit();
    	 } catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
    	 finally{
    		 if(sqlSession!=null){
				 sqlSession.close();
    	     }
         }
    	 return vaccineinfolist;
     }
	 Logger log;
}
