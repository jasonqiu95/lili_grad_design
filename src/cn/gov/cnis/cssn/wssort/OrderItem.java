package cn.gov.cnis.cssn.wssort;

import java.io.Serializable;
/**
 * 提供订单详细信息类
 *
 */
public class OrderItem implements Serializable  {
	private String A001;
	private String A100;
	private String A104;
	private String A298_A302;
//	private String LiteratueType;
	private String pageNum;
	private String price;
	private String elecId;
	private String quantity;
	private String funcType;
	private String transType;
	private String language;
	private String fileName;
	private String standardType;
	
	/**
	 * 获取电子ID
	 * @return 电子ID
	 */
	public String getElecId() {
		return elecId;
	}
	/**
	 * 设置电子ID
	 * @param elecId电子ID
	 */
	public void setElecId(String elecId) {
		this.elecId = elecId;
	}
	/**
	 * 获取标准功能
	 * @return 标准功能
	 */
	public String getFuncType() {
		return funcType;
	}
	/**
	 * 设置标准功能
	 * @param funcType 标准功能
	 */
	public void setFuncType(String funcType) {
		this.funcType = funcType;
	}
	/**
	 * 获取页数
	 * @return 页数
	 */
	public String getPageNum() {
		return pageNum;
	}
	/**
	 * 设置页数
	 * @param pageNum 页数
	 */
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	/**
	 * 获取价格
	 * @return 价格
	 */
	public String getPrice() {
		return price;
	}
	/**
	 * 设置价格
	 * @param  price 价格
	 */
	public void setPrice(String price) {
		this.price = price;
	}
	/**
	 * 获取标准文种
	 * @return 标准文种
	 */
	public String getTransType() {
		return transType;
	}
	/**
	 *  设置标准文种
	 * @param transType
	 */
	public void setTransType(String transType) {
		this.transType = transType;
	}
	/**
	 * 获取文件名称
	 * @return 文件名称
	 */
	public String getFileName() {
		return fileName;
	}
	/**
	 * 设置文件名称
	 * @param fileName 文件名称
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	/**
	 * 获取标准类型
	 * @return 标准类型
	 */
	public String getStandardType() {
		return standardType;
	}
	/**
	 * 设置标准类型
	 * @param standardType 标准类型
	 */
	public void setStandardType(String standardType) {
		this.standardType = standardType;
	}
 /**
  * 获取标准语种
  * @return  标准语种
  */
	public String getLanguage() {
		return language;
	}
	/**
	 * 设置标准语种
	 * @param language 标准语种
	 */
	public void setLanguage(String language) {
		this.language = language;
	}
 /**
  * 获取记录识别符
  * @return  记录识别符
  */
	public String getA001() {
		return A001;
	}
	/**
	 * 设置记录识别符
	 * @param a001 记录识别符
	 */
	public void setA001(String a001) {
		A001 = a001;
	}
	/**
	 * 获取标准号
	 * @return 标准号
	 */
	public String getA100() {
		return A100;
	}
	/**
	 * 设置标准号
	 * @param a100 标准号
	 */
	public void setA100(String a100) {
		A100 = a100;
	}
	/**
	 * 获取标准发布单位
	 * @return  标准发布单位
	 */
	public String getA104() {
		return A104;
	}
	/**
	 * 设置标准发布单位
	 * @param a104 标准发布单位
	 */
	public void setA104(String a104) {
		A104 = a104;
	}
	/**
	 * 获取中英文名称
	 * @return 中英文名称
	 */
	public String getA298_A302() {
		return A298_A302;
	}
	/**
	 * 设置中英文名称
	 * @param a298_a302 中英文名称
	 */
	public void setA298_A302(String a298_a302) {
		A298_A302 = a298_a302;
	}
 
//	public String getLiteratueType() {
//		return LiteratueType;
//	}
//	public void setLiteratueType(String literatueType) {
//		LiteratueType = literatueType;
//	}
 
	/**
	 * 获取数量
	 */
	public String getQuantity() {
		return quantity;
	}
	/**
	 * 设置数量
	 * @param quantity 数量
	 */
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	} 
}
