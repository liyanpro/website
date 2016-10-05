package com.mywebsite.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mywebsite.Dao.LoginDao;
import com.mywebsite.Service.QueryInfoService;
import com.mywebsite.ValidationCode.Encrypter;
import com.mywebsite.bean.DocInfo;

/**
 * 
 * 社区医生登录控制
 *
 */
@WebServlet("/DocLogin")
public class DocLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		    
        request.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession();
        session.setMaxInactiveInterval(1800);//设置session的会话有效时间
		String page = "login_D.jsp";
		String DName = "";
		try
		{			
			DName = request.getParameter("dusername");		
			String Dpassword = request.getParameter("dpassword");
			if (DName == null || Dpassword == null )
				return;
			if (DName.equals("") || Dpassword.equals(""))
				return;
			//数据库操作
			LoginDao docLoginDao=new LoginDao();
			String DpasswordMD5=Encrypter.md5Encrypt(Dpassword);
			//返回查询信息到docinfo对象中
			DocInfo docinfo=docLoginDao.Querydocinfo(DName);
			if (docinfo==null)
			{
				//  设置用于在login_D.jsp中显示的用户名错误信息
				request.setAttribute("userError",  DName+ "不存在");
			}
			else
			{
				if(!docinfo.getDpassword().equals(DpasswordMD5))
			      //  设置用于在login.jsp中显示的密码错误信息
				  request.setAttribute("passwordError", "密码不正确");
			    else
			    {
			     QueryInfoService  queryInfoService	= new QueryInfoService();
			     DocInfo docInfo=queryInfoService.querydocID(DName);
			     session.setAttribute("drelname", docInfo.getdrelname());
			     session.setAttribute("dusername", DName);
				 page = "/WEB-INF/front/DocCenter.jsp";
			    }
			}
		}
		catch (Exception e)
		{
			
		}
		finally		
		{
			// 将用户名保存在request中
			request.setAttribute("dusername", DName);			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response); //转发相应的页面（默认是login_D.jsp）
		}
	}
}
