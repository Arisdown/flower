package com.flower.service.impl;

import com.flower.dao.UserDao;
import com.flower.dao.impl.UserDaoImpl;
import com.flower.domain.UserInfo;
import com.flower.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDao userDao=new UserDaoImpl();

	@Override
            public UserInfo getUserInfoByuserName(String userName) {
	            // TODO Auto-generated method stub
	           return userDao.getUserInfoByuserName(userName);
            }

	@Override
            public UserInfo checkUserName(String userName) {
	            // TODO Auto-generated method stub
	            return userDao.checkUserName(userName);
            }

	@Override
            public int addUserInfo(UserInfo user) {
	            // TODO Auto-generated method stub
	            return userDao.addUserInfo(user);
            }

	@Override
            public int updatePwdByUserId(String username, String password) {
	            // TODO Auto-generated method stub
	            return userDao.updatePwdByUserId(username, password);
            }

	@Override
            public UserInfo loginByUserNameAndPassword(String userName,
                                    String password) {
	            // TODO Auto-generated method stub
	            return userDao.loginByUserNameAndPassword(userName, password);
            }

	@Override
            public int updateUserInfoByUid(String uid, String username,
                                    String email) {
	            // TODO Auto-generated method stub
	            return userDao.updateUserInfoByUid(uid, username, email);
            }
            //º§ªÓ”√ªß
	@Override
            public UserInfo active(String code) throws Exception {
	            // TODO Auto-generated method stub
		UserInfo userInfo=userDao.getUserInfoByCode(code);
		if(userInfo==null){
			return null;
		}
		userInfo.setState(1);
	           userDao.updateUserState(userInfo);
	           return userInfo;
            }

}
