package cn.gov.cnis.cssn.wssort;

import java.io.Serializable;
/**
 * 
 * 提供标准题录类
 *
 */
public class Standard implements Serializable{
	private String a001; //记录标识符
	private String a100; //文献号
	private String a000; //记录状态
	private String A101;//发布或出版日期
	private String A104;//发布单位
	private String a205;//实施或试行日期
	private String a206;//废止日期
	private String a207;//确认日期
	private String a850;//标准类型
	private String a298;//中文标准名称
	private String a300;//标准语种
	private String a301;//原文标准名称
	private String a302;// 英文标准名称
	private String a825;//中国标准分类号
	private String a826;//国际标准分类号
	private String resultStr;
	public String getResultStr() {
		return resultStr;
	}
	public void setResultStr(String resultStr) {
		this.resultStr = resultStr;
	}
	/**
	 * 获取记录识别符
	 */
	public String getA001() {
		return a001;
	}
	/**
	 * 设置记录识别符
	 * @param a001 记录识别符
	 */
	public void setA001(String a001) {
		this.a001 = a001;
	}
	/**
	 * 获取标准号
	 * @return 标准号
	 */
	public String getA100() {
		return a100;
	}
	/**
	 * 设置标准号
	 * @param a100 标准号
	 */
	public void setA100(String a100) {
		this.a100 = a100;
	}
	/**
	 * 获取记录状态
	 * @return 记录状态
	 */
	public String getA000() {
		return a000;
	}
	/**
	 * 设置记录状态
	 * @param a000 记录状态
	 */
	public void setA000(String a000) {
		this.a000 = a000;
	}
	/**
	 * 获取发布时间
	 * @return 发布时间
	 */
	public String getA101() {
		return A101;
	}
	/**
	 * 设置发布时间
	 * @param a101 发布时间
	 */
	public void setA101(String a101) {
		A101 = a101;
	}
	/**
	 * 获取发布单位
	 * @return 发布单位
	 */
	public String getA104() {
		return A104;
	}
	/**
	 * 设置发布单位
	 * @param a104 发布单位
	 */
	public void setA104(String a104) {
		A104 = a104;
	}
	/**
	 * 获取实施时间
	 * @return 实施时间
	 */
	public String getA205() {
		return a205;
	}
	/**
	 * 设置实施日期
	 * @param a205 实施日期
	 */
	public void setA205(String a205) {
		this.a205 = a205;
	}
	/**
	 * 获取作废日期
	 * @return 作废日期
	 */
	public String getA206() {
		return a206;
	}
	/**
	 * 设置作废日期
	 * @param a206 作废日期
	 */
	public void setA206(String a206) {
		this.a206 = a206;
	}
	/**
	 * 获取确认日期
	 * @return 确认日期
	 */
	public String getA207() {
		return a207;
	}
	/**
	 * 设置确认日期
	 * @param a207 确认日期
	 */
	public void setA207(String a207) {
		this.a207 = a207;
	}
	/**
	 * 获取标准类型
	 * @return 标准类型
	 */
	public String getA850() {
		return a850;
	}
	/**
	 * 设置标准类型
	 * @param a850 标准类型
	 */
	public void setA850(String a850) {
		this.a850 = a850;
	}
	/**
	 * 获取中文名称
	 * @return 中文名称
	 */
	public String getA298() {
		return a298;
	}
	/**
	 * 设置中文名称
	 * @param a298 中文名称
	 */
	public void setA298(String a298) {
		this.a298 = a298;
	}
	/**
	 * 获取正文语种
	 * @return 正文语种
	 */
	public String getA300() {
		return a300;
	}
	/**
	 * 设置正文语种
	 * @param a300 正文语种
	 */
	public void setA300(String a300) {
		this.a300 = a300;
	}
	/**
	 * 获取原文标准名称
	 * @return 原文标准名称
	 */
	public String getA301() {
		return a301;
	}
	/**
	 * 设置原文标准名称
	 * @param a301 原文标准名称
	 */
	public void setA301(String a301) {
		this.a301 = a301;
	}
	/**
	 * 获取英文名称
	 * @return 英文名称
	 */
	public String getA302() {
		return a302;
	}
	/**
	 * 设置英文名称
	 * @param a302 英文名称
	 */
	public void setA302(String a302) {
		this.a302 = a302;
	}
	/**
	 * 获取中国标准分类号
	 * @return 中国标准分类号
	 */
	public String getA825() {
		return a825;
	}
	/**
	 * 设置中国标准分类号
	 * @param a825 中国标准分类号
	 */
	public void setA825(String a825) {
		this.a825 = a825;
	}
	/**
	 * 获取国际标准分类号
	 * @return 国际标准分类号
	 */
	public String getA826() {
		return a826;
	}
	/**
	 * 设置国际标准分类号
	 * @param a826 国际标准分类号
	 */
	public void setA826(String a826) {
		this.a826 = a826;
	}
	
}
