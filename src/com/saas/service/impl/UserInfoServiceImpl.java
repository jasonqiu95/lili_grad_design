package com.saas.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saas.dao.UserInfoDAO;
import com.saas.po.UserInfo;
import com.saas.service.UserInfoService;


/**
 * ҵ���߼���
 * @author GoodHaHa
 *
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired
	private UserInfoDAO userDao;
			
	@Override
	public void add(UserInfo user) throws Exception {
	
			if(user!=null){
				userDao.add(user);
			}
	}

	public void setUserDao(UserInfoDAO userDao){
		this.userDao = userDao;
	}

	@Override
	public void delete(UserInfo user) throws Exception {
	
//		if(user!=null && user.getUserId()!=null){
//			UserInfo puser =userDao.getUser(user.getUserId());
//			
//			if(puser!=null){
//				userDao.delete(puser);
//			}
//		}
	}
	@Override
	public void update(UserInfo user) throws Exception {
//		if(user!=null && user.getUserId()!=null){
//			UserInfo puser =userDao.getUser(user.getUserId());
//			
//			if(puser!=null){
//				puser.setUserName(user.getUserName());
//				puser.setUserAge(user.getUserAge());
//				userDao.update(puser);
//			}
//		}
	}

	@Override
	public UserInfo getUser(Integer userId) throws Exception {
		if(userId!=null){
			return userDao.getUser(userId);
		}
		return null;
	}

	@Override
	public List<UserInfo> getAllUser() throws Exception {

		return userDao.getAllUser();
	}

	@Override
	public UserInfo getUserName(String username) throws Exception {
		if(username!=null){
			return userDao.getUserName(username);
		}
		return null;
	}

	@Override
	public UserInfo login(String account, String password,String tenantname)
			throws IndexOutOfBoundsException {
			return userDao.login(account, password,tenantname);

	}

	@Override
	public boolean checkUserName(String username,String tenant) {
		// TODO Auto-generated method stub
		if(username!=null){
			return userDao.checkUserName(username,tenant);
		}
		return false;
	}
}
