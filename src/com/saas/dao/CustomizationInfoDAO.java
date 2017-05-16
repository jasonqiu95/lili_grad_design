package com.saas.dao;

import com.saas.po.CustomizationInfo;

public interface CustomizationInfoDAO {
	public CustomizationInfo getCustomizationByTenant(String tenantAcc);
}
