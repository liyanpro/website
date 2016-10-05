package com.mywebsite.Servlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.mywebsite.Dao.LoginDao;
import com.mywebsite.ValidationCode.CheckValidationCode;
import com.mywebsite.ValidationCode.Encrypter;
import com.mywebsite.bean.UserInfo;

import java.io.IOException;
@WebServlet("/UserLogin")
/**
 * 
 * 用户登录控制
 *
 */
public class UserLogin extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//  如果存在register请求参数，重定向到register.jsp页面
		//设置编码       
        request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		session.setMaxInactiveInterval(1800);//设置session的会话有效时间
		//String JSESSIONID=session.getId();
		//Cookie cookie = new Cookie("JSESSIONID",JSESSIONID);
		//cookie.setMaxAge(-1);
		String page = "login_U.jsp";
		String userName = "";
		try
		{	
			userName = request.getParameter("username");		
			String password = request.getParameter("password");
			String validationCode = request.getParameter("validation_code");
			if (userName == null || password == null || validationCode == null)
				return;
			if (userName.equals("") || password.equals("") || validationCode.equals(""))
				return;
			CheckValidationCode check=new CheckValidationCode();
			// 核对验证码
			if(!check.checkValidationCode(request, validationCode))
			{
				return;
			}	 	
			//数据库查询操作
			LoginDao userLoginDao=new LoginDao();
			UserInfo UserName=userLoginDao.Queryuserinfo(userName);
			// 查询登录用户是否存在
			if (UserName==null)
			{
				//  设置用于在login_U.jsp中显示的用户名错误信息
				request.setAttribute("userError", userName + "不存在");
			}
			else
			{
				//  得到登录用户的MD5加密字符串
				String passwordMD5 = Encrypter.md5Encrypt(password);
				if(!UserName.getPassword().equals(passwordMD5))
				{
				//  设置用于在login_U.jsp中显示的密码错误信息
					request.setAttribute("passwordError", "密码错误！");
				}
				else
				{
					//  登录成功，设置要转发的页面
					page = "/WEB-INF/front/PerCenter.jsp";
					session.setAttribute("username",userName );
				}
			}

		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		finally		
		{
			// 将用户名保存在request中
			request.setAttribute("username", userName);			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);//  转发相应的页面（默认是login.jsp）
		}
	}
}
