package com.mywebsite.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mywebsite.Service.DocInfoService;

@WebServlet("/QueryDocInfo")
public class QueryDocInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public QueryDocInfo() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String dusername=request.getParameter("dusername");
		String drelname=request.getParameter("drelname");
		DocInfoService docInfoService=new DocInfoService();
		request.setAttribute("DocInfolist",docInfoService.queryDocInfo(dusername, drelname));
		request.getRequestDispatcher("/WEB-INF/back/DocManage.jsp").forward(request, response);
	}

}
