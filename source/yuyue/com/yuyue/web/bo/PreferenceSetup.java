package com.yuyue.web.bo;

import java.util.Map;

import com.yuyue.cu.core.inf.Setup;
import com.yuyue.util.LabelConstants;
import com.yuyue.util.WebConstants;

public class PreferenceSetup implements Setup {
	
	@Override
	public void initial(Map<Long, String> preferenceMap) {
	/*
		String value= preferenceMap.get(LabelConstants.PAGE_1000.getValue());
		if(value != null && !value.isEmpty()){
			WebConstants.PAGE_TOOL = value;
		}*/
	}
	
}
