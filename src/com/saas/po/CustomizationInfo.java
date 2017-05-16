package com.saas.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="customization_info")
public class CustomizationInfo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="c_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="t_account")
	private String TAccount;
	
	@Column(name="c_code")
	private String code;
	
	@Column(name="create_date")
	private Date date;
	
	@Column(name="c_dbname")
	private String dbname;
	
	@Column(name="c_dburl")
	private String dburl;
	
	@Column(name="c_duration")
	private String duration;
	
	@Column(name="c_function")
	private String function;
	
	@Column(name="c_scales")
	private String scales;
	
	@Column(name="c_times")
	private String times;
	
	@Column(name="c_url")
	private String url;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getTAccount() {
		return TAccount;
	}
	
	public void setTAccount(String account) {
		this.TAccount = account;
	}
	
	public String getCode() {
		return TAccount;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getDbname() {
		return dbname;
	}
	
	public void setDbname(String dbname) {
		this.dbname = dbname;
	}
	
	public String getDburl() {
		return dburl;
	}
	
	public void setDburl(String dburl) {
		this.dburl = dburl;
	}
	
	public String getDuration() {
		return duration;
	}
	
	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	public String getFunction() {
		return function;
	}
	
	public void setFunction(String function) {
		this.function = function;
	}
	
	public String getScales() {
		return function;
	}
	
	public void setScales(String scales) {
		this.scales = scales;
	}
	
	public String getTimes() {
		return function;
	}
	
	public void setTimes(String times) {
		this.times = times;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
}
