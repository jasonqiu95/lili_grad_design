 package com.saas.dao;


import java.util.List;

import com.saas.po.TenantInfo;
/**
 * 
 * @author GoodHaHa
 *  *
 */
public interface TenantInfoDAO {

	public void add(TenantInfo tenant);

	public boolean checkTenantName(String tenant);

	public void delete(TenantInfo tenant);

	public boolean update(TenantInfo tenant);

	public List<TenantInfo> getTenantbyUrl(String url);
	
	public TenantInfo getTenantbyName(String tenantname);

	public List<TenantInfo> getAllTenant();

	boolean updateInfo(Integer id, String account, String name,
			String password, String domain, String email, String telephone,
			String phone, String address, int totaltimes, int totalusernum,
			int usedtimes, int realusernum);

	
}