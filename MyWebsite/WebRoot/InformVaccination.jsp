<%@ page language="java" import="com.mywebsite.bean.VaccineView,com.mywebsite.Service.QueryInfoService,java.util.List,java.sql.Date,com.mywebsite.Dao.LoginDao"
 pageEncoding="UTF-8"%>
<%@ page import="com.mywebsite.bean.InformVaccine,com.mywebsite.bean.ChildInfo,com.mywebsite.bean.UserInfo,com.mywebsite.bean.VaccinateProdedure,java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>未接种幼儿通知</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css" href="css/master.css"/>
     <link rel="stylesheet" type="text/css" href="css/frame.css"/>   
  </head>
  <body class="frameBody">

  <div class="tableContainer">	
	<div id="mainContent" style="width:100%; height:100%; background:#fff none repeat scroll 0% 0%; " class="tablePanel"> 
		<div class="navInfo"><span  style="background:url(images/test.png) -300px -80px no-repeat; width:57px; height:57px; float:left; "></span>
		 <div class="navInfoDiv"><span>未接种幼儿通知</span></div></div>
		<div class="clearfloat"></div>
		 <% 
		       String dname=(String)session.getAttribute("dusername");
		       String idnum="";
		       ArrayList informVaccine=new ArrayList(10);//未接种幼儿信息集合
               QueryInfoService queryInfo=new QueryInfoService();
               LoginDao userLoginDao=new LoginDao();   //用户信息对象
               List<VaccineView> childidnumlist=queryInfo.queryChildidnum(dname,idnum);
               List<VaccinateProdedure> vaccineinfolist=new ArrayList<VaccinateProdedure>();
                  dname="";
               for(int i=0;i<childidnumlist.size();i++){
            	   boolean flag=true;
            	   //根据身份证号查询出该幼儿所有的接种信息
            	   List<VaccineView> ChildAllVacList=queryInfo.queryChildidnum(dname,childidnumlist.get(i).getIdnum()); 
            	 //幼儿最近时间的接种信息
            	   List<VaccineView> childVaclist=queryInfo.QueryVaccineinfo(childidnumlist.get(i).getIdnum(),ChildAllVacList.get(0).getAge());
            	 //根据身份证号查询幼儿出生日期并计算当前幼儿年龄
            	   Date Age=queryInfo.queryChildBirth(childidnumlist.get(i).getIdnum());
            	 //获取当前系统时间 
                	Date date=new Date(System.currentTimeMillis());
                 //获取两个日期之间的天数差
             	    int age=(int) (date.getTime()/86400000-Age.getTime()/86400000);
             	 //以30天为一月计算幼儿月龄
             	    age=age/30;
             	   vaccineinfolist=queryInfo.QueryVaccine(age);//查询幼儿在该年龄段应该接种的疫苗
                   if(age==ChildAllVacList.get(0).getAge()){ //如果幼儿最近的接种年龄和目前年龄相同
                	   if(childVaclist.size()==1){
                		   //应该接种的疫苗信息与最近时段接种的疫苗信息进行对比
                		   if(!(vaccineinfolist.get(0).getVaccine().equals(childVaclist.get(0).getVaccine())&&vaccineinfolist.get(0).getVaccinetimes().equals(childVaclist.get(0).getVaccinetimes())))
                			   flag=false;
                	   }
                	 }
                   else{
                	   if(childVaclist.size()==1){
                		   if(!(vaccineinfolist.get(0).getVaccine().equals(childVaclist.get(0).getVaccine())&&vaccineinfolist.get(0).getVaccinetimes().equals(childVaclist.get(0).getVaccinetimes())))
                			   flag=false;    
                	   }
                	   else{
                		   if(!(vaccineinfolist.get(0).getVaccine().equals(childVaclist.get(0).getVaccine())&&vaccineinfolist.get(0).getVaccinetimes().equals(childVaclist.get(0).getVaccinetimes()))){
                			   if(!(vaccineinfolist.get(0).getVaccine().equals(childVaclist.get(1).getVaccine())&&vaccineinfolist.get(0).getVaccinetimes().equals(childVaclist.get(1).getVaccinetimes())))
                				   flag=false;
                		   }  
                	   }
                   }
                  if(flag==false){//近段时间该幼儿有未接种的疫苗
                	  ChildInfo childinfo=queryInfo.queryChildInfo(childidnumlist.get(i).getIdnum());
                	  InformVaccine informvaccine=new InformVaccine();  
                	  informvaccine.setChildname(childinfo.getChildname());//保存幼儿姓名
                	  informvaccine.setIdnum(childinfo.getIdnum());//幼儿身份证
          			  UserInfo userInfo=userLoginDao.Queryuserinfo(childinfo.getUsername());//用户信息
          			  informvaccine.setName(userInfo.getName());//保存家长姓名
          			  informvaccine.setMobile(userInfo.getMobile());//家长联系方式
          			  informVaccine.add(informVaccine.size(), informvaccine); //将该幼儿及家长信息添加到informVaccine集合当中
          			  request.setAttribute("informVaccine", informVaccine);
                  }
                	  
               }//一次for循环结束，判断出接种过的幼儿其中一个是否现在需要接种
         %>
		<div class="editPanel" style="padding-top:7px;">
            
             <table class="tab" width="80%" align="center" style="font-size:19px;font-family:'楷体';">
                <tr>
                   <th>幼儿姓名</th>
                   <th>身份证号</th>
                   <th>家长姓名</th>
                   <th>联系电话</th>
                   <th>通知接种</th>
                   <th></th>
                </tr>
                <c:forEach items="${informVaccine}" var="informVaccine" varStatus="status">
                 <tr align="center" <c:if test="${status.index % 2 != 0}">style='background-color:#ECF6EE;'</c:if>>
                   <td>${informVaccine.childname}</td>
                   <td>${informVaccine.idnum}</td>
                   <td>${informVaccine.name}</td>
                   <td>${informVaccine.mobile}</td>
                    <td><a href="${basePath}MessageInfo?mobile=${informVaccine.mobile}" style="color:red;font-family:Cursive;" title="点击发送通知短信">点击发送</a></td>
                 </tr>
                </c:forEach>
             </table>
		</div>
	<div class="clearfloat"></div>
    <div style="height:40px;"></div>	
  </div>
</div>	
</body>
</html>
