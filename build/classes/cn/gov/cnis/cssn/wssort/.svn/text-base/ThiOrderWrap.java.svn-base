package cn.gov.cnis.cssn.wssort;

import java.io.Serializable;

/**
 * 提供订单对象的类
 * 
 * 
 */
public class ThiOrderWrap implements Serializable {

	private String actual_price;
	private ThiOrderItemData[] items;
	private OrderServFee osfee;

	/**
	 * 获取订单条目信息
	 * 
	 * @return 订单条目信息
	 */
	public ThiOrderItemData[] getItems() {
		return items;
	}

	/**
	 * 设置订单条目信息
	 * 
	 * @param items
	 *            订单条目信息
	 */
	public void setItems(ThiOrderItemData[] items) {
		this.items = items;
	}

	/**
	 * 获取实际价格
	 * 
	 * @return 实际价格
	 */
	public String getActual_price() {
		return actual_price;
	}

	/**
	 * 设置实际价格
	 * 
	 * @param actual_price
	 *            实际价格
	 */
	public void setActual_price(String actual_price) {
		this.actual_price = actual_price;
	}

	/**
	 * 获取订单服务费
	 * 
	 * @return
	 */
	public OrderServFee getOsfee() {
		return osfee;
	}

	/**
	 * 设置订单服务费
	 * 
	 * @param osfee
	 */
	public void setOsfee(OrderServFee osfee) {
		this.osfee = osfee;
	}

}
