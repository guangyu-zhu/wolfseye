package com.yuyue.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import com.yuyue.cu.core.inf.TreeType;
import com.yuyue.cu.util.WebUtils;

public class PageUtils {
	
	/**
	 * 在上传图片控件中，获取原图文件名
	 * @param name 剪裁后的图片名字  如：123.jpg
	 * @return 原图的名字 如：123-big.jpg
	 */
	public static String getOrgImgName(String name){
		String bigName = null;
		if(name != null){
			bigName = name.substring(0,name.lastIndexOf(".")) + "-big" + name.substring(name.lastIndexOf("."));
		}
		return bigName;
	}
	
	/**
	 * 通过产品类别列表，返回可以表达树状结构的产品类别的map
	 * 注意：树状结构的产品类别的类必须实现TreeType接口！
	 * @param treeTypeList 产品类型的列表（该产品类型是树状结构，每一种类别都有父类别，顶级父类别id为0）
	 * @return 可以表达树状结构的map，其中key为parentId，value是结点下面的类别列表（该列表只含有一层类别，不包含嵌套的子类别）
	 */
	public static Map<Long,List<TreeType>> organizeTypeTree(List<? extends TreeType> treeTypeList){
		Map<Long,List<TreeType>> map = new TreeMap<Long,List<TreeType>>();
		if(treeTypeList != null){
			for(TreeType treeType : treeTypeList){
				long parentId = treeType.getParentId();
				List<TreeType> ttList = map.get(parentId);
				if(ttList == null){
					map.put(parentId, new ArrayList<TreeType>());
				}
				map.get(parentId).add(treeType);
			}
		}
		return map;
	}
	
	/**
	 * 返回可以直接指向产品的产品类别集合
	 * @param ids 产品类别的集合
	 * @param map 可以描述树状结构的产品类别的map
	 * @return 和输入的产品类别集合相关的产品类别的底层类别集合（该集合中的类别可以直接指向产品类别属性）
	 */
	public static Set<Long> getChildrenIds(Collection<Long> ids, Map<Long,List<TreeType>> map){
		Set<Long> typeToCriteria = new HashSet<Long>();
		getChildrenIdsInternal(ids, map, typeToCriteria, 0, false);
		return typeToCriteria;
	}

	private static void getChildrenIdsInternal(Collection<Long> ids, Map<Long, List<TreeType>> map, Set<Long> typeToCriteria, long parentId, boolean parentStartCollection) {
		List<? extends TreeType> levelList = map.get(parentId);
		if(levelList != null){
			for(TreeType treeType : levelList){
				long levelId = treeType.getId();
				boolean appendable = treeType.getAppendable();
				boolean startToCollect = false;
				if(ids.contains(levelId)){
					startToCollect = true;
				}
				if(parentStartCollection | startToCollect){
					if(!appendable){
						typeToCriteria.add(levelId);
					}
				}
				getChildrenIdsInternal(ids, map, typeToCriteria, levelId, (parentStartCollection | startToCollect));
			}
		}
	}
	
	/**
	 * 是否包含其中一个访问地址
	 * @param request
	 * @param uri 访问地址（除去域名和contextPath）
	 * @return 访问地址是否包含其中一个访问地址
	 */
	public static boolean isOneOfURI(HttpServletRequest request, String... uri) {
		String currentUri = request.getRequestURI();
		if(currentUri != null){
			for(String u : uri){
				if(u != null && currentUri.contains(u)){
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * 获取唯一随机数
	 * @param existSet 已存在的一个set，可以内容为空
	 * @param lenght 随机数的长度
	 * @return 唯一随机数（不和existSet中的重复）
	 */
	public static String generateUniqueNumber(Set<String> existSet, int lenght){
		String uniqueNumber = WebUtils.generateRandomNumber(lenght);
		if(existSet.contains(uniqueNumber)){
			return generateUniqueNumber(existSet, lenght);
		}
		return uniqueNumber;
	}
	
	/**
	 * 获取唯一随机字符串
	 * @param existSet 已存在的一个set，可以内容为空
	 * @param lenght 随机字符串的长度
	 * @return 唯一随机字符串（不和existSet中的重复）
	 */
	public static String generateUniqueString(Set<String> existSet, int lenght){
		String uniqueString = WebUtils.generateRandomString(lenght);
		if(existSet.contains(uniqueString)){
			return generateUniqueString(existSet, lenght);
		}
		return uniqueString;
	}

/****************************************************************************************
 ****************************** 商品折扣算法 ************************************************
 ****************************************************************************************/
	/**
	 * 满X立减Y
	 * @param currentValue 当前价格
	 * @param fullValue 满X
	 * @param reduceValue 立减Y
	 * @return 折扣后的价格
	 */
	public static float reduceWhenFull(float currentValue, float fullValue, float reduceValue){
		float refValue = currentValue;
		float discount = 0;
		if(refValue >= fullValue){
			refValue -= fullValue;
			discount += reduceValue;
		}
		return currentValue - discount;
	}
	
	/**
	 * 直接折扣
	 * @param currentValue 当前价格
	 * @param discount 50% = 0.5
	 * @return 折扣后的价格
	 */
	public static float reduceWhenFull(float currentValue, float discount){
		return currentValue * discount;
	}
	
	/**
	 * 人民币 ： 积分 = 1 ： PR_RATE
	 */
	public static final float PR_RATE = 1;
	/**
	 * 积分兑换人民币
	 * @param point 积分
	 * @return 人民币
	 */
	public static float exchangeRmbByPoint(float point){
		return point / PR_RATE;
	}
	
	/**
	 * 人民币兑换积分
	 * @param rmb 人民币
	 * @return 积分
	 */
	public static float exchangePointByRmb(float rmb){
		return rmb * PR_RATE;
	}
	
/****************************************************************************************
 ****************************** 激活邮件内容 ************************************************
 ****************************************************************************************/
	public static String getActiveEmailContent(String logoFullPath, String webName, String websiteAddress, String activeLink){
		String content = "<html class=\"yui3-js-enabled\"><head><style type=\"text/css\">blockquote {display:inline-block;}body { padding: 8px 10px; overflow-x: auto; overflow-y: visible; }body,h1,h2,h3,h4,h5,h6,h7,h8,span,p,a,div,ul,li,form,input,label,.coupon-time{font-family: 'Microsoft Yahei' !important;}</style></head><body marginwidth=\"0\" marginheight=\"0\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" height=\"100%\" width=\"100%\" bgcolor=\"#f4f4f4\" style=\"border-spacing: 0;background: #f4f4f4;\"><tbody><tr><td style=\"border-collapse: collapse;\"><table border=\"0\" width=\"600\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"border-spacing: 0;\"><tbody><tr><td height=\"30\" style=\"font-size: 0;line-height: 0;border-collapse: collapse;\">&nbsp;</td></tr><tr><td valign=\"middle\" style=\"text-align: left;border-collapse: collapse;padding: 20.0px 0;\" align=\"left\"><a href=\""+websiteAddress+"\" target=\"_blank\"><img src=\""+websiteAddress+logoFullPath+"\" class=\"handler-img\" style=\"display: inline;\" height=\"48\" border=\"0\"></a></td><td valign=\"middle\" style=\"text-align: right;font-family: helvetica   arial   sans-serif;font-size: 16.0px;border-collapse: collapse;padding: 20.0px 0;\" align=\"right\"></td></tr><tr><td height=\"10\" style=\"font-size: 0;line-height: 0;border-collapse: collapse;\">&nbsp;</td></tr></tbody></table><table border=\"0\" width=\"600\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"border-spacing: 0;background: #ffffff;border: 1.0px solid #e5e5e5;\" bgcolor=\"#ffffff\"><tbody><tr><td style=\"border-collapse: collapse;\"></td></tr><tr><td style=\"border-bottom-width: 1.0px;border-bottom-color: #e5e5e5;border-bottom-style: solid;border-collapse: collapse;\"><table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"border-spacing: 0;\"><tbody><tr><td style=\"font-family: sans-serif;font-size: 16.0px;line-height: 25.0px;color: #666666;border-collapse: collapse;padding: 30.0px;\"><h1 style=\"font-size: 20.0px;color: #282828;\">欢迎加入"+webName+"!</h1><div>非常感谢您的加入，为确保您的帐户安全，您还需要点击以下按钮来验证您的邮箱地址。<br></div><div><div style=\"padding: 30.0px;\"><a target=\"_blank\" title=\"Confirm Email Address\" style=\"font-size: 13.0px;font-weight: 100;font-family: helvetica   arial   sans-serif;text-transform: uppercase;text-align: center;letter-spacing: 1.0px;text-decoration: none;line-height: 62.0px;display: block;width: 300.0px;height: 60.0px;border-top-left-radius: 3.0px;border-top-right-radius: 3.0px;border-bottom-right-radius: 3.0px;border-bottom-left-radius: 3.0px;color: #ffffff;background: #398bce;margin: 0.0px auto;\" href=\"" +
				activeLink+
				"\">验证邮箱</a></div></div><div>如果您无法点此链接，请复制以下链接到浏览器上打开。<br>" +
				activeLink+
				"<br><br>祝您一些顺利,</div><div>"+webName+"团队</div></td></tr></tbody></table></td></tr></tbody></table><table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"border-spacing: 0;\"><tbody><tr><td style=\"text-align: center;font-family: helvetica   arial   sans-serif;font-size: 12.0px;line-height: 18.0px;color: #888888;border-collapse: collapse;padding: 20.0px 0.0px 5.0px;\" align=\"center\">"+websiteAddress+"<br>技术支持: <a style=\"color: #888888;\" href=\"http://www.cooljz.com\" target=\"_blank\">酷建站</a></td></tr></tbody></table></td></tr></tbody></table></body></html>";
		return content;
	}
	
/****************************************************************************************
 ******************************** 重置密码内容 **********************************************
 ****************************************************************************************/
	public static String getResetPwdEmailContent(String accountName, String newPwd, String webName){
		String content = "Hi,"+accountName+"<br>您的网站登录密码已经更改为<b>"+newPwd+"</b>。<br>请尽快登录网站更改您的密码。<br><br>"+webName;
		return content;
	}
	
}
