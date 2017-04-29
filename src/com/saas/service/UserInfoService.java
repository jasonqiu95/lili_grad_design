package com.saas.service;

import java.util.List;

import com.saas.po.UserInfo;

public interface UserInfoService {
	
	/**用户注册*/
	public void add(UserInfo user) throws Exception;
	
	/**用户登录*/
	public UserInfo login(String account,String password,String tenantname)throws IndexOutOfBoundsException;
	
	/**检测用户名是否存在*/
	public boolean checkUserName(String username,String tenant);

	/**删除用户*/
	public void delete(UserInfo user)throws Exception;

	/**修改用户*/
	public void update(UserInfo user)throws Exception;
	
	/**通过用户id查询用户信息*/
	public UserInfo getUser(Integer userId)throws Exception;
	
	/**通过用户名查询用户信息*/
	public UserInfo getUserName(String username)throws Exception;
	
	/**查询所有用户*/
	public List<UserInfo> getAllUser()throws Exception;
	
	
}
