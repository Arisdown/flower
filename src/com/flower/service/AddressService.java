package com.flower.service;

import com.flower.domain.Address;

public interface AddressService {
	           //�����ջ���ϸ��Ϣ
		public int addAddressInfo(Address address);
		//�����ջ���Ϣ
		public int updateAddressInfo(Address address);
		//��ȡ���������ַ
		public Address getAddressInfo(String uid);
}
