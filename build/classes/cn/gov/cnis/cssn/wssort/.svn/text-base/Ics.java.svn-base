package cn.gov.cnis.cssn.wssort;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
/**
 * 提供国际标准分类的类
 * 
 *
 */
public class Ics implements Serializable {

	private Long id;
	private String icsn;
	private String eName;
	private String cName;
	private String eNote;
	private String cNote;
	private String prt;
	private void readObject(ObjectInputStream ois) throws IOException,
			ClassNotFoundException {
		ois.defaultReadObject();
	}

	private void writeObject(ObjectOutputStream oos) throws IOException {
		oos.defaultWriteObject();
	}
/**
 * 获取ID号
 * @return ID
 */
	public Long getId() {
		return id;
	}
/**
 * 设置ID号
 * @param id
 */
	public void setId(Long id) {
		this.id = id;
	}
/**
 * 获取代号
 * @return
 */
	public String getIcsn() {
		return icsn;
	}
/**
 * 设置代号
 * @param icsn
 */
	public void setIcsn(String icsn) {
		this.icsn = icsn;
	}
/**
 * 获取英文名称
 * @return 英文名称
 */
	public String geteName() {
		return eName;
	}
/**
 * 设置英文名称
 * @param eName 英文名称
 */
	public void seteName(String eName) {
		this.eName = eName;
	}
/**
 * 获取中文名称
 * @return 中文名称
 */
	public String getcName() {
		return cName;
	}
/**
 * 设置中文名称
 * @param cName
 */
	public void setcName(String cName) {
		this.cName = cName;
	}
/**
 * 获取英文注解
 * @return 英文注解
 */
	public String geteNote() {
		return eNote;
	}
/**
 * 设置英文注解
 * @param eNote 英文注解
 */
	public void seteNote(String eNote) {
		this.eNote = eNote;
	}
/**
 * 获取中文注解
 * @return 中文注解
 */
	public String getcNote() {
		return cNote;
	}
 /**
  * 设置中文注解
  * @param cNote 中文注解
  */
	public void setcNote(String cNote) {
		this.cNote = cNote;
	}
/**
 * 获取代号加名称
 * @return 代号加名称
 */
	public String getPrt() {
		return prt;
	}
/**
 * 设置代号加名称
 * @param prt 代号加名称
 */
	public void setPrt(String prt) {
		this.prt = prt;
	}


}
