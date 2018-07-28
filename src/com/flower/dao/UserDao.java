package com.flower.dao;

import com.flower.domain.UserInfo;

public interface UserDao {
	//�����û�����ѯ�û���Ϣ
	public UserInfo getUserInfoByuserName(String userName);
	//����û���
	public UserInfo checkUserName(String userName);
	//ע���û�
	public int addUserInfo(UserInfo user);
	//�����û��޸�����
	int updatePwdByUserId(String username, String password);
	//��¼
	UserInfo loginByUserNameAndPassword(String userName,String password);
	//�û�����
	public UserInfo getUserById(String uid);
	//�޸�����
	public int updateUserInfoByUid(String uid,String username,String email);
	//ͨ������������û�
	public UserInfo getUserInfoByCode(String code);
	//�޸ļ����û�
	public int updateUserState(UserInfo user);
}
