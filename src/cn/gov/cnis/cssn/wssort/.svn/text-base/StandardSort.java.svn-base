package cn.gov.cnis.cssn.wssort;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;


/**
 * 
 * 提供标准品种类
 *
 */
public class StandardSort implements Serializable {

	private String id;
    private String description;
    private String domain;
    private String subType;
//    private String orgcode;
//    private String cn_abbr;
    
    
    /**
     * 获取数据库品种
     */
	public String getId() {
		return id;
	}

	/**
	 * 设置获取数据库品种
	 * @param id 获取数据库品种
	 */
	public void setId(String id) {
		this.id = id;
	}
/**
 * 获取描述
 * @return 描述
 */
	public String getDescription() {
		return description;
	}

	/**
	 * 设置描述
	 * @param description 描述
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * 获取标准分类
	 * @return 标准分类
	 */
	public String getDomain() {
		return domain;
	}
/**
 * 设置
 * @param domain 标准分类
 */
	public void setDomain(String domain) {
		this.domain = domain;
	}
/**
 * 设置标准子分类
 * @return 标准子分类
 */
	public String getSubType() {
		return subType;
	}
/**
 * 获取
 * @param subType  标准子分类
 */
	public void setSubType(String subType) {
		this.subType = subType;
	}
	private void readObject(ObjectInputStream ois) throws IOException,
			ClassNotFoundException {
		ois.defaultReadObject();
	}

	private void writeObject(ObjectOutputStream oos) throws IOException {
		oos.defaultWriteObject();
	}

}
