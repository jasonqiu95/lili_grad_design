package cn.gov.cnis.cssn.wssort;

import java.io.Serializable;
/**
 * 提供订单信息类
 *
 */
public class OrderInfo implements Serializable {
	private String OrderId;
	private String LoginName;
	private String OrderType;
	private String OrderStatus;
	private String CreateDate;
	private String TotalPrice;
	private String ConfirmDate;
	private String finishDate;
	private String ActualPrice;
	private OrderItem[] OrderItem;
	private Pagination pagination;
	/**
	 * 获取实际价格
	 * @return 实际价格
	 */
	public String getActualPrice() {
		return ActualPrice;
	}
	/**
	 * 设置实际价格
	 * @param actualPrice 实际价格
	 */
	public void setActualPrice(String actualPrice) {
		ActualPrice = actualPrice;
	}
	/**
	 * 获取确认日期
	 * @return 确认日期
	 */
	public String getConfirmDate() {
		return ConfirmDate;
	}
	/**
	 * 设置确认日期
	 * @param confirmDate 确认日期
	 */
	public void setConfirmDate(String confirmDate) {
		ConfirmDate = confirmDate;
	}
	/**
	 * 获取创建时间
	 * @return 创建时间
	 */
	public String getCreateDate() {
		return CreateDate;
	}
	/**
	 * 设置创建时间
	 * @param createDate 创建时间
	 */
	public void setCreateDate(String createDate) {
		CreateDate = createDate;
	}
	/**
	 * 获取完成时间
	 * @return 完成时间
	 */
	public String getFinishDate() {
		return finishDate;
	}
	/**
	 * 设置完成时间
	 * @param finishDate 完成时间
	 */
	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}
	/**
	 * 获取用户名称
	 * @return 用户名称 
	 */
	public String getLoginName() {
		return LoginName;
	}
	/**
	 * 设置用户名称
	 * @param loginName 用户名称
	 */
	public void setLoginName(String loginName) {
		LoginName = loginName;
	}
	/**
	 * 获取订单条目信息
	 * @return 订单条目信息
	 */
	public OrderItem[] getOrderItem() {
		return OrderItem;
	}
	/**
	 * 设置订单条目信息
	 * @param orderDownItem 订单条目信息
	 */
	public void setOrderItem(OrderItem[] orderItem) {
		OrderItem = orderItem;
	}
	/**
	 * 获取订单号
	 * @return 订单号
	 */
	public String getOrderId() {
		return OrderId;
	}
	/**
	 * 设置订单号
	 * @param orderId 订单号
	 */
	public void setOrderId(String orderId) {
		OrderId = orderId;
	}
	/**
	 * 获取订单状态
	 * @return 订单状态
	 */
	public String getOrderStatus() {
		return OrderStatus;
	}
	/**
	 * 设置订单状态
	 * @param orderStatus 订单状态
	 */
	public void setOrderStatus(String orderStatus) {
		OrderStatus = orderStatus;
	}
	/**
	 * 获取订单类型
	 * @return 订单类型
	 */
	public String getOrderType() {
		return OrderType;
	}
	/**
	 * 设置订单类型
	 * @param orderType 订单类型
	 */
	public void setOrderType(String orderType) {
		OrderType = orderType;
	}
	/**
	 * 获取总价格
	 * @return 总价格
	 */
	public String getTotalPrice() {
		return TotalPrice;
	}
	/**
	 * 设置总价格
	 * @param totalPrice 总价格
	 */
	public void setTotalPrice(String totalPrice) {
		TotalPrice = totalPrice;
	}
	
	public Pagination getPagination() {
	
		return pagination;
	}
	
	public void setPagination(Pagination pagination) {
	
		this.pagination = pagination;
	}
}
