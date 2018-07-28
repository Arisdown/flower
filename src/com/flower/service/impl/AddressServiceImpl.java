package com.flower.service.impl;

import com.flower.dao.AddressDao;
import com.flower.dao.impl.AddressDaoImpl;
import com.flower.domain.Address;
import com.flower.service.AddressService;

public class AddressServiceImpl implements AddressService{
	private AddressDao addressDao=new AddressDaoImpl();

	
            public int addAddressInfo(Address address) {
	            // TODO Auto-generated method stub
	            return addressDao.addAddressInfo(address);
            }


            public int updateAddressInfo(Address address) {
	            // TODO Auto-generated method stub
	            return addressDao.updateAddressInfo(address);
            }


	@Override
            public Address getAddressInfo(String uid) {
	            // TODO Auto-generated method stub
	            return addressDao.getAddressInfo(uid);
            }
	
         
}
