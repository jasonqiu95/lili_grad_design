package cn.gov.cnis.cssn.wssort;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Map;


import com.estarcom.cnis.cssn.salesystem.order.service.TProductStandard;
/**
 * 
 * 提供题录检索数据返回信息的类
 *
 */
public class QueryResult implements Serializable {

	private int pageIndex;
	private int pageSize;
	private TrsStandard[] resultList;
	private long recordCount;
	private int totalPage;
//	private ThiOrderWrap[] order;
	private TProductStandard[] productStandard;
//	private TDStockAviso[] stockAviso;
	private StandardList[] standList;
	private String resultStr;

	/**
	 * 获取标准列表
	 * @return 标准列表
	 */
	public StandardList[] getStandList() {
		return standList;
	}
/**
 * 设置标准列表
 * @param standList 标准列表
 */
	public void setStandList(StandardList[] standList) {
		this.standList = standList;
	}

	private String loginErr;

	public QueryResult() {
	}

	private void readObject(ObjectInputStream ois) throws IOException,
			ClassNotFoundException {
		ois.defaultReadObject();
	}

	private void writeObject(ObjectOutputStream oos) throws IOException {
		oos.defaultWriteObject();
	}
/**
 * 设置显示页数
 * @param pageIndex 显示页数
 */
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
/**
 * 设置页数大小
 * @param pageSize 页数大小
 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
/**
 * 设置查询标准信息
 * @param resultList 查询标准信息
 */
	public void setResultList(TrsStandard[] resultList) {
		this.resultList = resultList;
	}
/**
 * 设置合计
 * @param recordCount 合计
 */
	public void setRecordCount(long recordCount) {
		this.recordCount = recordCount;
	}
/**
 * 设置总页数
 * @param totalPage 总页数
 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
/**
 * 获取要显示的页数
 * @return 要显示的页数
 */
	public int getPageIndex() {
		return pageIndex;
	}
/**
 * 获取页数大小
 * @return 页数大小
 */
	public int getPageSize() {
		return pageSize;
	}
/**
 * 获取查询标准
 * @return  查询标准
 */
	public TrsStandard[] getResultList() {
		return resultList;
	}
/**
 * 获取总计
 * @return
 */
	public long getRecordCount() {
		return recordCount;
	}
/**
 * 获取总页数
 * @return
 */
	public int getTotalPage() {
		return totalPage;
	}
/**
 * 获取订单信息
 * @return
 */
//	public ThiOrderWrap[] getOrder() {
//		return order;
//	}
///**
// * 设置订单信息
// * @param order
// */
//	public void setOrder(ThiOrderWrap[] order) {
//		this.order = order;
//	}
/**
 * 获取登陆错误信息
 * @return 登陆错误信息
 */
	public String getLoginErr() {
		return loginErr;
	}

	/**
	 * 设置登陆错误信息
	 * @param loginErr 登陆错误信息
	 */
	public void setLoginErr(String loginErr) {
		this.loginErr = loginErr;
	}
/**
 * 获取题录信息
 * @return 题录信息
 */
	public TProductStandard[] getProductStandard() {
		return productStandard;
	}
/**
 * 设置题录信息
 * @param productStandard 题录信息
 */
	public void setProductStandard(TProductStandard[] productStandard) {
		this.productStandard = productStandard;
	}
/**
 * 获取标准动态信息
 * @return 标准动态信息
 */
//	public TDStockAviso[] getStockAviso() {
//		return stockAviso;
//	}
///**
// * 设置标准动态信息
// * @param stockAviso 标准动态信息
// */
//	public void setStockAviso(TDStockAviso[] stockAviso) {
//		this.stockAviso = stockAviso;
//	}
/**
 * 获取返回信息
 * @return 返回信息
 */
	public String getResultStr() {
		return resultStr;
	}
/**
 * 设置返回信息
 * @param resultStr 返回信息
 */
	public void setResultStr(String resultStr) {
		this.resultStr = resultStr;
	}

}
