package com.mywebsite.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mywebsite.Dao.LoginDao;
/*
 * 后台管理控制
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public AdminLogin() {
		super();
	}
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//  如果存在register请求参数，重定向到register.jsp页面
		//设置编码       
        request.setCharacterEncoding("UTF-8");
        String adname=request.getParameter("adname");
        String adpassword=request.getParameter("adpassword");
        LoginDao adminLoginDao=new LoginDao();
		String password=adminLoginDao.QueryPassword(adname);
		if(!adpassword.equals(password)){
			request.setAttribute("passwordError","账号或密码错误");
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("QueryDocInfo");
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
