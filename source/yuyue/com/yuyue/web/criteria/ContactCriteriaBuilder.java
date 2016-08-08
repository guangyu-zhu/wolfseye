package com.yuyue.web.criteria;

import javax.servlet.http.HttpServletRequest;

import com.yuyue.cu.core.abstractor.AbstractCriteriaBuilder;
import com.yuyue.cu.core.inf.SimpleObject;
import com.yuyue.util.SqlConstants;
import com.yuyue.web.jo.ContactJo;

public class ContactCriteriaBuilder extends AbstractCriteriaBuilder {

	public ContactCriteriaBuilder(){
		super();
	}
	
	public ContactCriteriaBuilder(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getProtoTableName() {
		return SqlConstants.PROTO_TABLE_CONTACT;
	}

	@Override
	public Class<? extends SimpleObject> getType() {
		return ContactJo.class;
	}

	@Override
	protected boolean isMultiLanguageSupport() {
		return false;
	}

}
