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
@Table(name="download_info")
public class DownloadInfo implements Serializable{

	private static final long serialVersionUID = 1L;

	private int id;
	
	private Date time;
	
	private String name;
	
	private int times;

	@Id 
	@Column(name="dl_id",nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="dl_name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="dl_time")
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Column(name="c_times")
	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	@Override
	public String toString() {
		return "DownloadInfo [id=" + id + ", time=" + time + ", name=" + name
				+ ", times=" + times + "]";
	}
	
	

	
}