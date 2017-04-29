package cn.gov.cnis.cssn.wssort;


/**
 * 
 * 提供用户账目详细信息类
 *
 */
public class UserAuditItem {
	
	private String type;
	private String a001;
	private String a100;
	private String title;
	private Double unitprice;
	private Integer quantity;
	private String consumDate;
	private String remark;
	private String functype;
	private String transtype;
	private String language;
	private String entityid;
	/**
	 * 获取电子ID
	 * @return 电子ID
	 */
	public String getEntityid() {
		return entityid;
	}
	/**
	 * 设置电子ID
	 * @param entityid 电子ID
	 */
	public void setEntityid(String entityid) {
		this.entityid = entityid;
	}
	/**
	 * 获取标准功能
	 * @return 标准功能
	 */
	public String getFunctype() {
		return functype;
	}
	/**
	 * 设置标准功能
	 * @param functype 标准功能
	 */
	public void setFunctype(String functype) {
		this.functype = functype;
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
	 * 获取标准文种
	 * @return 标准文种
	 */
	public String getTranstype() {
		return transtype;
	}
	/**
	 * 设置标准文种
	 * @param transtype 标准文种
	 */
	public void setTranstype(String transtype) {
		this.transtype = transtype;
	}
	/**
	 *  获取记录识别符
	 * @return 记录识别符
	 */
	public String getA001() {
		return a001;
	}
	/**
	 * 设置记录识别符
	 * @param a001 记录识别符
	 */
	public void setA001(String a001) {
		this.a001 = a001;
	}
	/**
	 * 获取标准号
	 * @return 标准号
	 */
	public String getA100() {
		return a100;
	}
	/**
	 * 设置标准号
	 * @param a100 标准号
	 */
	public void setA100(String a100) {
		this.a100 = a100;
	}
	/**
	 * 获取消费日期
	 * @return 消费日期
	 */
	public String getConsumDate() {
		return consumDate;
	}
	/**
	 * 设置消费日期
	 * @param consumDate 消费日期
	 */
	public void setConsumDate(String consumDate) {
		this.consumDate = consumDate;
	}
	/**
	 * 获取数量
	 * @return 数量
	 */
	public Integer getQuantity() {
		return quantity;
	}
	/**
	 * 设置数量
	 * @param quantity 数量
	 */
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
 
	/**
	 * 获取备注
	 * @return 备注 
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * 设置备注
	 * @param remark 备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取商品名称
	 * @return 商品名称
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * 设置商品名称
	 * @param title 商品名称
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * 获取消费类型
	 * @return 消费类型
	 */
	public String getType() {
		return type;
	}
	/**
	 * 设置消费类型
	 * @param type 消费类型
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * 获取单价
	 * @return 单价
	 */
	public Double getUnitprice() {
		return unitprice;
	}
	/**
	 * 设置单价
	 * @param unitprice 单价
	 */
	public void setUnitprice(Double unitprice) {
		this.unitprice = unitprice;
	}
	
 
}
