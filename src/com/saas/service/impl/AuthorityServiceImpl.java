package com.saas.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saas.dao.CustomizationInfoDAO;
import com.saas.dao.UserInfoDAO;
import com.saas.po.CustomizationInfo;
import com.saas.po.UserInfo;
import com.saas.service.AuthorityService;

@Service
public class AuthorityServiceImpl implements AuthorityService {
	@Autowired
	private UserInfoDAO userDao;
	
	@Autowired
	private CustomizationInfoDAO cusDao;
	
	@Override
	public boolean checkPermisson(int userName, int functionNum) {
		UserInfo userInfo = userDao.getUserName(userName);
		if (userInfo != null) {
			// user_info:emp_tenant_id has to match some entry in
			// cus_info:t_account
			String tenantId = userInfo.getTenant_id();
			CustomizationInfo cusInfo = cusDao.getCustomizationByTenant(tenantId);
			String function = cusInfo.getFunction();
			System.out.println(function);
		}
		return false;
	}
	
}
