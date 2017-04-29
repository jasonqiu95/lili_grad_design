 package com.saas.dao;


import java.util.List;

import com.saas.po.DownloadInfo;

/**
 * 
 * @author GoodHaHa
 *  *
 */
public interface DownloadInfoDAO {

	public void add(DownloadInfo dlinfo);
	
	public int checkTime();

	public int getDltimes();
}