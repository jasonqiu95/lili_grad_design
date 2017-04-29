package cn.gov.cnis.cssn.wssort;

import java.io.Serializable;
/**
 * 
 * 鎻愪緵鏍囧噯璺熻釜绫�
 *
 */
public class StandardTracking implements Serializable{
	private String id;//ID鍙�
	private String a001;//璁板綍鏍囪瘑绗�
	private String A100;//鏍囧噯鍙�
	private String a298a302;//鏍囧噯鍚嶇О
	private String a000;//鏍囧噯鐘舵�
	private String createDate;//璁㈤槄鏃ヨ捣
	private String source;//璁板綍鏉ユ簮
	private String status;
	private Pagination pagination;
	/**
	 * 鑾峰彇浠樻鐘舵�
	 * @return 浠樻鐘舵�
	 */
	public String getStatus() {
		return status;
	}
	
	
	/**
	 * 璁剧疆浠樻鐘舵�
	 * @param status 浠樻鐘舵�
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * 鑾峰彇ID
	 * @return  鐘舵�
	 */
	public String getId() {
		return id;
	}
	/**
	 * 璁剧疆id
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * 鑾峰彇璁板綍璇嗗埆绗�
	 * @return  璁板綍璇嗗埆绗�
	 */
	public String getA001() {
		return a001;
	}
	/**
	 * 璁剧疆璁板綍璇嗗埆绗�
	 * @param a001 璁板綍璇嗗埆绗�
	 */
	public void setA001(String a001) {
		this.a001 = a001;
	}
	/**
	 * 鑾峰彇鏍囧噯鍙�
	 * @return 鏍囧噯鍙�
	 */
	public String getA100() {
		return A100;
	}
	/**
	 * 璁剧疆鏍囧噯鍙�
	 * @param a100 鏍囧噯鍙�
	 */
	public void setA100(String a100) {
		A100 = a100;
	}
	/**
	 * 鑾峰彇涓嫳鏂囧悕绉�
	 * @return 涓嫳鏂囧悕绉�
	 */
	public String getA298a302() {
		return a298a302;
	}
	/**
	 * 璁剧疆涓嫳鏂囧悕绉�
	 * @param a298a302 涓嫳鏂囧悕绉�
	 */
	public void setA298a302(String a298a302) {
		this.a298a302 = a298a302;
	}
	/**
	 * 鑾峰彇鏍囧噯鐘舵�
	 * @return 鏍囧噯鐘舵�
	 */
	public String getA000() {
		return a000;
	}
	/**
	 * 璁剧疆鏍囧噯鐘舵�
	 * @param a000 鏍囧噯鐘舵�
	 */
	public void setA000(String a000) {
		this.a000 = a000;
	}
	/**
	 * 鑾峰彇鍒涘缓鏃堕棿
	 * @return 鍒涘缓鏃堕棿
	 */
	public String getCreateDate() {
		return createDate;
	}
	/**
	 * 璁剧疆鍒涘缓鏃堕棿
	 * @param createDate 鍒涘缓鏃堕棿
	 */
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	/**
	 * 鑾峰彇璁板綍鏉ユ簮
	 * @return 璁板綍鏉ユ簮
	 */
	public String getSource() {
		return source;
	}
	/**
	 * 璁剧疆璁板綍鏉ユ簮
	 * @param source 璁板綍鏉ユ簮
	 */
	public void setSource(String source) {
		this.source = source;
	}
	
	public Pagination getPagination() {
		return pagination;
	}
	
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
}
