package com.mywebsite.Service;

import java.util.List;

import com.mywebsite.Dao.DisposeDoctorInfoDao;
import com.mywebsite.bean.DocInfo;

public class DocInfoService {
	
	/*
     * 管理员查询医生信息
     */
    public List<DocInfo>queryDocInfo(String dusername,String drelname){
    	DisposeDoctorInfoDao queryDocInfoDao=new DisposeDoctorInfoDao();
   	    List<DocInfo> DocInfolist=queryDocInfoDao.docinfoQuery(dusername,drelname);
   	    return DocInfolist;
    }
    /*
     * 管理员删除医生信息
     */
    public void deleteDocInfo(String dusername){
    	//医生职工号的合法性
    	if(dusername!=null&&!"".equals(dusername)){
    	DisposeDoctorInfoDao deleteDoctorInfoDao=new DisposeDoctorInfoDao();
    	//调用数据逻辑层处理删除操作
    	deleteDoctorInfoDao.deleteDoctorinfo(dusername);
    	}
    }
    /*
     * 管理员修改医生信息
     */
    public void alterDocInfo(String dusername,String dmobile,String major){
    	//医生职工号的合法性
    	if(dusername!=null&&!"".equals(dusername)){
    	DisposeDoctorInfoDao deleteDoctorInfoDao=new DisposeDoctorInfoDao();
    	//调用数据逻辑层处理删除操作
    	deleteDoctorInfoDao.alterDoctorinfo(dusername,dmobile,major);
    	}
    }
}   
