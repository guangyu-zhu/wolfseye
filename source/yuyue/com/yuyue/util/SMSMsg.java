package com.yuyue.util;
import com.yuyue.cu.util.WebUtils;

public class SMSMsg {

	private static String host = "http://gbk.sms.webchinese.cn";
	private static String uid = "";
	private static String key = "";
	
	public static String sendMsgToPhone(String phoneNumber,String content) {
		return WebUtils.sendMsgToPhone(host, uid, key, phoneNumber, content);
	}
	
}
