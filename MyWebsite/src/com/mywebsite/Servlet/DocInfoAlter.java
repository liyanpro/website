package com.mywebsite.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mywebsite.Dao.UserInfoAlterDao;
@WebServlet("/DocInfoAlter")
/*
 * 医生个人信息修改控制
 */
public class DocInfoAlter extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public DocInfoAlter() {
		super();
	}
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
			{
		//设置编码       
        request.setCharacterEncoding("UTF-8");
		       HttpSession session=request.getSession();
		       //从页面获取相关属性
		       String drelname=request.getParameter("drelname");
		       String dgender=request.getParameter("gdender");
		       String dmobile=request.getParameter("dmobile");
		       String major=request.getParameter("major");
		       //从session中获取用户名
		       String dusername=(String)session.getAttribute("dusername");		       
		       request.setAttribute("page", "DocInfoAlter.jsp");
		       UserInfoAlterDao docInfoAlter=new UserInfoAlterDao();
		       docInfoAlter.docinfoalter(dusername, drelname, dgender,dmobile,major);
		       request.setAttribute("info", "您的信息保存成功!");//  定义result.jsp中使用的消息
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
