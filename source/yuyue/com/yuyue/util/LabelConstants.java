package com.yuyue.util;

import com.yuyue.cu.core.inf.EnumFace;

public enum LabelConstants implements EnumFace {
	
	ORDER_TYPE1("通过支付宝充值", 101),
	ORDER_TYPE2("通过转账充值", 102),
	ORDER_TYPE3("通过淘宝充值", 103),
	ORDER_TYPE4("通过网银充值", 104),
	ORDER_TYPE5("通过Paypal充值", 105),
	ORDER_TYPE6("通过支付宝购买", 106),
	ORDER_TYPE7("通过积分购买", 107),
	ORDER_TYPE8("通过转账购买", 108),
	ORDER_TYPE9("通过淘宝购买", 109),
	ORDER_TYPE10("通过网银购买", 110),
	ORDER_TYPE11("通过Paypal购买", 111),
	
	ORDER_STATUS1("等待支付", 121),
	ORDER_STATUS2("支付成功", 122),
	ORDER_STATUS3("支付异常", 123),
	
	ALERT_LEVEL_1("红灯",200),
	ALERT_LEVEL_2("黄灯",201),
	ALERT_LEVEL_3("绿灯",202),
	
	MEMBER_LEVEL_1("普通会员",1000),
	MEMBER_LEVEL_2("银卡会员",1001),
	MEMBER_LEVEL_3("金卡会员",1002),
	MEMBER_LEVEL_4("钻石会员",1003),
	
	;
	
	private long value;
	private String name;

	private LabelConstants(String name, long value) {
		this.value = value;
		this.name = name;
	}

	@Override
	public String getName() {
		return name;
	}

	@Override
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public long getValue() {
		return value;
	}

	@Override
	public void setValue(long value) {
		this.value = value;
	}
	
	public static LabelConstants getLabelConstants(long id) {
		LabelConstants[] values = LabelConstants.values();
		for (LabelConstants lc : values) {
			if (lc.getValue() == id)
				return lc;
		}
		return null;
	}
	
}
