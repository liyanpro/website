<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
     <title>医生个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/master.css"/>
    <link rel="stylesheet" type="text/css" href="css/frame.css"/>
     <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
     <script type="text/javascript" src="js/jquery-ui-core.min.js"></script>
     <script type="text/javascript" src="js/Portal.min.js"></script>
     <script type="text/javascript" src="js/fai.min.js"></script>
  <!-- <script type="text/javascript" src="js/faiui.min.js"></script> -->
  
     <style>
     html { overflow:hidden; }
     body { font-family: "微软雅黑";}
	.sep {float: left;width: 1px;height: 10px;min-height:10px;background:#c5c5c5;margin-top:23px;} 
     </style>
  </head>
  
  <body>
    <!-- body class="indexBody"  开始-->
     <div id="header">
        <div style="float:left;height:58px;">
           <img id="corp-logo" src="images/logo_doc.png" class="logo" border="0" style="width:180px;height:58px;"></a> 
        </div>
        <div class="headerRight">
           <div class="topTag" style="width:90px;">
               <span style=" margin-left:1px;">
                  <div class="sep sep1"  style="visibility:visible;"></div>  
                  <a href="logout.jsp" >退出</a>
               </span>
               <span class="outImg"></span>
           </div>
           <div style="float:right; margin-right:10px;">
               <font color="#666">，欢迎！</font>
           </div>
           <div class="userNameWidth"><%=session.getAttribute("drelname") %>医生</div>  
        </div> 
     </div>
     <div class="indexContainer">
       <script type="text/javascript" src="js/util.min.js"></script>
       <script type="text/javascript" language="javascript">
     
       function ItemClick(e)
       {
       	var id = $(e).attr("id");
     	changeUI(e);
       	var options = {
       		openAppId : id
       	};
       	Portal.openApp2(options);
       }
       function changeUI(e){
    		$('.childMenu').css('background','#3497db');
    		$(e).parent().css('background','#ededf0');
    		$('.leftContainer a').css('color','#fff');
    		$(e).css('color','#3497db');
    		var className = $(e).parent().parent().attr("class");
    		$('.rightArrow').removeClass('rotate90');
    		$('#'+ className +' .rightArrow').addClass('rotate90');
    		$('.'+ className).slideDown().siblings('ul').slideUp();

    	}
       function toappointQuery(){
   		changeUI("#AppointQuery");
   		var initAppOptions = {
   			openAppId : "AppointQuery"
   		};	
   		Portal.initApp2(initAppOptions);
   	   }
       function tonoappointQuery(){
   		changeUI("#NoAppointQuery");
   		var initAppOptions = {
   			openAppId : "NoAppointQuery"
   		};	
   		Portal.initApp2(initAppOptions);
   	}
       function toVaccineInfo(){
    	 changeUI("#VaccineInfo");
      	var initAppOptions = {
      	   openAppId : "VaccineInfo"	
      	};	
      	Portal.initApp2(initAppOptions);
    	}
       function toExceptionInfo(){
    	   changeUI("#ExceptionInfo");
         	var initAppOptions = {
         	   openAppId : "ExceptionInfo"	
         	};	
         	Portal.initApp2(initAppOptions);
       }
       function toSelf(){
   		changeUI("#ShowInfo");
   		var initAppOptions = {
   			openAppId : "ShowInfo"
   		};	
   		Portal.initApp2(initAppOptions);
   	
   	}
       function toSetPwd(){
    	   changeUI("#SetPwd");
   		var initAppOptions = {
   			openAppId : "SetPwd"
   		};	
   		Portal.initApp2(initAppOptions);
    	}
       $(function(){
    		var initAppOptions = {
    			openAppId : ""
    		};	
    		Portal.initApp2(initAppOptions);
    	});

    	// mapping app - button - url
    	Portal.mappingApp = [
    	      //信息查询
    		{"app":"AppointQuery","btn":"AppointQuery","url":"docappointinfo.jsp"},   //预约信息查询
    		{"app":"NoAppointQuery","btn":"NoAppointQuery","url":"InformVaccination.jsp"}, //未接种幼儿信息查询
    		  //幼儿接种处理
    		{"app":"VaccineInfo","btn":"VaccineInfo","url":"vaccinedispose.jsp"}, //疫苗接种
    		{"app":"ExceptionInfo","btn":"ExceptionInfo","url":"exceptioninfo.jsp"}, //疫苗接种
    		  //个人信息                                                              
    		{"app":"ShowInfo", "btn":"ShowInfo", "url": "DocInfoAlter.jsp"},// 查看个人资料
    		{"app":"SetPwd", "btn":"SetPwd", "url": "DocPwdAlter.jsp"},	// 修改密码
 
    		{}
    	];	
       </script> 
       <div id="leftContainer" class="leftContainer">
           <!-- 信息查询 -->
           <div id="QueryInfoList" class="firstTag QueryInfo" >
              <a class="leftTag" id="QueryInfo" onclick="toappointQuery();" href="javaScript:void(0);"style="color:rgb(255,255,255);">
                                         信息查询
                 <span class="rightArrow"></span>
              </a>
           </div>
           <!-- 信息查询子列表 --> 
           <ul class="QueryInfoList" style="display:none;height:auto;">
               <li class="childMenu" style="background:rgb(52,151,219) none repeat scroll 0% 0%;">
                  <a id="AppointQuery" href="javaScript:void(0)" style="color:rgb(255,255,255);" onclick="ItemClick(this);">
                                                       预约查询
                  </a>
               </li>
                <li class="childMenu" style="background:rgb(52,151,219) none repeat scroll 0% 0%;">
                  <a id="NoAppointQuery" href="javaScript:void(0)" style="color:rgb(255,255,255);" onclick="ItemClick(this);">
                                                 未接种幼儿查询
                  </a> 
               </li>
           </ul>
           <!-- 幼儿接种 -->
           <div id="childvaccinaelist" class="firstTag childInfo" >
              <a class="leftTag" id="childInfo" onclick="toVaccineInfo();" href="javaScript:void(0);"style="color:rgb(255,255,255);">
                                              幼儿疫苗接种
                 <span class="rightArrow"></span>
              </a>
           </div>
           <!-- 幼儿接种处理子列表 -->
           <ul class="childvaccinaelist" style="display:none;height:auto;">
               <li class="childMenu" style="background:rgb(52,151,219) none repeat scroll 0% 0%;">
                  <a id="VaccineInfo" href="javaScript:void(0)" style="color:rgb(255,255,255);" onclick="ItemClick(this);">
                                                     幼儿接种处理 
                  </a>
               </li>
               <!-- 异常反应记录 -->
               <li class="childMenu" style="background:rgb(52,151,219) none repeat scroll 0% 0%;">
                  <a id="ExceptionInfo" href="javaScript:void(0)" style="color:rgb(255,255,255);" onclick="ItemClick(this);">
                                                     异常反应记录 
                  </a>
               </li>
           </ul> 
             <!-- 个人信息       -->
           <div id="personInfoList" class="firstTag personInfo" >
              <a class="leftTag" id="personInfo" onclick="toSelf();" href="javaScript:void(0);"style="color:rgb(255,255,255);">个人信息
                 <span class="rightArrow"></span>
              </a>
           </div>
           <!-- 个人信息子列表 --> 
           <ul class="personInfoList" style="display:none;height:auto;">
               <li class="childMenu" style="background: rgb(237, 237, 240) none repeat scroll 0% 0%;">
                 <a id="ShowInfo" href="javaScript:void(0)" onclick="ItemClick(this);">
                                                 查看个人资料
                 </a>
               </li>
               <li class="childMenu" style="border-bottom: 1px solid rgb(51, 146, 214);background: rgb(52, 151, 219) none repeat scroll 0% 0%;">
                 <a id="SetPwd" href="javaScript:void(0)" onclick="ItemClick(this);">
                                                 修改密码
                 </a>
               </li>
               
           </ul>
           
       </div>
       <table cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td valign="top" style="width:100%;height:100%;">
                 <iframe id="mainFrame" name="mainFrame" src="index.html" frameborder="0" scrolling="auto" >        
                 </iframe>
              </td>
            
            </tr>
          </tbody> 
       </table>
     </div>
  </body>
</html>
