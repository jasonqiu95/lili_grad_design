package cn.gov.cnis.cssn.wssort;
/**
 * 提供下载信息类 
 *
 */
public class DownInfo {
	private String loginName;
	private String A001;
	private String A100;
	private String A104;
	private String A298_A302;
	private String literatureType;
	private String FuncType;
	private String transType;
	private String Language;
	private String pageNum;
	private String price;
	private String elecId;
	private String fileName;
	private String downDate;
	private String Status;
		
		/**
		 * 获取题录识别符信息
		 */
	public String getA001() {
		return A001;
	}
	/**
	 * 设置题录识别符信息
	 * @param a001 返回题录识别符
	 */
	public void setA001(String a001) {
		A001 = a001;
	}
	
	/**
	 * 获取标准号
	 */
	public String getA100() {
		return A100;
	}
	/**
	 * 设置标准号
	 * @param a100 返回标准号
	 */
	public void setA100(String a100) {
		A100 = a100;
	}
	/**
	 * 获取发布单位
	 * @return 返回发布单位
	 */
	public String getA104() {
		return A104;
	}
	/**
	 * 设置发布单位
	 * @param a104  发布单位
	 */
	public void setA104(String a104) {
		A104 = a104;
	}
	/**
	 * 获取中英文标题名
	 * @return 返回中英文标题
	 */
	public String getA298_A302() {
		return A298_A302;
	}
	/**
	 * 设置中英文标题名
	 * @param a298_a302 中英文标题名
	 */
	public void setA298_A302(String a298_a302) {
		A298_A302 = a298_a302;
	}
	/**
	 * 获取下载时间
	 * @return 下载时间
	 */
	public String getDownDate() {
		return downDate;
	}
	/**
	 * 设置下载时间
	 * @param downDate 下载时间 
	 */
	public void setDownDate(String downDate) {
		this.downDate = downDate;
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
	 * 获取文件名称
	 * @return  文件名称
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
	 * 获取标准功能
	 * @return 标准功能
	 */
	public String getFuncType() {
		return FuncType;
	}
	/**
	 * 设置功能标准
	 * @param funcType 标准功能
	 */
	public void setFuncType(String funcType) {
		FuncType = funcType;
	}
	/**
	 * 获取标准语种
	 * @return 标准语种
	 */
	public String getLanguage() {
		return Language;
	}
	/**
	 * 设置标准语种
	 * @param language 标准语种
	 */
	public void setLanguage(String language) {
		Language = language;
	}
 
//	public String getLiteratureType() {
//		return literatureType;
//	}
//	public void setLiteratureType(String literatureType) {
//		this.literatureType = literatureType;
//	}
	/**
	 * 获取用户名称
	 * @return 用户名称
	 */
	public String getLoginName() {
		return loginName;
	}
	/**
	 * 设置用户名称
	 * @param loginName 用户名称
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
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
	 * 获取状态
	 * @return 状态
	 */
	public String getStatus() {
		return Status;
	}
	/**
	 * 设置状态 
	 * @param status 状态
	 */
	public void setStatus(String status) {
		Status = status;
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
