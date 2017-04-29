package cn.gov.cnis.cssn.wssort;

import java.io.Serializable;

/**
 * 
 * 提供专题信息的类
 *
 */
public class TopicCategory implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String Uid;
	private String name;
	private String parentUid;
	
	public TopicCategory() {

	}

	/**
	 * 获取记录识别符
	 * @return 记录识别符
	 */
	public String getUid() {
	
		return Uid;
	}

	/**
	 * 设置记录识别符
	 * @param uid 记录识别符
	 */
	public void setUid(String uid) {
	
		Uid = uid;
	}

	/**
	 * 获取专题分类名称
	 * @return 专题分类名称
	 */
	public String getName() {
	
		return name;
	}

	/**
	 * 设置专题分类名称
	 * @param name 专题分类名称
	 */
	public void setName(String name) {
	
		this.name = name;
	}

	/**
	 * 获取父标示符 
	 * @return父标示符
	 */
	public String getParentUid() {
	
		return parentUid;
	}

	/**
	 * 设置父标示符
	 * @param parentUid 父标示符
	 */
	public void setParentUid(String parentUid) {
	
		this.parentUid = parentUid;
	}
	
}
