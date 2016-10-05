package com.mywebsite.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mywebsite.Dao.RegisterDao;
import com.mywebsite.ValidationCode.CheckValidationCode;
import com.mywebsite.ValidationCode.Encrypter;
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public UserRegister() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//设置编码       
        request.setCharacterEncoding("UTF-8");
		String userName = null;	
		if(request.getParameter("login")!=null){
			response.sendRedirect("login_U.jsp");
			return;
		}
		//  下面的语句必须放在try{...}前面，否则会调用finally中的forward,
		//  在调用sendRedirect方法后，不能再调用forward方法
		try
		{
			userName = request.getParameter("username");//  获得username
			String password = request.getParameter("password");//  获得password
			String email = request.getParameter("email");//  获得email
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String mobile = request.getParameter("mobile");
			String homephone = request.getParameter("homephone");
			String birthplace = request.getParameter("birthplace");
			//  获得验证码
			String validationCode = request.getParameter("validation_code");
			// 用户名和密码不能为null
			if(userName == null || password == null || validationCode == null) return;
			// 用户名和密码必须输入
			if(userName.equals("") || password.equals("") || validationCode.equals("")) return;
			 //  在result.jsp中要跳转到login_U.jsp页
	        request.setAttribute("page", "login_U.jsp");
			//  核对验证码
			CheckValidationCode check=new CheckValidationCode();
			if(!check.checkValidationCode(request, validationCode))
			{
				request.setAttribute("page", "register.jsp");
				return;
			}				
			// 用MD5算法对密码字符串加密
			String passwordMD5 = Encrypter.md5Encrypt(password);
	        RegisterDao registerDao=new RegisterDao();
	        registerDao.adduserinfo(userName, passwordMD5, email,name,gender,mobile,homephone,birthplace);
	      
			request.setAttribute("info", "用户注册成功!");//  定义result.jsp中使用的消息
		}
		catch (Exception e)
		{
			System.out.println(e.getMessage());
			request.setAttribute("page", "register.jsp");
			request.setAttribute("info", userName + "已经被使用!");
		}
		finally
		{
			//  转发到result.jsp
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/front/result.jsp");
			rd.forward(request, response);
		}
	}

}
