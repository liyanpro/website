package com.mywebsite.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import com.mywebsite.Service.QueryInfoService;
import com.mywebsite.bean.ChildInfo;
import com.mywebsite.bean.VaccineView;
@WebServlet("/ChildShowVaccination")
public class ChildShowVaccination extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ChildShowVaccination() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//…Ë÷√±‡¬Î       
	       request.setCharacterEncoding("UTF-8");
		   String idnum=request.getParameter("idnum");
		   QueryInfoService queryInfoService=new QueryInfoService();
		   ChildInfo childinfo=queryInfoService.queryChildInfo(idnum);
		   List<VaccineView> vaccineinfolist=queryInfoService.queryVaccineinfo(idnum);
		   request.setAttribute("vaccineinfolist", vaccineinfolist);
		   request.setAttribute("childinfo", childinfo);
		   RequestDispatcher rd = request.getRequestDispatcher("showTwovaccination.jsp");
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
