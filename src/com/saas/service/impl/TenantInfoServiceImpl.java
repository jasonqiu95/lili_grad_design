package com.saas.service.impl;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saas.dao.TenantInfoDAO;
import com.saas.po.TenantInfo;
import com.saas.service.TenantInfoService;


/**
 * ҵ���߼���
 * @author GoodHaHa
 *
 */
@Service
public class TenantInfoServiceImpl implements TenantInfoService {
	
	@Autowired
	private TenantInfoDAO tenantDao;
			
	@Override
	public void add(TenantInfo user) throws Exception {
	
			if(user!=null){
				tenantDao.add(user);
			}
	}

	/*public void setUserDao(TenantInfoDAO userDao){
		this.tenantDao = userDao;
	}*/

	@Override
	public void delete(TenantInfo user) throws Exception {
	
//		if(user!=null && user.getUserId()!=null){
//			UserInfo puser =userDao.getUser(user.getUserId());
//			
//			if(puser!=null){
//				userDao.delete(puser);
//			}
//		}
	}

	@Override
	public List<TenantInfo> getTenantbyUrl(String url) throws Exception {
		if(url!=null){
			return tenantDao.getTenantbyUrl(url);
		}
		return null;
	}

	@Override
	public List<TenantInfo> getAllTenant() throws Exception {

		return tenantDao.getAllTenant();
	}

	@Override
	public TenantInfo getTenantbyName(String tenantname) throws Exception {
		if(tenantname!=null){
			return tenantDao.getTenantbyName(tenantname);
		}
		return null;
	}

	@Override
	public boolean checkTenantName(String tenant) {
		// TODO Auto-generated method stub
		if(tenant!=null){
			return tenantDao.checkTenantName(tenant);
		}
		return false;
	}
	
	@Override
	public boolean update(TenantInfo tenant) throws Exception {
		if(tenant != null){
			Integer id = tenant.getId();
			String account = tenant.getAccount();
			String name = tenant.getName();
			String password = tenant.getPassword();
			String telephone = tenant.getTelephone();
			String phone = tenant.getPhone();
			String email = tenant.getEmail();
			String address = tenant.getAddress();
			String domain=tenant.getdomain();
			int totaltimes=tenant.gettotaltimes();
			int totalusernum=tenant.gettotalusernum();
			int usedtimes=tenant.getusedTimes();
			int realusernum=tenant.getRealusernum();
			System.out.println("servicescale:"+totalusernum);
			tenantDao.updateInfo(id,account,name,password,domain,email,telephone,phone,address,totaltimes,totalusernum,usedtimes,realusernum);
		}
		
		return false;
	}
}
