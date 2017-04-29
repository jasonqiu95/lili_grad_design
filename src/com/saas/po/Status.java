package com.saas.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="status_info")
public class Status implements Serializable{
	public void status(String name) {
		this.setName(name);
	}
	
	public void status(Integer id) {
		this.setId(id);
	}
	
	private static final long serialVersionUID = 1L;

	@Id 
	@Column(name="status_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="status_name")
	private String name;
	
	
	@Column(name="status_desc")
	private String description;

	@OneToMany(targetEntity=TenantInfo.class, mappedBy="status",fetch=FetchType.EAGER)
	private Set<TenantInfo> tenants = new HashSet<TenantInfo>();

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<TenantInfo> getTenants() {
		return tenants;
	}

	public void setTenants(Set<TenantInfo> tenants) {
		this.tenants = tenants;
	}
	
	
}
