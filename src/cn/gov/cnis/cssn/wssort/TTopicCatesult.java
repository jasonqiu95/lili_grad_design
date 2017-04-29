package cn.gov.cnis.cssn.wssort;

import java.io.Serializable;


public class TTopicCatesult implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long ID;
	private String dataId;
	private String A100;
	private String A298;
	private String A302;
	private String A104;
	private String A205;
	private String categoryID;
	private String workId;
	private String userId;
	private String userName;
	private String updateTime;
	private String state;
	private String memo;
	
	public TTopicCatesult() {

	}

	public TTopicCatesult(Long iD, String dataId, String a100, String a298, String a302,
			String a104, String a205, String categoryID, String workId, String userId,
			String userName, String updateTime, String state, String memo) {
		ID = iD;
		this.dataId = dataId;
		A100 = a100;
		A298 = a298;
		A302 = a302;
		A104 = a104;
		A205 = a205;
		this.categoryID = categoryID;
		this.workId = workId;
		this.userId = userId;
		this.userName = userName;
		this.updateTime = updateTime;
		this.state = state;
		this.memo = memo;
	}

	
	public Long getID() {
	
		return ID;
	}

	
	public void setID(Long iD) {
	
		ID = iD;
	}

	
	public String getDataId() {
	
		return dataId;
	}

	
	public void setDataId(String dataId) {
	
		this.dataId = dataId;
	}

	
	public String getA100() {
	
		return A100;
	}

	
	public void setA100(String a100) {
	
		A100 = a100;
	}

	
	public String getA298() {
	
		return A298;
	}

	
	public void setA298(String a298) {
	
		A298 = a298;
	}

	
	public String getA302() {
	
		return A302;
	}

	
	public void setA302(String a302) {
	
		A302 = a302;
	}

	
	public String getA104() {
	
		return A104;
	}

	
	public void setA104(String a104) {
	
		A104 = a104;
	}

	
	public String getA205() {
	
		return A205;
	}

	
	public void setA205(String a205) {
	
		A205 = a205;
	}

	
	public String getCategoryID() {
	
		return categoryID;
	}

	
	public void setCategoryID(String categoryID) {
	
		this.categoryID = categoryID;
	}

	
	public String getWorkId() {
	
		return workId;
	}

	
	public void setWorkId(String workId) {
	
		this.workId = workId;
	}

	
	public String getUserId() {
	
		return userId;
	}

	
	public void setUserId(String userId) {
	
		this.userId = userId;
	}

	
	public String getUserName() {
	
		return userName;
	}

	
	public void setUserName(String userName) {
	
		this.userName = userName;
	}

	
	public String getUpdateTime() {
	
		return updateTime;
	}

	
	public void setUpdateTime(String updateTime) {
	
		this.updateTime = updateTime;
	}

	
	public String getState() {
	
		return state;
	}

	
	public void setState(String state) {
	
		this.state = state;
	}

	
	public String getMemo() {
	
		return memo;
	}

	
	public void setMemo(String memo) {
	
		this.memo = memo;
	}

}
