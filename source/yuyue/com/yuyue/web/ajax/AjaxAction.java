package com.yuyue.web.ajax;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import com.yuyue.cu.core.abstractor.AbstractCriteriaBuilder;
import com.yuyue.cu.core.bo.ExcelExportConfig;
import com.yuyue.cu.core.bo.ExcelExporter;
import com.yuyue.cu.util.WebUtils;
import com.yuyue.util.CommConstants;
import com.yuyue.util.LabelConstants;
import com.yuyue.util.PageUtils;
import com.yuyue.util.SMSMsg;
import com.yuyue.util.SmtpMsg;
import com.yuyue.util.WebConstants;
import com.yuyue.util.ImageUtils;
import com.yuyue.web.criteria.*;
import com.yuyue.web.jo.*;

public class AjaxAction extends com.yuyue.cu.core.web.action.AjaxAction {
	
	/*
	 * 测试Sample
	 * var id = ...; //id
	 * jQuery.post('${contextPath}/ajax.do',{method:'testSample',id:id},function(data){
	 * if(data.success == true){
	 *  ...
	 * }else{
	 * 	alert(data.error);
	 */
	public JSONObject doTestSample(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		try{
			long id = Long.parseLong(request.getParameter("id"));
			
			AbstractCriteriaBuilder criteriaBuilder = new ContactCriteriaBuilder(request);
			criteriaBuilder.addEqCriteria("id", id);
			simpleModuleService.deleteSimpleObject(criteriaBuilder);
			jsonObject.put("success", true);
			
		}catch(Exception e){
			jsonObject.put("error", "系统异常");
			jsonObject.put("success", false);
		}
		return jsonObject;
	}
	
	public JSONObject doRotateImg(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		try{
			String name = request.getParameter("name");
			String path = request.getParameter("path");
			int angle = Integer.parseInt(request.getParameter("angle"));
			ImageUtils.rotateImg(request.getServletContext().getRealPath("/upload/files/"+path+"/"+name), angle);
			jsonObject.put("success", true);
		}catch(Exception e){
			jsonObject.put("error", "系统异常");
			jsonObject.put("success", false);
		}
		return jsonObject;
	}

   

   

   

   

   

   

}
