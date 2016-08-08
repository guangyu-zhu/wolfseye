package com.yuyue.web.proxy.page;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.yuyue.cu.core.abstractor.AbstractCriteriaBuilder;
import com.yuyue.cu.core.inf.PageProxy;
import com.yuyue.cu.service.SimpleModuleService;
import com.yuyue.util.CommConstants;
import com.yuyue.web.criteria.PrdCriteriaBuilder;
import com.yuyue.web.jo.PrdJo;

public class HomeProxy implements PageProxy {

	public HomeProxy(SimpleModuleService simpleModuleService){
		this.simpleModuleService = simpleModuleService;
	}
	private SimpleModuleService simpleModuleService;
	
	@SuppressWarnings("unchecked")
	@Override
	public void doList(HttpServletRequest request) throws Exception {
		Date nowDate = new Date();
		String historyDate = request.getParameter("history");
		if(historyDate != null){
			nowDate = CommConstants.SDF_2.parse(historyDate);
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(nowDate);
		cal.add(Calendar.DATE, 1);
		Date nextDate = cal.getTime();
		AbstractCriteriaBuilder criteriaBuilder = new PrdCriteriaBuilder(request);
		criteriaBuilder.addEqCriteria("display", true);
		criteriaBuilder.addLtCriteria("showDate", nextDate);
		criteriaBuilder.addGtCriteria("showDate", nowDate);
		List<PrdJo> prdList = (List<PrdJo>)simpleModuleService.findAllSimpleObjects(criteriaBuilder);
		if(prdList != null && prdList.size() == 1){
			PrdJo prdJo = prdList.get(0);
			request.setAttribute("prdJo", prdJo);
		}
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
