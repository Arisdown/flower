package com.flower.dao;


import com.flower.domain.Flower;
import com.flower.domain.PageBean;

public interface FlowerDao {
	
	public PageBean<Flower> findPageBean(int currentPage,int pageSize);
	
	
	public Flower getFlowerById(String id);
	

	

}
