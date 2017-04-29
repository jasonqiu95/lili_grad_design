/*
 * WARNING: DO NOT EDIT THIS FILE. This is a generated file that is synchronized
 * by MyEclipse Hibernate tool integration.
 *
 * Created Thu Nov 09 16:49:34 CST 2006 by MyEclipse Hibernate Tool.
 */
package com.estarcom.cnis.cssn.salesystem.order.service;

import java.io.Serializable;
import java.util.Date;

/**
 * 地方平台接口防伪日志  lixiankai 2013-11-07
 * @author Administrator
 *
 */
public abstract class AbstractTProductStandard
    implements Serializable
{
    
    private String a000;   // 记录状态
    private Long a001;   // 记录标识符
    private String a003;   // 记录日期
	private String a010;   // ISBN国际统一书号
	private String a011;   // ISSN国际统一期刊
	private String a100;   // 文献号
	private String a101;   // 发布或出版日期
	private String a102;   // 发布或出版单位
	private String a103;   // 版本
	private String a104;   //发布单位
	private String a200;   // 文献状态
	private String a203;   // 适用范围
	private String a205;   // 实施或试行日期
	private String a206;   // 废止日期
	private String a207;   // 确认日期
	private String a208;   // 原分类号
	private String a209;   // 技术责任者
	private String a210;   // 截止日期
	private String a298;   // 中文题名
	private String a300;   // 文献语种
	private String a301;   // 原文题名
	private String a302;   // 英文题名
	private String a305;   // 载体形态
	private String a309;   // 译文
	private Float a310;   // 价格
	private String a311;   // 文献载体
	private String a330;   // 文摘
	private String a404;   // 十进分类法分类号
	private String a409;   // 附注
	private String a448;   // 文献出处
	private String a461;   // 代替文献
	private String a462;   // 被代替文献
	private String a502;   // 引用文献
	private String a505;   // 有关法律
	private String a800;   // 采用关系
	private String a805;   // 第二文献号
	private String a820;   // 修改件
	private String a821;   // 被修改件
	private String a823;   // 补充件
	private String a824;   // 被补充件
	private String a825;   // 中国标准分类号
	private String a826;   // 国际标准分类号
	private String a835;
	private String a836;   // 中文主题词
    private String a837;   // 英文主题词   
	private String a838;   // 原文主题词
	private String a842;   // 主题标题
	private String a845;   // 索取号
	private String a846;   // 馆藏标志
	private String a847;   // 排序码
	private String a850;   // 标准类型
	private String a855;   // 标准水平
	private String a860;   // 文献类型
	private String a861;   // 卷期号
	private String a863;   // 文献代号
	private String a864;   // 出版周期
	private String a885;   // 国别
	private String C001;   //通讯标示
	private Long drm_a001;//正版销售A001;
	private String fileName; //文件名
	
	private int filesize;     //文件大小
	private String function; //功能
	private String hasElec;   // 是否有电子文档(是:1)
	private int hashValue = 0;
	private Long id;     // 编号
	private String language;  //语言
	private String legal_from; //正版来源
	private int pagenum;   // 全文页数
	private String tc;         //分类
	private Float unitPrice;   //单价
	
    private Date updateDate;   //更新时间
    private String updateType; //更新类型
    
    
	

	


	




	public AbstractTProductStandard() {
		super();
	}


	public AbstractTProductStandard(Long id) {
		super();
		this.id = id;
	}


	public boolean equals(Object rhs)
    {
        if (rhs == null)
            return false;
        if (! (rhs instanceof DrmProductStandard))
            return false;
        DrmProductStandard that = (DrmProductStandard) rhs;
        if (this.getId() == null || that.getId() == null)
            return false;
        return (this.getId().equals(that.getId()));
    }


	public String getA000() {
		return a000;
	}


	public Long getA001() {
		return a001;
	}


	public String getA003() {
		return a003;
	}


	public String getA010() {
		return a010;
	}


	public String getA011() {
		return a011;
	}


	public String getA100() {
		return a100;
	}




	public String getA101() {
		return a101;
	}


	public String getA102() {
		return a102;
	}


	public String getA103() {
		return a103;
	}


	public String getA104() {
		return a104;
	}


	public String getA200() {
		return a200;
	}


	public String getA203() {
		return a203;
	}


	public String getA205() {
		return a205;
	}


	public String getA206() {
		return a206;
	}


	public String getA207() {
		return a207;
	}


	public String getA208() {
		return a208;
	}


	public String getA209() {
		return a209;
	}


	public String getA210() {
		return a210;
	}


	public String getA298() {
		return a298;
	}


	public String getA300() {
		return a300;
	}


	public String getA301() {
		return a301;
	}


	public String getA302() {
		return a302;
	}


	public String getA305() {
		return a305;
	}


	public String getA309() {
		return a309;
	}


	public Float getA310() {
		return a310;
	}


	public String getA311() {
		return a311;
	}


	public String getA330() {
		return a330;
	}


	public String getA404() {
		return a404;
	}


	public String getA409() {
		return a409;
	}


	public String getA448() {
		return a448;
	}


	public String getA461() {
		return a461;
	}


	public String getA462() {
		return a462;
	}


	public String getA502() {
		return a502;
	}


	public String getA505() {
		return a505;
	}


	public String getA800() {
		return a800;
	}


	public String getA805() {
		return a805;
	}


	public String getA820() {
		return a820;
	}


	public String getA821() {
		return a821;
	}


	public String getA823() {
		return a823;
	}


	public String getA824() {
		return a824;
	}


	public String getA825() {
		return a825;
	}


	public String getA826() {
		return a826;
	}


	public String getA835() {
		return a835;
	}


	public String getA836() {
		return a836;
	}


	public String getA837() {
		return a837;
	}


	public String getA838() {
		return a838;
	}


	public String getA842() {
		return a842;
	}


	public String getA845() {
		return a845;
	}


	public String getA846() {
		return a846;
	}


	public String getA847() {
		return a847;
	}


	


	public String getA850() {
		return a850;
	}


	public String getA855() {
		return a855;
	}


	public String getA860() {
		return a860;
	}


	public String getA861() {
		return a861;
	}


	public String getA863() {
		return a863;
	}


	public String getA864() {
		return a864;
	}


	public String getA885() {
		return a885;
	}


	public String getC001() {
		return C001;
	}


	public Long getDrm_a001() {
		return drm_a001;
	}


	public String getFileName() {
		return fileName;
	}


	public int getFilesize() {
		return filesize;
	}


	public String getFunction() {
		return function;
	}


	public String getHasElec() {
		return hasElec;
	}


	public int getHashValue() {
		return hashValue;
	}


	public Long getId() {
		return id;
	}


	public String getLanguage() {
		return language;
	}


	public String getLegal_from() {
		return legal_from;
	}


	public int getPagenum() {
		return pagenum;
	}


	public String getTc() {
		return tc;
	}


	public Float getUnitPrice() {
		return unitPrice;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public String getUpdateType() {
		return updateType;
	}


	public int hashCode()
    {
        if (this.hashValue == 0)
        {
            int result = 17;
            int itemIdValue = this.getId() == null ? 0 : this.getId().hashCode();
            result = result * 37 + itemIdValue;
            this.hashValue = result;
        }
        return this.hashValue;
    }


	public void setA000(String a000) {
		this.a000 = a000;
	}


	public void setA001(Long a001) {
		this.a001 = a001;
	}


	public void setA003(String a003) {
		this.a003 = a003;
	}


	public void setA010(String a010) {
		this.a010 = a010;
	}


	public void setA011(String a011) {
		this.a011 = a011;
	}


	public void setA100(String a100) {
		this.a100 = a100;
	}


	public void setA101(String a101) {
		this.a101 = a101;
	}


	public void setA102(String a102) {
		this.a102 = a102;
	}


	public void setA103(String a103) {
		this.a103 = a103;
	}


	public void setA104(String a104) {
		this.a104 = a104;
	}


	public void setA200(String a200) {
		this.a200 = a200;
	}


	public void setA203(String a203) {
		this.a203 = a203;
	}


	public void setA205(String a205) {
		this.a205 = a205;
	}


	public void setA206(String a206) {
		this.a206 = a206;
	}


	public void setA207(String a207) {
		this.a207 = a207;
	}


	public void setA208(String a208) {
		this.a208 = a208;
	}


	public void setA209(String a209) {
		this.a209 = a209;
	}


	public void setA210(String a210) {
		this.a210 = a210;
	}


	public void setA298(String a298) {
		this.a298 = a298;
	}


	public void setA300(String a300) {
		this.a300 = a300;
	}


	public void setA301(String a301) {
		this.a301 = a301;
	}


	public void setA302(String a302) {
		this.a302 = a302;
	}


	public void setA305(String a305) {
		this.a305 = a305;
	}


	public void setA309(String a309) {
		this.a309 = a309;
	}


	public void setA310(Float a310) {
		this.a310 = a310;
	}


	public void setA311(String a311) {
		this.a311 = a311;
	}


	public void setA330(String a330) {
		this.a330 = a330;
	}


	public void setA404(String a404) {
		this.a404 = a404;
	}


	public void setA409(String a409) {
		this.a409 = a409;
	}


	public void setA448(String a448) {
		this.a448 = a448;
	}


	public void setA461(String a461) {
		this.a461 = a461;
	}


	public void setA462(String a462) {
		this.a462 = a462;
	}


	public void setA502(String a502) {
		this.a502 = a502;
	}


	public void setA505(String a505) {
		this.a505 = a505;
	}


	public void setA800(String a800) {
		this.a800 = a800;
	}


	public void setA805(String a805) {
		this.a805 = a805;
	}


	public void setA820(String a820) {
		this.a820 = a820;
	}


	public void setA821(String a821) {
		this.a821 = a821;
	}


	public void setA823(String a823) {
		this.a823 = a823;
	}


	public void setA824(String a824) {
		this.a824 = a824;
	}


	public void setA825(String a825) {
		this.a825 = a825;
	}


	public void setA826(String a826) {
		this.a826 = a826;
	}


	public void setA835(String a835) {
		this.a835 = a835;
	}


	public void setA836(String a836) {
		this.a836 = a836;
	}


	public void setA837(String a837) {
		this.a837 = a837;
	}


	public void setA838(String a838) {
		this.a838 = a838;
	}


	public void setA842(String a842) {
		this.a842 = a842;
	}


	public void setA845(String a845) {
		this.a845 = a845;
	}


	public void setA846(String a846) {
		this.a846 = a846;
	}


	public void setA847(String a847) {
		this.a847 = a847;
	}


	public void setA850(String a850) {
		this.a850 = a850;
	}


	public void setA855(String a855) {
		this.a855 = a855;
	}


	public void setA860(String a860) {
		this.a860 = a860;
	}


	public void setA861(String a861) {
		this.a861 = a861;
	}


	public void setA863(String a863) {
		this.a863 = a863;
	}


	public void setA864(String a864) {
		this.a864 = a864;
	}


	public void setA885(String a885) {
		this.a885 = a885;
	}


	public void setC001(String c001) {
		C001 = c001;
	}


	public void setDrm_a001(Long drm_a001) {
		this.drm_a001 = drm_a001;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}


	public void setFunction(String function) {
		this.function = function;
	}


	public void setHasElec(String hasElec) {
		this.hasElec = hasElec;
	}


	public void setHashValue(int hashValue) {
		this.hashValue = hashValue;
	}


	public void setId(Long id) {
		this.id = id;
	}

    
    public void setLanguage(String language) {
		this.language = language;
	}


	public void setLegal_from(String legal_from) {
		this.legal_from = legal_from;
	}


	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}


	public void setTc(String tc) {
		this.tc = tc;
	}


	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public void setUpdateType(String updateType) {
		this.updateType = updateType;
	}


	

	

	
}
