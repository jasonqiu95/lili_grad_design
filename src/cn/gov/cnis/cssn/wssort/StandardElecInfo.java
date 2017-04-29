package cn.gov.cnis.cssn.wssort;
/**
 * 
 * 提供标准题录电子信息类
 *
 */
public class StandardElecInfo {
	private String elecId;
	private String A001;
	private String A100;
	private String A104;
	private String A298;
	private String A302;
	private String funcType;
	private String transType;
	private String language;
	private String pageFormat;
	private String pageNum;
	private String elecType;
	private String fileName;
	private String fileSize;
	private String price;
	private String isBuy;
	/**
	 * 获取是否已购买
	 * @return 是否已购买
	 */
	public String getIsBuy() {
		return isBuy;
	}
	/**
	 * 设置是否已购买
	 * @param isBuy 是否已购买
	 */
	public void setIsBuy(String isBuy) {
		this.isBuy = isBuy;
	}
	/**
	 * 获取记录识别符
	 * @return 记录识别符
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
	 * 获取发布单位
	 * @return 发布单位
	 */
	public String getA104() {
		return A104;
	}
	/**
	 * 设置发布单位
	 * @param a104 发布单位
	 */
	public void setA104(String a104) {
		A104 = a104;
	}
	/**
	 * 获取中文标准名称
	 * @return 中文标准名称
	 */
	public String getA298() {
		return A298;
	}
	/**
	 * 设置中文标准名称
	 * @param a298 中文标准名称
	 */
	public void setA298(String a298) {
		A298 = a298;
	}
	/**
	 * 获取英文标准名称
	 * @return 英文标准名称
	 */
	
	public String getA302() {
		return A302;
	}
	/**
	 * 设置英文标准名称
	 * @param a302 英文标准名称
	 */
	public void setA302(String a302) {
		A302 = a302;
	}
	/**
	 * 获取电子ID
	 * @return 电子ID
	 */
	public String getElecId() {
		return elecId;
	}
	/**
	 * 设置电子ID
	 * @param elecId 电子ID
	 */
	public void setElecId(String elecId) {
		this.elecId = elecId;
	}
	/**
	 * 获取电子全文类型
	 * @return 电子全文类型
	 */
	public String getElecType() {
		return elecType;
	}
	/**
	 * 设置电子全文类型
	 * @param elecType 电子全文类型
	 */
	public void setElecType(String elecType) {
		this.elecType = elecType;
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
	 * 获取文件大小
	 * @return 文件大小
	 */
	public String getFileSize() {
		return fileSize;
	}
	/**
	 * 设置文件大小
	 * @param fileSize 文件大小
	 */
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
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
	 * 获取标准语种
	 * @return 标准语种
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
	 * 获取开本
	 * @return 开本
	 */
	public String getPageFormat() {
		return pageFormat;
	}
	/**
	 * 设置开本
	 * @param pageFormat 开本
	 */
	public void setPageFormat(String pageFormat) {
		this.pageFormat = pageFormat;
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
	 * @param price
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
	 * 设置标准文种
	 * @param transType 标准文种
	 */
	public void setTransType(String transType) {
		this.transType = transType;
	}
	
}
