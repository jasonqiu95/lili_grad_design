package com.saas.dao.impl;



import org.hibernate.Query;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.saas.dao.DownloadInfoDAO;
import com.saas.po.DownloadInfo;

public class DownloadInfoDAOimpl extends HibernateDaoSupport implements DownloadInfoDAO {
	
	@Override
	public void add (DownloadInfo dlinfo) {
		System.out.println("dao...");
		this.getHibernateTemplate().save(dlinfo);
	}

	@Override
	public int checkTime() {
		String hql = "select count(u.id) from DownloadInfo u";
		Query query =  this.currentSession().createQuery(hql);	
		int sum =Integer.parseInt(query.list().get(0).toString());
		return sum;
	}


	@Override
	public int getDltimes() {
		String hql = "select u.times from DownloadInfo u where u.id = 2 ";
		Query query =  this.currentSession().createQuery(hql);	
		int sum =Integer.parseInt(query.list().get(0).toString());
		return sum;
	}	

}
