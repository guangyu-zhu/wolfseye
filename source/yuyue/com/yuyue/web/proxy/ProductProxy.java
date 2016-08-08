package com.yuyue.web.proxy;

import java.util.Map;
import java.util.ResourceBundle;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import com.yuyue.cu.core.web.proxy.AbstractProductProxy;

public class ProductProxy extends AbstractProductProxy {

	@Override
	public String[] getProductMiscArray(HttpServletRequest request) {
		ResourceBundle resourceBundle = getResourceBundle(request);
		return new String[]{
				resourceBundle.getString("product.misc1.name"),
				resourceBundle.getString("product.misc2.name"),
				resourceBundle.getString("product.misc3.name"),
				resourceBundle.getString("product.misc4.name")
		};
	}

	@Override
	public Map<Integer,String> getProductStatusMap(HttpServletRequest request) {
		ResourceBundle resourceBundle = getResourceBundle(request);
		Map<Integer,String> statusMap = new TreeMap<Integer,String>();
		statusMap.put(1, resourceBundle.getString("product.status1.name"));
		statusMap.put(2, resourceBundle.getString("product.status2.name"));
		return statusMap;
	}

	@Override
	public String getProductUploadPath() {
		return "product";
	}
	
}
