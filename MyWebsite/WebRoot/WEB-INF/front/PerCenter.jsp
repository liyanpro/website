<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
     <title>用户个人中心</title>
    
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
           <img id="corp-logo" src="images/logo.png" class="logo" border="0" style="width:180px;height:58px;"></a> 
        </div>
        <div class="headerRight">
           <div class="topTag" style="width:90px;">
               <span style=" margin-left:1px;">
                  <div class="sep sep1"  style="visibility:visible;"></div>  
                  <a href="logout.jsp" >退出</a>
               </span>
               <span class="outImg"></span>
           </div>
           <div class="topTag serviceSupport" style="margin-right: 0px;width: 110px;" _mousein="0">
               <span style=" margin-left:1px;">
                   <div class="sep sep2" style="visibility:visible;"></div>
                   <a href="javaScript:void(0)" target="blank">服务支持</a>
               </span>
               <span class="bottomImg" style="transform:rotate(0deg);"></span> 
           </div>
           <div class="topTag companySummary "style="margin-right: 0px;width: 110px;">
               <span style=" margin-left:1px;">
                   <div class="sep sep3" style="visibility:visible;"></div>
                   <a href="javaScript:void(0)" target="blank">网站概括</a>
               </span>
               <span class="bottomImg" style="transform:rotate(0deg);"></span>
           </div>
           <div style="float:right; margin-right:10px;">
               <font color="#666">，欢迎！</font>
           </div>
           <div class="userNameWidth"><%=session.getAttribute("username") %> </div>  
                  
        </div>
        <script type="text/javascript">
$(function(){
			
	$(".serviceSupport").mouseover(function(){
		$('.serviceSupport').css('margin-right','-1px');
		$('.serviceSupport').css('width','111px');
		$(this).attr("_mouseIn",1);
		$(this).addClass('.headerRight companySummaryHover');
		$('.serviceSupport .bottomImg').css('transform','rotate(180deg)');
			var div = $("#faiscoService");
			div.css('left', $(".serviceSupport").offset().left - div.outerWidth() + $('.serviceSupport').outerWidth());
		div.css('top', $(".serviceSupport").offset().top + 55);
		div.show();
		$('.sep1').css('visibility','hidden');
		$('.sep2').css('visibility','hidden');
	}).mouseleave(function(){
		$('.serviceSupport').css('margin-right','0px');
		$('.serviceSupport').css('width','110px');
		$(this).attr("_mouseIn",0);
		$(this).removeClass('.headerRight companySummaryHover');
		$('.serviceSupport .bottomImg').css('transform','rotate(0deg)');
 		setTimeout(function(){
			var mouseIn = parseInt($('.serviceSupport').attr('_mouseIn'));
			if(mouseIn == 0){				
				$('#faiscoService').hide();
			}
		}, 100);
		$('.sep1').css('visibility','visible');
		$('.sep2').css('visibility','visible');
	});

	$("#faiscoService").mouseover(function(){
		$('.serviceSupport').css('margin-right','-1px');
		$('.serviceSupport').css('width','111px');
		$('.serviceSupport').attr('_mouseIn', 1);
		$(this).show();
		$('.serviceSupport').addClass('.headerRight companySummaryHover');
		$('.serviceSupport .bottomImg').css('transform','rotate(180deg)');
		$('.sep1').css('visibility','hidden');
		$('.sep2').css('visibility','hidden');
	}).mouseleave(function(){
		$('.serviceSupport').css('margin-right','0px');
		$('.serviceSupport').css('width','110px');
		$('.serviceSupport').attr('_mouseIn', 0);
		$('.serviceSupport').removeClass('.headerRight companySummaryHover');
		$('.serviceSupport .bottomImg').css('transform','rotate(0deg)');
		setTimeout(function(){
			var mouseIn = parseInt($('.serviceSupport').attr('_mouseIn'));
			if(mouseIn == 0){					
				$('#faiscoService').hide();
			}
		}, 100);
		$('.sep1').css('visibility','visible');
		$('.sep2').css('visibility','visible');
	});
});
        </script>  
     </div>
     
     <div class="companySummaryWindow" style="display:none;"></div>
     
     <div id="faiscoService" class="service" style="border-width:1px;border-style:solid;border-color:rgb(0,0,0);padding-top:0px;left:1162px;top:55px;display:none;">
        <div class="servItem servItemIcon">
           <img src="images/weibo.png"  width="20px" height="20px" style="margin-left:1px; margin-top:0px;" alt="新浪微博" height="20px" width="20px">
        </div>
		<div class="servItem" style="height:30px;line-height:20px;">
		    <a href="http://weibo.com/u/5077178531/home?wvr=5" >新浪微博</a>   
		</div>
	</div>
       <script type="text/javascript"></script>
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
   		changeUI("#appointQuery");
   		var initAppOptions = {
   			openAppId : "appointQuery"
   		};	
   		Portal.initApp2(initAppOptions);
   	   }
       function todoctorInfo(){
   		changeUI("#doctorinfoQuery");
   		var initAppOptions = {
   			openAppId : "doctorinfoQuery"
   		};	
   		Portal.initApp2(initAppOptions);
   		changeBzUI();
   	}
       function tovaccinateQuery(){
      		changeUI("#vaccinateQuery");
      		var initAppOptions = {
      			openAppId : "vaccinateQuery"
      		};	
      		Portal.initApp2(initAppOptions);
      	}
       function tofileQuery(){
     		changeUI("#filesQuery");
     		var initAppOptions = {
     			openAppId : "filesQuery"
     		};	
     		Portal.initApp2(initAppOptions);
     	}
       function toaddchildInfo(){
   		changeUI("#addchildInfo");
   		var initAppOptions = {
   			openAppId : "addchildInfo"
   		};	
   		Portal.initApp2(initAppOptions);
   	}
       
       function toaddappointInfo(){
    		changeUI("#addappointInfo");
    		var initAppOptions = {
    			openAppId : "addappointInfo"
    		};	
    		Portal.initApp2(initAppOptions);
    		changeBzUI();
    	}
       function toSelf(){
   		changeUI("#setInfo");
   		var initAppOptions = {
   			openAppId : "setInfo"
   		};	
   		Portal.initApp2(initAppOptions);
   	
   	}
       function toSetPwd(){
    	   changeUI("#setPwd");
   		var initAppOptions = {
   			openAppId : "setPwd"
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
    		{"app":"appointQuery", "btn":"appointQuery", "url": "showappoint.jsp"},	//预约查询
    		{"app":"doctorinfoQuery","btn":"doctorinfoQuery","url":"DoctorInfoQuery.jsp"},   //医生信息查询
    		{"app":"vaccinateQuery","btn":"vaccinateQuery","url":"showvaccination.jsp"},   //接种信息查询
    		{"app":"filesQuery","btn":"filesQuery","url":"showChildfile.jsp"},           //幼儿档案信息查询
    		  //幼儿信息
    		{"app":"addchildInfo","btn":"addchildInfo","url":"ChildInfoAlter.jsp"}, 
    		{"app":"addappointInfo","btn":"addappointInfo","url":"appoint.jsp"}, 
    		  //个人信息                                                              
    		{"app":"setInfo", "btn":"setInfo", "url": "UserInfoAlter.jsp"},// 修改个人资料
    		{"app":"setPwd", "btn":"setPwd", "url": "UserPwdAlter.jsp"},//修改密码
    		{}
    	];
       </script>
       
       <div id="leftContainer" class="leftContainer">
           <!-- 信息查询 -->
           <div id="QueryInfoList" class="firstTag QueryInfo" >
              <a class="leftTag" id="QueryInfo" onclick="toappointQuery();" href="javaScript:void(0);"style="color:rgb(255,255,255);">信息查询
                 <span class="rightArrow"></span>
              </a>
           </div>
           <!-- 信息查询子列表 --> 
           <ul class="QueryInfoList" style="display:none;height:auto;">
               <li class="childMenu" style="background:rgb(52,151,219) none repeat scroll 0% 0%;">
                  <a id="appointQuery" href="javaScript:void(0)" style="color:rgb(255,255,255);" onclick="ItemClick(this);">
                                                       预约查询
                  </a>
               </li>
                <li class="childMenu" style="background:rgb(52,151,219) none repeat scroll 0% 0%;">
                  <a id="doctorinfoQuery" href="javaScript:void(0)" style="color:rgb(255,255,255);" onclick="ItemClick(this);">
                                                  医生查询
                  </a> 
               </li>
               <li class="childMenu" style="background:rgb(52,151,219) none repeat scroll 0% 0%;">
                  <a id="vaccinateQuery" href="javaScript:void(0)" style="color:rgb(255,255,255);" onclick="ItemClick(this);">
                                                    接种信息查询
                  </a> 
               </li>
               <li class="childMenu" style="border-bottom: 1px solid rgb(51, 146, 214);background: rgb(52, 151, 219) none repeat scroll 0% 0%;">
                  <a id="filesQuery" href="javaScript:void(0)" style="color:rgb(255,255,255);" onclick="ItemClick(this);">
                                                    幼儿档案查询
                  </a> 
               </li>
           </ul>
           <!-- 幼儿信息 -->
           <div id="childInfoList" class="firstTag childInfo" >
              <a class="leftTag" id="childInfo" onclick="toaddchildInfo();" href="javaScript:void(0);"style="color:rgb(255,255,255);">幼儿信息
                 <span class="rightArrow"></span>
              </a>
           </div>
           <!-- 幼儿信息子列表 -->
           <ul class="childInfoList" style="display:none;height:auto;">
               <li class="childMenu" style="background:rgb(52,151,219) none repeat scroll 0% 0%;">
                  <a id="addchildInfo" href="javaScript:void(0)" style="color:rgb(255,255,255);" onclick="ItemClick(this);">
                                                   添加幼儿信息
                  </a> 
               </li>
               <li class="childMenu" style="border-bottom: 1px solid rgb(51, 146, 214);background: rgb(52, 151, 219) none repeat scroll 0% 0%;">
                  <a id="addappointInfo" href="javaScript:void(0)" style="color:rgb(255,255,255);" onclick="ItemClick(this);">
                                                    幼儿接种预约
                  </a> 
               </li>
           </ul>
             <!-- 个人信息        -->
           <div id="personInfoList" class="firstTag personInfo" >
              <a class="leftTag" id="personInfo" onclick="toSelf();" href="javaScript:void(0);"style="color:rgb(255,255,255);">个人信息
                 <span class="rightArrow"></span>
              </a>
           </div>
           <!-- 个人信息子列表 --> 
           <ul class="personInfoList" style="display:none;height:auto;">
               <li class="childMenu" style="background: rgb(237, 237, 240) none repeat scroll 0% 0%;">
                 <a id="setInfo" href="javaScript:void(0)" onclick="ItemClick(this);">修改个人资料</a>
               </li>
               <li class="childMenu" style="border-bottom: 1px solid rgb(51, 146, 214);background: rgb(52, 151, 219) none repeat scroll 0% 0%;">
                 <a id="setPwd" href="javaScript:void(0)" onclick="ItemClick(this);">修改密码</a>
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
