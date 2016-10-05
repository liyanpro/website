package com.mywebsite.Service;

import java.sql.Date;
import java.util.List;

import com.mywebsite.Dao.ChildAppointInfoDao;
import com.mywebsite.Dao.ChildInfoAlterDao;
import com.mywebsite.Dao.ChildVaccinateInfoDao;
import com.mywebsite.Dao.LoginDao;
import com.mywebsite.Dao.UserInfoAlterDao;
import com.mywebsite.bean.ChildInfo;
import com.mywebsite.bean.DocAppointView;
import com.mywebsite.bean.ExceptionInfo;
import com.mywebsite.bean.UserAppointView;
import com.mywebsite.bean.ChildAppointInfo;
import com.mywebsite.bean.DocInfo;
import com.mywebsite.bean.VaccinateProdedure;
import com.mywebsite.bean.VaccineView;

/*
 * 查询信息服务
 */
public class QueryInfoService {
	/*
	 * 查询医生是否存在
	 */
     public DocInfo querydocID(String Dname){
    	 LoginDao logindao=new LoginDao();
    	 DocInfo docinfo=logindao.Querydocinfo(Dname);
    	return docinfo;
     }
     /*
      * 查询用户是否已经进行过预约
      */
    public ChildAppointInfo queryappointinfo(String dusername,String username,String idnum){
    	 ChildAppointInfoDao childAppointInfoDao=new ChildAppointInfoDao();
    	 ChildAppointInfo childAppointInfo =childAppointInfoDao.Queryappointinfo(dusername,username,idnum);
         	return 	 childAppointInfo;
    }
    /*
     * 查询用户的预约信息
     */
    public List<UserAppointView> queryAppointinfo(String username){
    	 ChildAppointInfoDao childAppointInfoDao=new ChildAppointInfoDao();
    	 List<UserAppointView> AppointInfolist =childAppointInfoDao.QueryAppointinfo(username);
         	return 	 AppointInfolist;
    }
    /*
     * 查询目标医生名下的所有用户预约信息
     */
    public List<DocAppointView> querydocAppointinfo(String Dname){
    	ChildAppointInfoDao childAppointInfoDao=new ChildAppointInfoDao();
    	List<DocAppointView> DocAppointInfolist=childAppointInfoDao.QuerydocAppointinfo(Dname);
    	return DocAppointInfolist;
    }
    /*
     * 查询医生信息
     */
    public List<DocInfo> queryDocinfo(){
    	 UserInfoAlterDao userInfoAlterDao=new UserInfoAlterDao();
    	 List<DocInfo> DocInfolist=userInfoAlterDao.docinfoquery();
    	 return DocInfolist;
    }
    /*
     * 根据幼儿身份证号查看疫苗接种信息
     */
    public List<VaccineView>queryVaccineinfo(String idnum){
    	ChildVaccinateInfoDao childVaccinateInfoDao=new ChildVaccinateInfoDao();
    	List<VaccineView> vaccineinfolist=childVaccinateInfoDao.SelectVaccineInfo(idnum);
    	return vaccineinfolist;
    }
    /*
     * 查询用户的所有小孩信息
     */
    public List<ChildInfo>queryChildidInfo(String username){
    	ChildInfoAlterDao childInfoAlterDao=new ChildInfoAlterDao();
    	List<ChildInfo> childinfolist=childInfoAlterDao.queryChildInfoDao(username);
    	return childinfolist;
    }
    /*
     * 根据幼儿身份证号查询幼儿信息
     */
    public ChildInfo queryChildInfo(String idnum){
    	ChildVaccinateInfoDao childVaccinateInfoDao=new ChildVaccinateInfoDao();
    	ChildInfo childinfo=childVaccinateInfoDao.SelectChildInfo(idnum);
    	return childinfo;
    }
    /*
     * 根据幼儿身份证号查询幼儿出生日期
     */
    public Date queryChildBirth(String idnum){
    	ChildInfoAlterDao childInfoAlterDao=new ChildInfoAlterDao();
    	Date age=childInfoAlterDao.queryChildBirthDao(idnum);
    	return age;
    }
    /*
     * 对用户的预约接种疫苗进行判断是否适合
     */
    public List<VaccinateProdedure> queryVaccine(Date Age){
      //获取当前系统时间 
    	Date date=new Date(System.currentTimeMillis());
      //获取两个日期之间的天数差
  	    int age=(int) (date.getTime()/86400000-Age.getTime()/86400000);
  	  //以30天为一月计算幼儿月龄
  	    age=age/30;
  	    //查询当前幼儿月龄下应该接种的疫苗
  	  ChildAppointInfoDao childAppointInfoDao=new ChildAppointInfoDao();
   	 List<VaccinateProdedure> vaccineinfolist=childAppointInfoDao.queryVaccineDao(age);
   	 return vaccineinfolist;
    }
    /*
     * 查询幼儿异常反应记录
     */
    public List<ExceptionInfo>queryExceptionInfo(String idnum){
    	ChildVaccinateInfoDao childVaccinateInfoDao=new ChildVaccinateInfoDao();
    	List<ExceptionInfo> exceptionlist=childVaccinateInfoDao.SelectExceptionInfo(idnum);
    	return exceptionlist;
    }
    /*
     * 根据医生职工号查询接种表中的幼儿身份证号
     */
    public List<VaccineView> queryChildidnum(String dusername,String idnum){
    	ChildVaccinateInfoDao childVaccinateInfoDao=new ChildVaccinateInfoDao();
    	List<VaccineView> childidnumlist=childVaccinateInfoDao.SelectChildidnum(dusername,idnum);
    	return childidnumlist;
    }
    /*
     * 查询幼儿最近一个月的接种信息
     */
    public List<VaccineView>QueryVaccineinfo(String idnum,int age){
    	ChildVaccinateInfoDao childVaccinateInfoDao=new ChildVaccinateInfoDao();
    	List<VaccineView> childVaclist=childVaccinateInfoDao.selectVaccineinfo(idnum,age);
    	return childVaclist;
    }
    public List<VaccinateProdedure> QueryVaccine(int age){
    	 ChildAppointInfoDao childAppointInfoDao=new ChildAppointInfoDao();
       	 List<VaccinateProdedure> vaccineinfolist=childAppointInfoDao.queryVaccineDao(age);
       	 return vaccineinfolist;
    }
}
