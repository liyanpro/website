package com.mywebsite.Dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mywebsite.DB.DBAccess;
import com.mywebsite.bean.DocInfo;
import com.sun.istack.internal.logging.Logger;

public class DisposeDoctorInfoDao {
     /*
      * 添加医生信息
      */
	 public void AddDoctorinfo(String dusername,String dpassword,String drelname,String dgender,String dmobile,String major){
		   DBAccess dbAccess=new DBAccess();
		   DocInfo docinfo=new DocInfo();
		   SqlSession sqlSession=null;
			try {
				sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
				//通过sqlSession执行SQL语句
				docinfo.setDusername(dusername);
				docinfo.setDpassword(dpassword);
				docinfo.setdrelname(drelname);
				docinfo.setDgender(dgender);
				docinfo.setDmobile(dmobile);
				docinfo.setMajor(major);
				sqlSession.insert("ManageInfo.AddDocinfo", docinfo);
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
	 /*
	     * 管理员查询医生信息
	     */
	    public List<DocInfo> docinfoQuery(String dusername,String drelname){ 
	    	DBAccess dbAccess=new DBAccess();
	    	List<DocInfo> DocInfolist=new ArrayList<DocInfo>();
			SqlSession sqlSession=null;
	    	try{
	    		sqlSession=dbAccess.getSqlSession();
	    		DocInfo docInfo=new DocInfo();
	    		docInfo.setDusername(dusername);
	    		docInfo.setdrelname(drelname);
	    		DocInfolist=sqlSession.selectList("ManageInfo.QueryDocinfo",docInfo);
	    		
	    	} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
	    	finally{
	    		if(sqlSession!=null){
					sqlSession.close();
	    	}
	    }return DocInfolist;
	  }
	    /*
	     * 管理员删除医生信息
	     */
	 public void deleteDoctorinfo(String dusername){
		   DBAccess dbAccess=new DBAccess();
		   SqlSession sqlSession=null;
			try {
				sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
				//通过sqlSession执行SQL语句
				sqlSession.delete("ManageInfo.DeleteDocinfo", dusername);
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
	 /*
	  * 修改医生信息
	  */
	 public void alterDoctorinfo(String dusername,String dmobile,String major){
		   DBAccess dbAccess=new DBAccess();
		   DocInfo docinfo=new DocInfo();
		   SqlSession sqlSession=null;
			try {
				sqlSession=dbAccess.getSqlSession();//获得sqlSession对象
				//通过sqlSession执行SQL语句
				docinfo.setDusername(dusername);
				docinfo.setDmobile(dmobile);
				docinfo.setMajor(major);
				sqlSession.update("ManageInfo.alterDocinfo", docinfo);
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
	 Logger log;
}
