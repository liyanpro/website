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

import com.mywebsite.Service.QueryInfoService;
import com.mywebsite.bean.VaccineView;
import com.mywebsite.bean.ExceptionInfo;
@WebServlet("/DocQueryVaccination")
public class DocQueryVaccination extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public DocQueryVaccination() {
		super();
	}
	
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//设置编码       
	       request.setCharacterEncoding("UTF-8");
	       HttpSession session=request.getSession();	   
		   String idnum=request.getParameter("idnum");
		   QueryInfoService queryInfoService=new QueryInfoService();
		   List<VaccineView> vaccineinfolist=queryInfoService.queryVaccineinfo(idnum);
		   List<ExceptionInfo> exceptionlist=queryInfoService.queryExceptionInfo(idnum);
		   Date date=new Date(System.currentTimeMillis()); //获取系统时间
		   session.setAttribute("appointtime", date);
		   session.setAttribute("idnum", idnum);
		   request.setAttribute("vaccineinfolist", vaccineinfolist);
		   request.setAttribute("exceptionlist", exceptionlist);
		   RequestDispatcher rd = request.getRequestDispatcher("vaccinedispose.jsp");
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
