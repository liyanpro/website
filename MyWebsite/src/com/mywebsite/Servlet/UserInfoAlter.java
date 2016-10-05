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
@WebServlet("/UserInfoAlter")
public class UserInfoAlter extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public UserInfoAlter() {
		super();
	}
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
			{
		//设置编码       
        request.setCharacterEncoding("UTF-8");
		       HttpSession session=request.getSession();
		       //从页面获取相关属性
		       String name=request.getParameter("name");
		       String gender=request.getParameter("gender");
		       String mobile=request.getParameter("mobile");
		       String birthplace=request.getParameter("birthplace");
		       String homephone=request.getParameter("homephone");
		       String email=request.getParameter("email");
		       //从session中获取用户名
		       String username=(String)session.getAttribute("username");		       
		       request.setAttribute("page", "UserInfoAlter.jsp");
		       UserInfoAlterDao userInfoAlter=new UserInfoAlterDao();
		       userInfoAlter.userinfoalter(username, name, gender, mobile, birthplace, homephone, email);
		       request.setAttribute("info", "用户信息保存成功!");//  定义result.jsp中使用的消息
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
