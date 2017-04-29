package com.saas.service;

import java.util.List;

import com.saas.po.TenantInfo;

public interface TenantInfoService {
	
	/**添加租户*/
	public void add(TenantInfo tenant) throws Exception;
	
	/**检测租户名是否存在*/
	public boolean checkTenantName(String tenant);

	/**删除用户*/
	public void delete(TenantInfo tenant)throws Exception;

	/**修改用户
	 * @return */
	public boolean update(TenantInfo tenant)throws Exception;
	
	/**通过租户url查询租户信息*/
	public List<TenantInfo> getTenantbyUrl(String url)throws Exception;
	
	/**通过租户名查询用户信息*/
	public TenantInfo getTenantbyName(String tenantname)throws Exception;
	
	/**查询所有用户*/
	public List<TenantInfo> getAllTenant()throws Exception;
	
	
}
