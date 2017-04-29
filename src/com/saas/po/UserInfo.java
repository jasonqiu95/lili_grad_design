package com.saas.po;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="user_info")
public class UserInfo implements Serializable{

	private static final long serialVersionUID = 1L;

	private int id;
	
	private String name;
	
	private String account;
	
	private String password;
	
	private String tenant_id;
	
	private String real_account;
	
	private boolean availability;

	@Id 
	@Column(name="emp_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="emp_name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="emp_account",nullable=false)
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name="emp_password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name="emp_tenant_id",nullable=false)
	public String getTenant_id() {
		return tenant_id;
	}

	public void setTenant_id(String tenant_id) {
		this.tenant_id = tenant_id;
	}
	
	@Column(name="emp_real_account",nullable=false,unique=true)
	public String getreal_account() {
		return real_account;
	}

	public void setreal_account(String real_account) {
		this.real_account = real_account;
	}
	@Column(name="emp_availability")
	public boolean getavailability() {
		return availability;
	}

	public void setavailability(boolean availability) {
		this.availability = availability;
	}
	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", name=" + name + ", account=" + account
				+ ", password=" + password + ", tenant_id=" + tenant_id
				+", real_account=" + real_account+ ", availability=" + availability+"]";	
	}
	
	
	
}