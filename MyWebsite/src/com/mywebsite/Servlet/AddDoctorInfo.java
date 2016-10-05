package com.mywebsite.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mywebsite.Dao.DisposeDoctorInfoDao;
import com.mywebsite.ValidationCode.Encrypter;
@WebServlet("/AddDoctorInfo")
public class AddDoctorInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public AddDoctorInfo() {
		super();
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		 String username=request.getParameter("username");
		 String password=request.getParameter("password");
		 String relname=request.getParameter("relname");
		 String dgender=request.getParameter("dgender");
		 String dmobile=request.getParameter("dmobile");
		 String major=request.getParameter("major");
		 String passwordMD5="";
		 //进行MD5加密
		 try {
		  passwordMD5=Encrypter.md5Encrypt(password);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		 if(username!=null&&!"".equals(username)){
			 DisposeDoctorInfoDao addDoctorInfoDao=new DisposeDoctorInfoDao();
			 
			 addDoctorInfoDao.AddDoctorinfo(username, passwordMD5, relname, dgender, dmobile, major); 
			 request.getRequestDispatcher("QueryDocInfo").forward(request, response);
		 }   
		 else	
		   request.getRequestDispatcher("/WEB-INF/back/AddDoctor.jsp").forward(request, response);
	}


}
