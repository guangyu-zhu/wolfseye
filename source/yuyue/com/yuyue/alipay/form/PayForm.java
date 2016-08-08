package com.yuyue.alipay.form;

import com.yuyue.cu.core.abstractor.AbstractBaseJo;

public class PayForm extends AbstractBaseJo {
	
	private static final long serialVersionUID = 5213572426321166556L;
	
	//用户id
	private long accountId;
	//收货地址名
	private String address;
	//收获人
	private String receiverName;
	//收获人电话
	private String receiverPhone;
	//邮费
	private float expressFee;
	//订单描述
	private String description;
	//订单支付价格
	private float costPrice;
	//订单优惠价格
	private float savePrice;
	//发票抬头
	private String invoice;
	
	public long getAccountId() {
		return accountId;
	}
	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public float getExpressFee() {
		return expressFee;
	}
	public void setExpressFee(float expressFee) {
		this.expressFee = expressFee;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(float costPrice) {
		this.costPrice = costPrice;
	}
	public float getSavePrice() {
		return savePrice;
	}
	public void setSavePrice(float savePrice) {
		this.savePrice = savePrice;
	}
	public String getInvoice() {
		return invoice;
	}
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	
	
}