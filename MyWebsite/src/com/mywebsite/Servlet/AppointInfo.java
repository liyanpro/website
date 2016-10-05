package com.mywebsite.Servlet;


import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mywebsite.Dao.ChildAppointInfoDao;
import com.mywebsite.Service.QueryInfoService;
import com.mywebsite.bean.ChildAppointInfo;
import com.mywebsite.bean.DocInfo;
import com.mywebsite.bean.VaccinateProdedure;
@WebServlet("/AppointInfo")
/*
 * 幼儿疫苗接种预约控制
 */
public class AppointInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public AppointInfo() {
		super();
	}
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
       //设置编码       
       request.setCharacterEncoding("UTF-8");
       HttpSession session=request.getSession();      
      //获取页面的参数
       String vaccine = request.getParameter("vaccine");//疫苗名称
       String Appointtime = request.getParameter("appointtime");//预约时间
       String dusername = request.getParameter("dusername");//医生ID
       String username=(String)session.getAttribute("username");//用户ID
       String childname=request.getParameter("childname");//幼儿姓名
       String idnum=request.getParameter("idnum");//幼儿身份证号
     //判断接种疫苗是否适合幼儿当前年龄
       QueryInfoService queryInfo=new QueryInfoService();
       Date age=queryInfo.queryChildBirth(idnum);
     //返回VaccinateProdedure类型的List集合
       List<VaccinateProdedure> vaccineinfolist=queryInfo.queryVaccine(age);
     //判断条件默认为false
       boolean flag=false;
     //循环比较页面接收的疫苗名称和查询到的是否有相同的
       for(int i=0;i<vaccineinfolist.size();i++){
     		 if(vaccineinfolist.get(i).getVaccine().equals(vaccine))
     			 flag=true;
     	 }
     //符合预约条件执行预约相关操作   
     if(flag){                    
       //日期格式转换
       java.sql.Date appointtime;
       appointtime=java.sql.Date.valueOf(Appointtime);
      //根据医生ID查询该医生是否存在
       DocInfo docinfo=queryInfo.querydocID(dusername);
       if(docinfo!=null){
    	   //判断用户是否有重复预约
    	   ChildAppointInfo childAppointInfo=queryInfo.queryappointinfo(dusername, username,idnum);
    	   if(childAppointInfo==null){
             //调用ChildInfoAlterDao对象进行数据处理
    		   ChildAppointInfoDao childAppointInfoDao=new ChildAppointInfoDao();
    		   childAppointInfoDao.appointinfo(vaccine, appointtime,dusername,docinfo.getdrelname(),childname,idnum,username);
               request.setAttribute("page", "showappoint.jsp");
               request.setAttribute("info", "预约成功!");//  定义result.jsp中使用的消息
         }
    	   else{
    		 //显示预约信息 
    		   request.setAttribute("page", "showappoint.jsp");
               request.setAttribute("info", "您已经有过预约，不能重复！");     
    	   }	   
       }
       //如果所填写医生ID不存在
       else{
    	   request.setAttribute("page", "appoint.jsp");
           request.setAttribute("info", "不存在该医生！请重新预约"); 
       }	
       RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/front/result.jsp");
 	   rd.forward(request, response);
	}//最外层if
	else{                      //不符合预约条件转向消息提醒
		 request.setAttribute("page", "appoint.jsp");
		 request.setAttribute("vaccineinfolist", vaccineinfolist);
         RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/front/Noresult.jsp");
   	     rd.forward(request, response);
	}
  }
		
}
