package cn.gov.cnis.cssn.wssort;

public class Pagination {
	private int pageNo;// ��ǰҳ��
	private int recTotal;  //������
	private int pageSize;  //ÿҳ����
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
