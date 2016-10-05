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

import com.mywebsite.Dao.ChildVaccinateInfoDao;
import com.mywebsite.bean.ChildVaccinateInfo;
@WebServlet("/UpdateVaccineInfo")
/*
 * 疫苗接种信息添加
 */
public class UpdateVaccineInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	/**
	 * Constructor of the object.
	 */
	public UpdateVaccineInfo() {
		super();
	}
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//设置编码       
	    request.setCharacterEncoding("UTF-8");
	    HttpSession session=request.getSession();
	    //接收页面参数
		String vaccine=request.getParameter("vaccine");//疫苗名称
		String vaccinetimes=request.getParameter("vaccinetimes");//接种次数
		String vaccineTime=request.getParameter("vaccinetime");//接种时间
	    //日期格式转换
	    Date vaccinetime=Date.valueOf(vaccineTime);
	    String vaccinenum=request.getParameter("vaccinenum");//疫苗批号
	    ChildVaccinateInfo childVaccinateInfo=new ChildVaccinateInfo();
	    childVaccinateInfo=(ChildVaccinateInfo)session.getAttribute("childVaccinateInfo");
	    
	    String username=childVaccinateInfo.getUsername();//用户账号
	    String dusername=childVaccinateInfo.getDusername();//医生职工号
	    String idnum=childVaccinateInfo.getIdnum();//幼儿身份证号
	    int age=childVaccinateInfo.getAge();
	    Date appointtime=childVaccinateInfo.getAppointtime();//预约时间
	    //向数据库中插入疫苗接种信息
	     ChildVaccinateInfoDao childVaccinateInfoDao=new ChildVaccinateInfoDao();
	     childVaccinateInfoDao.InsertVaccineInfo(vaccine,vaccinetimes,appointtime,vaccinetime,vaccinenum,idnum,username,dusername,age);
	    //消息提示，页面跳转
	    request.setAttribute("page", "vaccineinfo.jsp");
        request.setAttribute("info", "添加成功!");
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/front/result.jsp");
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
