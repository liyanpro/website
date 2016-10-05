package com.mywebsite.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mywebsite.Service.DocInfoService;
@WebServlet("/AlterDoctorInfo")
public class AlterDoctorInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public AlterDoctorInfo() {
		super();
	}
	static boolean flag=true;
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		 String username=request.getParameter("username");
		 String dmobile=request.getParameter("dmobile");
		 String major=request.getParameter("major");
		 if(!flag){
			 DocInfoService docInfoService=new DocInfoService();
			 docInfoService.alterDocInfo(username, dmobile, major);
			 flag=true;
			 request.getRequestDispatcher("QueryDocInfo").forward(request, response);
		 }
		 else{
			 request.setAttribute("username", username);
		     flag=false;
		     request.getRequestDispatcher("/WEB-INF/back/AlterDoctor.jsp").forward(request, response);
		 }
	}


}
