package com.yuyue.web.jo;

import java.text.ParseException;
import java.util.Date;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import com.yuyue.cu.core.abstractor.AbstractBaseJo;
import com.yuyue.cu.core.inf.SimpleObject;
import com.yuyue.util.CommConstants;


public class PrdJo extends AbstractBaseJo implements SimpleObject {

	private static final long serialVersionUID = 1067462302691812387L;
	
	static{
		ConvertUtils.register(new Converter(){

			@SuppressWarnings("rawtypes")
			@Override
			public Object convert(Class type, Object value) {
				if(value == null){
					return null;
				}else if(value instanceof String){
					try {
						return CommConstants.SDF_1.parse((String)value);
					} catch (ParseException e) {
						return null;
					}
				}else{
					return null;
				}
			}
			
		}, Date.class);
	}
	
	private String todayImage;
	private String moreTodayImages;
	private String predictImage;
	private String morePredictImages;
	private long alertLevel;
	private long holdPercentage;
	private String notification;
	private Date showDate;
	private Boolean display;
	private long sortId;

	private Date updateDate;
	private Date createDate;
	
	public String getTodayImage() {
		return todayImage;
	}
	public void setTodayImage(String todayImage) {
		this.todayImage = todayImage;
	}
	public String getMoreTodayImages() {
		return moreTodayImages;
	}
	public void setMoreTodayImages(String moreTodayImages) {
		this.moreTodayImages = moreTodayImages;
	}
	public String getPredictImage() {
		return predictImage;
	}
	public void setPredictImage(String predictImage) {
		this.predictImage = predictImage;
	}
	public String getMorePredictImages() {
		return morePredictImages;
	}
	public void setMorePredictImages(String morePredictImages) {
		this.morePredictImages = morePredictImages;
	}
	public long getAlertLevel() {
		return alertLevel;
	}
	public void setAlertLevel(long alertLevel) {
		this.alertLevel = alertLevel;
	}
	public long getHoldPercentage() {
		return holdPercentage;
	}
	public void setHoldPercentage(long holdPercentage) {
		this.holdPercentage = holdPercentage;
	}
	public String getNotification() {
		return notification;
	}
	public void setNotification(String notification) {
		this.notification = notification;
	}
	public Date getShowDate() {
		return showDate;
	}
	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}
	public Boolean getDisplay() {
		return display;
	}
	public void setDisplay(Boolean display) {
		this.display = display;
	}
	public long getSortId() {
		return sortId;
	}
	public void setSortId(long sortId) {
		this.sortId = sortId;
	}

	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}
