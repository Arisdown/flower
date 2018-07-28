package com.flower.service;

import com.flower.domain.UserInfo;

public interface UserService {
	// �����û�����ѯ�û���Ϣ
	public UserInfo getUserInfoByuserName(String userName);

	// ����û���
	public UserInfo checkUserName(String userName);

	// ע���û�
	public int addUserInfo(UserInfo user);

	// �����û��޸�����
	int updatePwdByUserId(String username, String password);
            
	//ͨ���û��������¼�û�
	public UserInfo loginByUserNameAndPassword(String userName, String password);
             //ͨ���û�id�޸��û��ǳƺ�����
	public int updateUserInfoByUid(String uid, String username,String email);
	//�����û�
	UserInfo active(String code) throws Exception;
}
