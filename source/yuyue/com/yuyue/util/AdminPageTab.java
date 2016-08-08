package com.yuyue.util;

import com.yuyue.cu.util.Constants.EnumTabFace;

public enum AdminPageTab implements EnumTabFace {
	

	PRD(11),
	CONTACT(10);
	
	private float value;

	private AdminPageTab(float value) {
		this.value = value;
	}

	public float getValue() {
		return value;
	}

	public void setValue(float value) {
		this.value = value;
	}

}
