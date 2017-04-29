package com.saas.service.impl;

import java.util.List;














import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saas.dao.DownloadInfoDAO;
import com.saas.dao.TenantInfoDAO;
import com.saas.dao.UserInfoDAO;
import com.saas.po.DownloadInfo;
import com.saas.po.TenantInfo;
import com.saas.po.UserInfo;
import com.saas.service.DownloadInfoService;
import com.saas.service.TenantInfoService;
import com.saas.service.UserInfoService;


/**
 * ҵ���߼���
 * @author GoodHaHa
 *
 */
@Service
public class DownloadInfoServiceImpl implements DownloadInfoService {

	private static final int TenantInfo = 0;
	@Autowired
	private DownloadInfoDAO downloaddao;
	@Autowired
	TenantInfoService tenantInfoService;
	@Autowired
	TenantInfoDAO tenantInfoDAO;
	@Override
	public void add(DownloadInfo dlinfo)  throws Exception{
		if(dlinfo !=null){
			System.out.println(dlinfo.toString());
	     downloaddao.add(dlinfo);
		}
		else System.out.println("123");
	}

	@Override
	public int checkTime() {
		// TODO Auto-generated method stub
		return downloaddao.checkTime();
	}

	@Override
	public int getDltimes() {
		// TODO Auto-generated method stub
		return downloaddao.getDltimes();
	}

	/**
	 * 判断是否可以下载
	 */
	@Override
	public boolean downloadRequest(String tenanturl) {
		
		try {

			List<TenantInfo> list=(List<TenantInfo>) tenantInfoService.getTenantbyUrl(tenanturl);
			TenantInfo tenant=list.get(0);
			if(tenant.getusedTimes()<tenant.gettotaltimes()){
				return true;
			}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
	//更新下载次数
	@Override
	public boolean downloadnumadd(int addnum,String tenanturl) throws Exception {
		int list;

		List<TenantInfo> list1=(List<TenantInfo>)tenantInfoService.getTenantbyUrl(tenanturl);
		TenantInfo tenant=list1.get(0);
		tenant.setusedTimes(tenant.getusedTimes()+addnum);
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
		int usedtimes=tenant.getusedTimes()+addnum;
		int realusernum=tenant.getRealusernum();
		tenantInfoDAO.updateInfo(0, "", name, password, tenanturl, email, "", "", "downjia", totaltimes, totalusernum, usedtimes, realusernum);
		return false;
	}
}
