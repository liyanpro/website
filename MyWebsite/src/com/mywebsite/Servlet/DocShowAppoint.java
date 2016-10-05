package com.mywebsite.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mywebsite.Dao.LoginDao;
import com.mywebsite.Service.QueryInfoService;

import com.mywebsite.bean.DocAppointView;
import com.mywebsite.bean.DocInfo;
@WebServlet("/DocShowAppoint")
/*
 * 目标医生名下所有的用户预约信息控制
 */
public class DocShowAppoint extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public DocShowAppoint() {
		super();
	}
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//获取session对象
		 HttpSession session=request.getSession();
		//获取页面参数
	       String Dname=request.getParameter("dusername");
	       LoginDao docLoginDao=new LoginDao();
	       DocInfo docinfo=docLoginDao.Querydocinfo(Dname);
	    //所查询医生存在
	    if(docinfo!=null){
	      //将医生的真实姓名保存在session中   
	        session.setAttribute("drelname", docinfo.getdrelname());
	      //调用Dao层进行医生预约记录数据查询
		     QueryInfoService queryInfoService= new QueryInfoService();
		     List<DocAppointView> DocAppointInfoList=queryInfoService.querydocAppointinfo(Dname);
	      //查询结果保存在request域中
	       if(DocAppointInfoList!=null&&DocAppointInfoList.size()>0)
	       {
         	  request.setAttribute("DocAppointInfoList", DocAppointInfoList);	
         	//请求转发
   	       RequestDispatcher rd=request.getRequestDispatcher("showdocappoint.jsp");
   		   rd.forward(request, response);
	       }
	       else    
               request.setAttribute("info", docinfo.getdrelname()+"医生还没有预约！");      
	    }
	       request.setAttribute("page", "DoctorInfoQuery.jsp");
	       //请求转发
	       RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/front/result.jsp");
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
