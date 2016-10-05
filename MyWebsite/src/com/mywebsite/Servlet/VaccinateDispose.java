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

import com.mywebsite.Dao.LoginDao;
import com.mywebsite.Service.QueryInfoService;
import com.mywebsite.bean.ChildVaccinateInfo;
/*
 * 医生对幼儿的疫苗接种处理
 */
@WebServlet("/VaccinateDispose")
public class VaccinateDispose extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public VaccinateDispose() {
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
	       Date appointtime=(Date)session.getAttribute("appointtime");//预约时间
	      //根据幼儿身份证号查询用户账号
	       LoginDao loginDao=new LoginDao();
	       String username=loginDao.Queryusername(idnum);
	       if(username!=null){
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
	     //页面跳转
	       RequestDispatcher rd = request.getRequestDispatcher("vaccine.jsp");
		   rd.forward(request, response);
	      }
	      else{
	    	  request.setAttribute("info", "数据库中无此幼儿信息，请核对后查询！");
	    	  request.setAttribute("page", "vaccinedispose.jsp");
	    	  RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/front/result.jsp");
			  rd.forward(request, response);
	      }
	       
	}
	      
	

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

}
