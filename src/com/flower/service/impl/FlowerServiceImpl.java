package com.flower.service.impl;

import com.flower.dao.FlowerDao;
import com.flower.dao.impl.FlowerDaoImpl;
import com.flower.domain.Flower;
import com.flower.domain.PageBean;

public class FlowerServiceImpl implements com.flower.service.FlowerService{
	private FlowerDao flowerDao=new FlowerDaoImpl();

	@Override
            public PageBean<Flower> findPageBean(int currentPage, int pageSize) {
	            // TODO Auto-generated method stub
	            return flowerDao.findPageBean(currentPage, pageSize);
            }

	@Override
            public Flower getFlowerById(String id) {
	            // TODO Auto-generated method stub
	            return flowerDao.getFlowerById(id);
            }
         
	
}
