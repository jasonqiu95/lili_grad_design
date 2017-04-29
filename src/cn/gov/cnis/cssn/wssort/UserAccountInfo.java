package cn.gov.cnis.cssn.wssort;

import java.io.Serializable;
/**
 * 
 * 提供用户账户信息类
 *
 */

public class UserAccountInfo implements Serializable {
	private String AccountId;

	private String AccountRole;

	private String AccountMode;

	private String AccountBlance;

	private String Overdraft;

	private String AccountStatus;

	private String CreateDate;

	private String UserLoginName;

	private String UserPassword;

	private String UserRealName;

	private String UserOrgName;

	private String UserEmail;

	private String UserProvince;

	private String UserCity;

	private String UserAddress;

	private String UserPostCode;

	private String UserTelephone;

	private String UserFax;

	private String UserCellphone;

	private String UserIdentificationType;

	private String UserIdentificationNum;

	private String UserUserSex;

	private String UserUserBirthday;

	private String UserEducLevel;
/**
 * 获取账户余额
 * @return 账户余额
 */
	public String getAccountBlance() {
		return AccountBlance;
	}
/**
 * 设置账户余额
 * @param accountBlance 账户余额
 */
	public void setAccountBlance(String accountBlance) {
		AccountBlance = accountBlance;
	}
/**
 * 获取账户ID
 * @return 账户ID
 */
	public String getAccountId() {
		return AccountId;
	}
/**
 * 设置账户ID
 * @param accountId 账户ID
 */
	public void setAccountId(String accountId) {
		AccountId = accountId;
	}
/**
 * 获取账户模式
 * @return 账户模式
 */
	public String getAccountMode() {
		return AccountMode;
	}
/**
 * 设置账户模式
 * @param accountMode 账户模式
 */
	public void setAccountMode(String accountMode) {
		AccountMode = accountMode;
	}
/**
 * 获取账户类型
 * @return 账户类型
 */
	public String getAccountRole() {
		return AccountRole;
	}
/**
 * 设置账户类型
 * @param accountRole
 */
	public void setAccountRole(String accountRole) {
		AccountRole = accountRole;
	}
/**
 * 获取账户状态
 * @return 账户状态
 */
	public String getAccountStatus() {
		return AccountStatus;
	}
/**
 * 设置账户状态
 * @param accountStatus 账户状态
 */
	public void setAccountStatus(String accountStatus) {
		AccountStatus = accountStatus;
	}
/**
 * 获取创建日期
 * @return 创建日期
 */
	public String getCreateDate() {
		return CreateDate;
	}
/**
 * 设置创建日期
 * @param createDate 创建日期
 */
	public void setCreateDate(String createDate) {
		CreateDate = createDate;
	}
/**
 * 获取账户透支额度
 * @return 账户透支额度
 */
	public String getOverdraft() {
		return Overdraft;
	}
/**
 * 设置账户透支额度
 * @param overdraft 账户透支额度
 */
	public void setOverdraft(String overdraft) {
		Overdraft = overdraft;
	}
/**
 * 获取用户地址
 * @return 用户地址
 */
	public String getUserAddress() {
		return UserAddress;
	}
/**
 * 设置用户地址
 * @param userAddress 用户地址
 */
	public void setUserAddress(String userAddress) {
		UserAddress = userAddress;
	}
/**
 * 获取用户手机
 * @return 用户手机
 */
	public String getUserCellphone() {
		return UserCellphone;
	}
/**
 * 设置用户手机
 * @param userCellphone 用户手机
 */
	public void setUserCellphone(String userCellphone) {
		UserCellphone = userCellphone;
	}

	/**
	 * 获取用户城市
	 * @return 用户城市
	 */
	public String getUserCity() {
		return UserCity;
	}
/**
 * 设置用户城市
 * @param userCity 用户城市
 */
	public void setUserCity(String userCity) {
		UserCity = userCity;
	}

	/**
	 * 获取用户教育程度
	 * @return 用户教育程度
	 */
	public String getUserEducLevel() {
		return UserEducLevel;
	}
/**
 * 设置用户教育程度
 * @param userEducLevel 用户教育程度
 */
	public void setUserEducLevel(String userEducLevel) {
		UserEducLevel = userEducLevel;
	}
/**
 * 获取用户邮箱
 * @return 用户邮箱
 */
	public String getUserEmail() {
		return UserEmail;
	}
/**
 * 设置用户邮箱
 * @param userEmail 用户邮箱
 */
	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}
/**
 * 获取用户传真
 * @return 用户传真
 */
	public String getUserFax() {
		return UserFax;
	}
/**
 * 设置用户传真
 * @param userFax 用户传真
 */
	public void setUserFax(String userFax) {
		UserFax = userFax;
	}
/**
 * 获取用户证件号码
 * @return 用户证件号码
 */
	public String getUserIdentificationNum() {
		return UserIdentificationNum;
	}
/**
 * 设置用户证件号码
 * @param userIdentificationNum 用户证件号码
 */
	public void setUserIdentificationNum(String userIdentificationNum) {
		UserIdentificationNum = userIdentificationNum;
	}
/**
 * 获取用户证件类型
 * @return 用户证件类型
 */
	public String getUserIdentificationType() {
		return UserIdentificationType;
	}
/**
 * 设置用户证件类型
 * @param userIdentificationType 用户证件类型
 */
	public void setUserIdentificationType(String userIdentificationType) {
		UserIdentificationType = userIdentificationType;
	}
/**
 * 获取用户名称
 * @return 用户名称
 */
	public String getUserLoginName() {
		return UserLoginName;
	}
/**
 * 设置用户名称
 * @param userLoginName 用户名称
 */
	public void setUserLoginName(String userLoginName) {
		UserLoginName = userLoginName;
	}
/**
 * 获取用户公司名称
 * @return 用户公司名称
 */
	public String getUserOrgName() {
		return UserOrgName;
	}
/**
 * 设置用户公司名称
 * @param userOrgName 用户公司名称
 */
	public void setUserOrgName(String userOrgName) {
		UserOrgName = userOrgName;
	}
/**
 * 获取用户密码
 * @return 用户密码
 */
	public String getUserPassword() {
		return UserPassword;
	}
/**
 * 设置用户密码
 * @param userPassword 用户密码
 */
	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}
/**
 * 获取用户邮编
 * @return
 */
	public String getUserPostCode() {
		return UserPostCode;
	}

	/**
	 * 设置用户密码
	 * @param userPostCode 用户密码
	 */
	public void setUserPostCode(String userPostCode) {
		UserPostCode = userPostCode;
	}
/**
 * 获取用户省
 * @return 用户省
 */
	public String getUserProvince() {
		return UserProvince;
	}
/**
 * 设置用户省
 * @param userProvince 用户省
 */
	public void setUserProvince(String userProvince) {
		UserProvince = userProvince;
	}
/**
 * 获取用户真实姓名
 * @return 用户真实姓名
 */
	public String getUserRealName() {
		return UserRealName;
	}
/**
 * 设置用户真实姓名
 * @param userRealName 用户真实姓名
 */
	public void setUserRealName(String userRealName) {
		UserRealName = userRealName;
	}
/**
 * 获取用户联系电话
 * @return 用户联系电话
 */
	public String getUserTelephone() {
		return UserTelephone;
	}
/**
 * 设置用户联系电话
 * @param userTelephone 用户联系电话
 */
	public void setUserTelephone(String userTelephone) {
		UserTelephone = userTelephone;
	}
/**
 * 获取用户生日
 * @return 用户生日
 */
	public String getUserUserBirthday() {
		return UserUserBirthday;
	}
/**
 * 设置用户生日
 * @param userUserBirthday 用户生日
 */
	public void setUserUserBirthday(String userUserBirthday) {
		UserUserBirthday = userUserBirthday;
	}
/**
 * 获取用户性别
 * @return 用户性别
 */
	public String getUserUserSex() {
		return UserUserSex;
	}
/**
 * 设置用户性别
 * @param userUserSex 用户性别
 */
	public void setUserUserSex(String userUserSex) {
		UserUserSex = userUserSex;
	}
}
