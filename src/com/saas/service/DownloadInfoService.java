package com.saas.service;

import com.saas.po.DownloadInfo;

public interface DownloadInfoService {
	
	public void add(DownloadInfo dlinfo) throws Exception;
	
	public int checkTime();

	public int getDltimes();
	
	public boolean downloadRequest (String tenanturl);
	
	public boolean downloadnumadd(int addnum,String tenanturl) throws Exception;
	
}
