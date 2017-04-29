package com.saas.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name="tenant_info")
public class TenantInfo implements Serializable{
	
	
	private static final long serialVersionUID = 1L;

	@Id 
	@Column(name="t_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;	// 标识属性
	
	@Column(name="t_account", nullable=false, length=50)
	private String account;	//登录账号
	
	@Column(name="t_password", nullable=false, length=50)
	private String password; //登录密码
	
	@Column(name="t_domain",nullable=false,unique=true)
	private String domain;

	@Column(name="t_name",nullable=false)
	private String name; //公司名
	
	@Column(name="t_email")
	private String email;
	
	@Column(name="t_address")
	private String address;
	
	@Column(name="t_telephone")
	private String telephone;
	
	@Column(name="t_phone")
	private String phone;
	
//	@Column(name="t_status")
	@ManyToOne(targetEntity=Status.class)
	@JoinColumn(name="status_id", referencedColumnName="status_id")
	private Status status;
	
	@Column(name="create_date",updatable=false)
	private Date date;	//创建日期
	
	@Column(name="t_totaltimes")
	private int totaltimes;
	
	@Column(name="t_totalusernum")
	private int totalusernum;

	@Column(name="t_usedtimes")
	private int usedtimes;
	
	
	@Column(name="t_realusernum")
	private int realusernum;
	
//	@OneToOne(targetEntity=Customization.class,fetch=FetchType.EAGER)
//	@JoinColumn(name="c_id")
//	private Customization customizationInfo;
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getdomain() {
		return domain;
	}

	public void setdomain(String domain) {
		this.domain = domain;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int gettotaltimes() {
		return totaltimes;
	}

	public void settotaltimes(int times) {
		this.totaltimes = times;  
	}
	
	public int gettotalusernum() {
		return totalusernum;
	}
	
	public void settotalusernum(int totalusernum) {
		this.totalusernum = totalusernum;  
	}
	
	public int getusedTimes() {
		return usedtimes;
	}

	public void setusedTimes(int times) {
		this.usedtimes = times;  
	}
	
	public int getRealusernum() {
		return realusernum;
	}

	public void setRealusernum(int realusernum) {
		this.realusernum = realusernum;
	}
	
}
