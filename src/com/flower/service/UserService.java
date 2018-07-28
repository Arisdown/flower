package com.flower.service;

import com.flower.domain.UserInfo;

public interface UserService {
	// 根据用户名查询用户信息
	public UserInfo getUserInfoByuserName(String userName);

	// 检查用户名
	public UserInfo checkUserName(String userName);

	// 注册用户
	public int addUserInfo(UserInfo user);

	// 根据用户修改密码
	int updatePwdByUserId(String username, String password);
            
	//通过用户名密码登录用户
	public UserInfo loginByUserNameAndPassword(String userName, String password);
             //通过用户id修改用户昵称和邮箱
	public int updateUserInfoByUid(String uid, String username,String email);
	//激活用户
	UserInfo active(String code) throws Exception;
}
