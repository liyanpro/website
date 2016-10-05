package com.mywebsite.Servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mywebsite.Dao.ChildVaccinateInfoDao;
@WebServlet("/ExceptionInfo")
public class ExceptionInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ExceptionInfo() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//  如果存在register请求参数，重定向到register.jsp页面
		//设置编码       
        request.setCharacterEncoding("UTF-8");
        String childname=request.getParameter("childname");//幼儿姓名
        String idnum=request.getParameter("idnum");//幼儿身份证号
        String vaccine=request.getParameter("vaccine");//疫苗名称
        String factory=request.getParameter("factory");//生产厂家
        String vaccinenum=request.getParameter("vaccinenum");//疫苗批号
        String Indate=request.getParameter("indate");//有效期
        String Vaccinatetime=request.getParameter("vaccinatetime");//接种日期
        String Reaction=request.getParameter("reaction");//反应日期
        String symptom=request.getParameter("symptom");//反应症状
        //日期格式转换
        Date indate=Date.valueOf(Indate);
        Date vaccinatetime=Date.valueOf(Vaccinatetime);
        Date reaction=Date.valueOf(Reaction);
        ChildVaccinateInfoDao exceptioninfodao=new ChildVaccinateInfoDao();
        exceptioninfodao.insertExceptionInfo(childname, idnum, vaccine,factory,vaccinenum, indate, vaccinatetime, reaction, symptom);
        request.setAttribute("info", "添加成功！");
        request.setAttribute("page", "exceptioninfo.jsp");
        RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/front/result.jsp");
		rd.forward(request, response);
	}

}
