package cn.gov.cnis.cssn.wssort;


 
import java.io.Serializable;
/**
 * 提供订单条目信息的类
 * 
 *
 */
public class ThiOrderItemData implements Serializable {

	 private String Type;
	 private String A100;
	 private String A001;
	 private String EntityId;
	 private String Title;
	 private String unitPrice;
	 private Integer quantity;
	 private String agioPrice;
	 
	 /**
	  * 获取电子全文标识
	  * @return 电子全文标识
	  */
	public String getEntityId() {
		return EntityId;
	}
	/**
	 * 设置电子全文标识
	 * @param entityId 电子全文标识
	 */
	public void setEntityId(String entityId) {
		EntityId = entityId;
	}
	/**
	 * 获取商品类型
	 * @return 商品类型
	 */
	public String getType() {
		return Type;
	}
	/**
	 * 设置商品类型
	 * @param type 商品类型
	 */
	public void setType(String type) {
		Type = type;
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
	 * 获取商品名称
	 * @return 商品名称
	 */
	public String getTitle() {
		return Title;
	}
	/**
	 * 设置商品名称
	 * @param title 商品名称
	 */
	public void setTitle(String title) {
		Title = title;
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
	 * 获取折扣价
	 * @return 折扣价
	 */
	public String getAgioPrice() {
		return agioPrice;
	}
	/**
	 * 设置折扣价
	 * @param agioPrice 折扣价
	 */
	public void setAgioPrice(String agioPrice) {
		this.agioPrice = agioPrice;
	}
	/**
	 * 获取单价
	 * @return 单价
	 */
	public String getUnitPrice() {
		return unitPrice;
	}
	/**
	 * 设置单价
	 * @param unitPrice
	 */
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
 
}
