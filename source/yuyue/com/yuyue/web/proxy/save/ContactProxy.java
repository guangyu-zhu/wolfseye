package com.yuyue.web.proxy.save;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yuyue.cu.core.inf.SaveProxy;
import com.yuyue.cu.core.web.action.abstractor.AbstractSaveProxy;
import com.yuyue.cu.service.SimpleModuleService;
import com.yuyue.web.criteria.ContactCriteriaBuilder;
import com.yuyue.web.jo.ContactJo;

public class ContactProxy extends AbstractSaveProxy implements SaveProxy {

	public ContactProxy(SimpleModuleService simpleModuleService){
		this.simpleModuleService = simpleModuleService;
	}
	private SimpleModuleService simpleModuleService;
	
	@Override
	public boolean doSave(HttpServletRequest request) throws Exception {
		Map<String,Object> paramMap = getParameterMap(request);
		Date today = new Date();
		String name = (String)paramMap.get("name");
		String email = (String)paramMap.get("email");
		String phone = (String)paramMap.get("phone");
		String message = (String)paramMap.get("message");
		ContactCriteriaBuilder criteriaBuilder = new ContactCriteriaBuilder(request);
		ContactJo contactJo = new ContactJo();
		contactJo.setName(name);
		contactJo.setEmail(email);
		contactJo.setPhone(phone);
		contactJo.setContent(message);
		contactJo.setIsOpen(false);
		contactJo.setIsReply(false);
		contactJo.setCreateDate(today);
		contactJo.setUpdateDate(today);
		simpleModuleService.createSimpleObject(contactJo, criteriaBuilder);
//		callbackParams(request,"?id=123");
		return true;
	}

}
