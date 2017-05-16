 package com.saas.dao;


import java.util.List;

import com.saas.po.UserInfo;
/**
 * 
 * @author GoodHaHa
 *  *
 */
public interface UserInfoDAO {

	public void add(UserInfo user);
	
	public UserInfo login(String account,String password,String tenantname) throws IndexOutOfBoundsException;

	public boolean checkUserName(String username,String tenant);

	public void delete(UserInfo user);

	public void update(UserInfo user);

	public UserInfo getUser(Integer userId);
	
	public UserInfo getUserName(int username);

	public List<UserInfo> getAllUser();

	
}