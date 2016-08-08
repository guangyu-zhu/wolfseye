package com.yuyue.web.criteria;

import javax.servlet.http.HttpServletRequest;

import com.yuyue.cu.core.abstractor.AbstractCriteriaBuilder;
import com.yuyue.cu.core.inf.SimpleObject;
import com.yuyue.util.SqlConstants;
import com.yuyue.web.jo.PrdJo;

public class PrdCriteriaBuilder extends AbstractCriteriaBuilder {

	public PrdCriteriaBuilder(){
		super();
	}
	
	public PrdCriteriaBuilder(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getProtoTableName() {
		return SqlConstants.PROTO_TABLE_PRD;
	}

	@Override
	public Class<? extends SimpleObject> getType() {
		return PrdJo.class;
	}

	@Override
	protected boolean isMultiLanguageSupport() {
		return false;
	}

}
