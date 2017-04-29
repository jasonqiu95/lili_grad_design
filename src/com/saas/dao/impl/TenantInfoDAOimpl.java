package com.saas.dao.impl;


import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;







import com.saas.dao.TenantInfoDAO;
import com.saas.po.TenantInfo;

public class TenantInfoDAOimpl extends HibernateDaoSupport implements TenantInfoDAO {
	@Override
	public void add (TenantInfo user) {

		this.getHibernateTemplate().save(user);
	}

	@Override
	public void delete(TenantInfo user) {
		this.getHibernateTemplate().delete(user);
		
	}

	@Override
	public boolean update(TenantInfo user) {
		this.getHibernateTemplate().update(user);
		return false;
		
	}

	@Override
	public List<TenantInfo>  getTenantbyUrl(String url) {
		String hql = "from TenantInfo where t_domain='"+url+"'";
//		String hql="from UserInfo  where account=:account and password= :password";

		Query query =  this.currentSession().createQuery(hql);	

		List<TenantInfo> list=query.list();

		return list;
	}

	@Override 
	public List<TenantInfo> getAllTenant() {
		String hql = "from TenantInfo";
		Query query =  this.currentSession().createQuery(hql);	
		return query.list();
	}

	@Override
	public TenantInfo getTenantbyName(String tenantname) {
		
		return this.getHibernateTemplate().get(TenantInfo.class,tenantname);
	}
	
	@Override
	public boolean checkTenantName(String tenant) {
		String hql = "from TenantInfo t where t.tenant_name='"+tenant+"'";
		Query query =  this.currentSession().createQuery(hql);	
		List<TenantInfo> list=query.list();
		if(list.size() > 0){
			return true;
		}
		return false;
	}
	
	@Override
	public boolean updateInfo(Integer id,String account, String name, String password,String domain,String email, String telephone, String phone, String address,int totaltimes,int totalusernum,int usedtimes,int realusernum) {
		TenantInfo t =(TenantInfo) this.getTenantbyUrl(domain).get(0);
		t.setPassword(password);
		t.setName(name);
		t.setTelephone(telephone);
		t.setPhone(phone);
		t.setAddress(address);
		t.setEmail(email);
		t.setdomain(domain);
		t.settotaltimes(totaltimes);
		t.settotalusernum(totalusernum);
		t.setusedTimes(usedtimes);
		t.setRealusernum(realusernum);
		return this.update(t);
	}
	

}
