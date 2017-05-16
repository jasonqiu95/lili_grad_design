package com.saas.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.saas.dao.TenantInfoDAO;
import com.saas.dao.UserInfoDAO;
import com.saas.po.TenantInfo;
import com.saas.po.UserInfo;
import com.saas.service.AuthorityService;

public class AuthorityServiceImpl implements AuthorityService {

	@Autowired
	private TenantInfoDAO tenantDao;
	
	@Autowired
	private UserInfoDAO userDao;

	@Override
	public boolean checkPermisson(UserInfo userInfo, int functionNum) {
		// TODO Auto-generated method stub
		if (userInfo != null) {
			String tenantName = userInfo.getTenant_id();
			TenantInfo tenant = tenantDao.getTenantbyName(tenantName);
			int function = tenant.get
		}
		
		return false;
	}
	
}
