package com.yuyue.web.proxy.page;

import javax.servlet.http.HttpServletRequest;

import com.yuyue.cu.core.inf.PageProxy;
import com.yuyue.cu.service.SimpleModuleService;

public class ActiveAccountProxy implements PageProxy {

	public ActiveAccountProxy(SimpleModuleService simpleModuleService){
		this.simpleModuleService = simpleModuleService;
	}
	private SimpleModuleService simpleModuleService;
	
	@Override
	public void doList(HttpServletRequest request) throws Exception {
	}

	@Override
	public void doDetail(HttpServletRequest request) throws Exception {
		/*long id = Long.parseLong(request.getParameter("id"));
		AbstractCriteriaBuilder criteriaBuilder = new AccountCriteriaBuilder(request);
		AccountJo accountJo = (AccountJo)simpleModuleService.getSimpleObjectById(id, criteriaBuilder);
		accountJo.setEmailActived(true);
		simpleModuleService.updateSimpleObject(accountJo, criteriaBuilder);
		request.setAttribute("accountJo", accountJo);*/
	}

}
