package com.flower.dao;

import com.flower.domain.Address;

public interface AddressDao {
	//增加收获详细信息
	public int addAddressInfo(Address address);
	//更新收获信息
	public int updateAddressInfo(Address address);
	//获取发货详情地址
	public Address getAddressInfo(String uid);

}
