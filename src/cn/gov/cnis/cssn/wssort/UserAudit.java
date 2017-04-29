package cn.gov.cnis.cssn.wssort;
/**
 * 
 * 用户账目信息类
 *
 */
public class UserAudit {
	private Integer id;
	private String summary;
	private String createdate;
	private Double keep;
	private Double pay;
	private Double balance;
	private String relatedid;
	private String relatedtype;
	private String reamark;
	private String loginname;
 /**
  * 获取余额
  * @return 余额
  */
	public Double getBalance() {
		return balance;
	}
	/**
	 * 设置余额
	 * @param balance 余额
	 */
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	/**
	 * 获取存入金额
	 * @return 存入金额
	 */
	public Double getKeep() {
		return keep;
	}
	/**
	 * 设置存入金额
	 * @param keep 存入金额
	 */
	public void setKeep(Double keep) {
		this.keep = keep;
	}
	/**
	 * 获取支出金额
	 * @return 支出金额
	 */
	public Double getPay() {
		return pay;
	}
	/**
	 * 设置支出金额
	 * @param pay 支出金额
	 */
	public void setPay(Double pay) {
		this.pay = pay;
	}
	/**
	 * 获取记录日期
	 * @return 记录日期
	 */
	public String getCreatedate() {
		return createdate;
	}
	/**
	 * 设置记录日期
	 * @param createdate 记录日期
	 */
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	/**
	 * 获取ID
	 * @return ID
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置ID
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
 /**
  * 获取用户名
  * @return 用户名
  */
	public String getLoginname() {
		return loginname;
	}
	/**
	 * 设置用户名
	 * @param loginname 用户名
	 */
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	
	/**
	 * 获取备注
	 * @return 备注
	 */
	public String getReamark() {
		return reamark;
	}
	/**
	 * 设置备注
	 * @param reamark 备注
	 */
	public void setReamark(String reamark) {
		this.reamark = reamark;
	}
	/**
	 * 获取关联ID
	 * @return 关联ID
	 */
	public String getRelatedid() {
		return relatedid;
	}
	/**
	 * 设置关联ID
	 * @param relatedid 关联ID
	 */
	public void setRelatedid(String relatedid) {
		this.relatedid = relatedid;
	}
	/**
	 * 获取关联类型
	 * @return 关联类型
	 */
	public String getRelatedtype() {
		return relatedtype;
	}
	/**
	 * 设置关联类型
	 * @param relatedtype 关联类型
	 */
	public void setRelatedtype(String relatedtype) {
		this.relatedtype = relatedtype;
	}
	/**
	 * 获取摘要
	 * @return 摘要
	 */
	public String getSummary() {
		return summary;
	}
	/**
	 * 设置摘要
	 * @param summary 摘要
	 */
	public void setSummary(String summary) {
		this.summary = summary;
	}

}
