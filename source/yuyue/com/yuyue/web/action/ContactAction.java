package com.yuyue.web.action;

import java.text.MessageFormat;
import java.util.Date;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;

import com.yuyue.cu.core.abstractor.AbstractCriteriaBuilder;
import com.yuyue.cu.core.inf.SimpleObject;
import com.yuyue.cu.core.web.action.abstractor.AbstractBaseAction;
import com.yuyue.cu.util.Constants.EnumTabFace;
import com.yuyue.util.AdminPageTab;
import com.yuyue.web.criteria.ContactCriteriaBuilder;
import com.yuyue.web.jo.ContactJo;

public class ContactAction extends AbstractBaseAction {

	// GLOBAL CONFIG BEGIN
	@Override
	public EnumTabFace getPageTab() {
		return AdminPageTab.CONTACT;
	}
	@Override
	public AbstractCriteriaBuilder getPageCriteriaBuilder(
			HttpServletRequest request) {
		return new ContactCriteriaBuilder(request);
	}
	@Override
	public boolean validateAuthorization(ActionMapping mapping,
			HttpServletRequest request) {
		return isAdminLoginAccount(mapping,request) == Boolean.TRUE;
	}
	// GLOBAL CONFIG END
	
	// LIST PAGE BEGIN
	@Override
	public long getListPagePaginationRecordAmount() {
		return 20;
	}
	@Override
	public void buildListPageCriteria(HttpServletRequest request,
			AbstractCriteriaBuilder builder) throws Exception {
		String s = request.getParameter("s");
		if(s != null){
			builder.beginBracket();
			builder.addLkCriteria("name", LABEL_LIKE+s+LABEL_LIKE);
			builder.addOrLkCriteria("email", LABEL_LIKE+s+LABEL_LIKE);
			builder.endBracket();
		}
	}
	// LIST PAGE END
	
	// DETAIL PAGE BEGIN
	// ... nothing so far
	// DETAIL PAGE END
	
	// SAVE PAGE BEGIN
	@Override
	public String getCreateSuccessMessage(HttpServletRequest request, SimpleObject object) {
		ResourceBundle resourceBundle = getInternalResourceBundle(request);
		return MessageFormat.format(resourceBundle.getString("msg.create.success"),((ContactJo)object).getName());
	}
	@Override
	public String getUpdateSuccessMessage(HttpServletRequest request,
			SimpleObject object) {
		ResourceBundle resourceBundle = getInternalResourceBundle(request);
		return MessageFormat.format(resourceBundle.getString("msg.update.success"),((ContactJo)object).getName());
	}
	@Override
	public void buildCreatePageCriteria(HttpServletRequest request, SimpleObject object, AbstractCriteriaBuilder builder) throws Exception {
		ContactJo obj = (ContactJo)object;
		obj.setCreateDate(new Date());
		obj.setUpdateDate(new Date());
	}
	@Override
	public void buildUpdatePageCriteria(HttpServletRequest request, SimpleObject object, AbstractCriteriaBuilder builder) throws Exception {
		ContactJo obj = (ContactJo)object;
		obj.setUpdateDate(new Date());
	}
	// SAVE PAGE END
	
	// REMOVE PAGE BEGIN
	@Override
	public String getRemoveSuccessMessage(HttpServletRequest request, SimpleObject object) {
		ResourceBundle resourceBundle = getInternalResourceBundle(request);
		return MessageFormat.format(resourceBundle.getString("msg.remove.success"),((ContactJo)object).getName());
	}
	// REMOVE PAGE END

}
