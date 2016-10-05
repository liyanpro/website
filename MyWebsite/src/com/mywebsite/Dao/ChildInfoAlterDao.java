package com.mywebsite.Dao;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.apache.ibatis.session.SqlSession;

import com.mywebsite.DB.DBAccess;
import com.mywebsite.bean.ChildInfo;

/*
 * 幼儿基本信息和预约信息操作
 */
public class ChildInfoAlterDao {
	/*
	 * 幼儿基本信息添加
	 */
     public void childinfoalter(String childname,String childgender,Date childbirth,String idnum,String username){
    	 DBAccess dbAccess=new DBAccess();
 		 ChildInfo childinfo=new ChildInfo();
 		 SqlSession sqlSession=null;
         try{
      	   sqlSession=dbAccess.getSqlSession();
      	   childinfo.setChildname(childname);
      	   childinfo.setChildgender(childgender);
      	   childinfo.setChildbirth(childbirth);
      	   childinfo.setIdnum(idnum);
      	   childinfo.setUsername(username);
      	   sqlSession.insert("UserInfo.addChildinfo",childinfo);
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
      * 查询用户所有小孩的信息
      */
    public List<ChildInfo>queryChildInfoDao(String username){
    	 DBAccess dbAccess=new DBAccess();
 		 List<ChildInfo>childinfolist=new ArrayList<ChildInfo>();
 		 SqlSession sqlSession=null;
         try{
      	   sqlSession=dbAccess.getSqlSession();
      	   childinfolist=sqlSession.selectList("ChildVaccinate.selectChildInfo",username);

         } catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
         finally{
        	 if(sqlSession!=null)
 				sqlSession.close();
        }
         return childinfolist;
    }
    /*
     * 根据幼儿身份证号查询幼儿出生日期
     */
    public Date queryChildBirthDao(String idnum){
   	     DBAccess dbAccess=new DBAccess();
		 SqlSession sqlSession=null;
		 Date age = null;
        try{
     	   sqlSession=dbAccess.getSqlSession();
     	   age=sqlSession.selectOne("ChildVaccinate.selectChildBirth",idnum);

        } catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
        finally{
       	 if(sqlSession!=null)
				sqlSession.close();
       }
        return age;
   }
     Logger log;
}
