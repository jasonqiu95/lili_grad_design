package cn.gov.cnis.cssn.wssort;

public class Pagination {
	private int pageNo;// 当前页数
	private int recTotal;  //总条数
	private int pageSize;  //每页多少
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRecTotal() {
		return recTotal;
	}
	public void setRecTotal(int recTotal) {
		this.recTotal = recTotal;
	} 


}
