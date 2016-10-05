package com.mywebsite.Servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mywebsite.Dao.ChildAppointInfoDao;
import com.mywebsite.Dao.LoginDao;
import com.mywebsite.Service.QueryInfoService;
import com.mywebsite.bean.ChildVaccinateInfo;
@WebServlet("/VaccinateInfo")
/*
 * 疫苗接种信息控制
 */
public class VaccinateInfo extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public VaccinateInfo() {
		super();
	}
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		 //设置编码       
	       request.setCharacterEncoding("UTF-8");
	       HttpSession session=request.getSession();
	       String idnum=request.getParameter("idnum");//幼儿身份证号
	       String dusername=(String)session.getAttribute("dusername");//医生职工号
	       String Appointtime=request.getParameter("appointtime");//预约时间
	       //日期格式转换
	       Date appointtime=Date.valueOf(Appointtime);
	      //根据幼儿身份证号删除用户预约信息
	       ChildAppointInfoDao childAppointInfoDao=new ChildAppointInfoDao();
	       childAppointInfoDao.Deleteappointinfo(idnum);
	       //根据幼儿身份证号查询用户账号
	       LoginDao loginDao=new LoginDao();
	       String username=loginDao.Queryusername(idnum);
	       //根据幼儿身份证号查询幼儿出生日期
	       QueryInfoService queryInfo=new QueryInfoService();
	       Date Age=queryInfo.queryChildBirth(idnum);
	       //计算幼儿目前年（月）龄
	        Date date=new Date(System.currentTimeMillis());
	      int age=(int) (date.getTime()/86400000-Age.getTime()/86400000);
            //获取月数差，即为幼儿月龄
      	    age=age/30;
	      //将相关信息保存在疫苗接种封装类中
	       ChildVaccinateInfo childVaccinateInfo=new ChildVaccinateInfo();
	       childVaccinateInfo.setIdnum(idnum);
	       childVaccinateInfo.setDusername(dusername);
	       childVaccinateInfo.setUsername(username);
	       childVaccinateInfo.setAppointtime(appointtime);
	       childVaccinateInfo.setAge(age);
	       //将信息存储在session中
	       session.setAttribute("childVaccinateInfo", childVaccinateInfo);
	       session.setAttribute("age", age);
	       session.setAttribute("idnum", idnum);
	       //页面跳转
	       RequestDispatcher rd = request.getRequestDispatcher("vaccine.jsp");
		   rd.forward(request, response);
		
	}
	
	
	
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

}
