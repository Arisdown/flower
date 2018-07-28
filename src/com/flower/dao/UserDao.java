package com.flower.dao;

import com.flower.domain.UserInfo;

public interface UserDao {
	//根据用户名查询用户信息
	public UserInfo getUserInfoByuserName(String userName);
	//检查用户名
	public UserInfo checkUserName(String userName);
	//注册用户
	public int addUserInfo(UserInfo user);
	//根据用户修改密码
	int updatePwdByUserId(String username, String password);
	//登录
	UserInfo loginByUserNameAndPassword(String userName,String password);
	//用户详情
	public UserInfo getUserById(String uid);
	//修改密码
	public int updateUserInfoByUid(String uid,String username,String email);
	//通过激活码查找用户
	public UserInfo getUserInfoByCode(String code);
	//修改激活用户
	public int updateUserState(UserInfo user);
}
