package com.saas.dao.impl;


import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;





import com.saas.dao.UserInfoDAO;
import com.saas.po.UserInfo;

public class UserInfoDAOimpl extends HibernateDaoSupport implements UserInfoDAO {
	@Override
	public void add (UserInfo user) {

		this.getHibernateTemplate().save(user);
	}

	@Override
	public void delete(UserInfo user) {
		this.getHibernateTemplate().delete(user);
		
	}

	@Override
	public void update(UserInfo user) {
		this.getHibernateTemplate().update(user);
		
	}

	@Override
	public UserInfo getUser(Integer userId) {

		return this.getHibernateTemplate().get(UserInfo.class,userId);
	}

	@Override 
	public List<UserInfo> getAllUser() {
		String hql = "from UserInfo";
		Query query =  this.currentSession().createQuery(hql);	
		return query.list();
	}

	@Override
	public UserInfo getUserName(String username) {
		
		return this.getHibernateTemplate().get(UserInfo.class,username);
	}

	@Override
	public UserInfo login(String account, String password,String tenantname)
			throws IndexOutOfBoundsException {
		String hql = "from UserInfo where account='"+account+"' and password='"+password+"' and tenant_id='"+tenantname+"'";
//		String hql="from UserInfo  where account=:account and password= :password";

		Query query =  this.currentSession().createQuery(hql);	

		List<UserInfo> list=query.list();
		if(list.size() > 0){
			return list.get(0);
		}
		return null;

	}

	@Override
	public boolean checkUserName(String username,String tenant) {
		String hql = "from UserInfo u where u.account='"+username+"' and u.tenant_id='"+tenant+"'";
		Query query =  this.currentSession().createQuery(hql);	
		List<UserInfo> list=query.list();
		if(list.size() > 0){
			return true;
		}
		return false;
	}
	
	

}
