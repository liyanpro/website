package com.mywebsite.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mywebsite.Service.DocInfoService;

@WebServlet("/DeleteDocInfo")
public class DeleteDocInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public DeleteDocInfo() {
		super();
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	
		String username=request.getParameter("username");
		DocInfoService docInfoService=new DocInfoService();
		docInfoService.deleteDocInfo(username);
		request.getRequestDispatcher("QueryDocInfo").forward(request, response);
	}


}
