package com.yuyue.web.proxy;

import javax.servlet.http.HttpServletRequest;

import com.yuyue.cu.core.web.proxy.AbstractAccountProxy;
import com.yuyue.util.SMSMsg;
import com.yuyue.util.SmtpMsg;

public class AccountProxy extends AbstractAccountProxy {
	
	public void sendMail(String toAddress, String fromAddress,
			String subject, String content) {
		SmtpMsg.sendMail(toAddress, fromAddress, subject, content);
	}

	public String getFromAddress() {
		return SmtpMsg.user;
	}

	public String sendMsgToPhone(String phoneNumber, String content) {
		return SMSMsg.sendMsgToPhone(phoneNumber, content);
	}

	public String getWebsiteName(HttpServletRequest request) {
		return "cafe";
	}

	
}
