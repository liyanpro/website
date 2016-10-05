package com.mywebsite.ValidationCode;

import javax.servlet.http.HttpServletRequest;

public class CheckValidationCode {
	public boolean checkValidationCode(HttpServletRequest request, String validationCode)
	{
		//  从HttpSession对象中获得系统随机生成的验证码
		String validationCodeSession = (String)request.getSession().getAttribute("validation_code");
		
		//  如果获得的验证码为null，说明验证码过期，用户必须刷新客户端页面，以重新获得新的验证码
		if(validationCodeSession == null)
		{			
			request.setAttribute("info", "验证码过期");//  设置result.jsp需要的结果信息
			request.setAttribute("codeError", "验证码过期");//  设置login.jsp需要找错误信息	
			return false;
		}
		//  将用户输入的验证码和系统随机生成的验证码进行比较
		if(!validationCode.equalsIgnoreCase(validationCodeSession))
		{
			request.setAttribute("info", "验证码不正确");//  设置result.jsp需要的结果信息
			request.setAttribute("codeError", "验证码不正确");//  设置login.jsp需要的错误信息
			return false;
		}
		return true;
	}

}
