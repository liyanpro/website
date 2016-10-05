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

import com.mywebsite.Dao.ChildInfoAlterDao;
@WebServlet("/ChildInfoAlter")
/**
 * 
 * 幼儿基本信息添加控制
 *
 */
public class ChildInfoAlter extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ChildInfoAlter() {
		super();
	}
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
			{
		      //设置编码       
		        request.setCharacterEncoding("UTF-8");
	           	HttpSession session=request.getSession();      
		      //获取页面的参数
	           String childname = request.getParameter("childname");
	           String childgender = request.getParameter("childgender");
	           String birth = request.getParameter("childbirth");
	           String idnum = request.getParameter("idnum");
	           String username=(String)session.getAttribute("username");
	           //日期格式转换
			   Date childbirth=Date.valueOf(birth);
	           //调用ChildInfoAlterDao对象进行数据处理
	           ChildInfoAlterDao childinfoalterdao=new ChildInfoAlterDao();
			   childinfoalterdao.childinfoalter(childname, childgender,childbirth, idnum,username);
	           request.setAttribute("page", "ChildInfoAlter.jsp");
	           request.setAttribute("info", "幼儿信息保存成功!");//  定义result.jsp中使用的消息
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
