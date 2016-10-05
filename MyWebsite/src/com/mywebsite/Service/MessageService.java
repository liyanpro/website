package com.mywebsite.Service;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
public class MessageService {

	public void MessageInform(String mobile) throws Exception{
		
		 HttpClient client = new HttpClient();  
	     PostMethod post = new PostMethod("http://utf8.sms.webchinese.cn");  
	     // 在http头文件中设置转码  
	     post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf8");          
	     // 注册的用户名 
	     NameValuePair[] data = { new NameValuePair("Uid", "短信_childname"), 
	     // 注册成功后,登录网站使用的密钥 
	     new NameValuePair("Key", "2ae64c240cae4943b5bc"),  
	     // 手机号码 
	     new NameValuePair("smsMob", mobile),  
	     //设置短信内容
	     new NameValuePair("smsText", "您的孩子近段时间有未接种的疫苗，请前往就近社区医院进行疫苗接种！") }; 
	     post.setRequestBody(data);  
	     client.executeMethod(post);  
	     Header[] headers = post.getResponseHeaders();  
	     int statusCode = post.getStatusCode();  
	     System.out.println("statusCode:" + statusCode);  
	     for (Header h : headers) {  
	         System.out.println(h.toString());  
	     }  
	     String result = new String(post.getResponseBodyAsString().getBytes("utf8")); 
	               
	     System.out.println(result);  //打印返回消息状态
	     post.releaseConnection();  
	}
}
