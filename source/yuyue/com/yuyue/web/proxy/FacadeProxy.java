package com.yuyue.web.proxy;

import com.yuyue.cu.core.web.proxy.AbstractAccountProxy;
import com.yuyue.cu.core.web.proxy.AbstractFacadeProxy;
import com.yuyue.cu.core.web.proxy.AbstractProductProxy;

public class FacadeProxy extends AbstractFacadeProxy {

	AccountProxy accountProxy = new AccountProxy();
	ProductProxy productProxy = new ProductProxy();
	
	public AbstractAccountProxy getAccountProxy() {
		return accountProxy;
	}
	
	public AbstractProductProxy getProductProxy(){
		return productProxy;
	}

}
