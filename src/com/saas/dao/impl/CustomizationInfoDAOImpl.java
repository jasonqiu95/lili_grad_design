package com.saas.dao.impl;

import com.saas.dao.CustomizationInfoDAO;
import com.saas.po.CustomizationInfo;
import com.saas.po.UserInfo;

import org.hibernate.Query;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

public class CustomizationInfoDAOImpl extends HibernateDaoSupport implements CustomizationInfoDAO{

	@Override
	public CustomizationInfo getCustomizationByTenant(String tenantAcc) {
		// TODO Auto-generated method stub
		String hql = "from Customization c where c.TAccount='"+tenantAcc+"'";
		Query q = this.currentSession().createQuery(hql);
		if(q.list() != null)
			return (CustomizationInfo) q.list().get(0);
		return null;
	}
	
}
