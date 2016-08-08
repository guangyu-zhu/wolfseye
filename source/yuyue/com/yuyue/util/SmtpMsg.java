package com.yuyue.util;

import com.yuyue.cu.util.WebUtils;

public class SmtpMsg {
	
	private static String host = "smtp.163.com";
	public static String user = "xxx@163.com";
	private static String passsword = "";
	
	public static void sendMail(String toAddress, String fromAddress, String subject, String content){
		WebUtils.sendMail(host, user, passsword, toAddress, fromAddress, subject, content, "xxx");
	}
}
