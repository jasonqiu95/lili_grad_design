package cn.gov.cnis.cssn.wssort;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
/**
 * 
 * 提供中国标准分类的类
 *
 */
public class Ccs implements Serializable {

	private Long id;

	private String cn;

	private String cc;

	private String prt;

	/**
	 * 获取ID信息
	 */
	public Long getId() {
		return id;
	}

	/**
	 * 设置ID信息
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 获取代号信息
	 */
	public String getCn() {
		return cn;
	}

	/**
	 * 设置代号信息
	 */
	public void setCn(String cn) {
		this.cn = cn;
	}

	/**
	 * 获取中文名称信息
	 */
	public String getCc() {
		return cc;
	}

	/**
	 * 设置中文名称信息
	 */
	public void setCc(String cc) {
		this.cc = cc;
	}

	/**
	 * 获取代号加中文名称信息
	 */
	public String getPrt() {
		return prt;
	}

	/**
	 * 设置代号加中文名称信息
	 */
	public void setPrt(String prt) {
		this.prt = prt;
	}

	private void readObject(ObjectInputStream ois) throws IOException,
			ClassNotFoundException {
		ois.defaultReadObject();
	}

	private void writeObject(ObjectOutputStream oos) throws IOException {
		oos.defaultWriteObject();
	}

}
