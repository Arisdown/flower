package com.flower.service;

import com.flower.domain.Flower;
import com.flower.domain.PageBean;

public interface FlowerService {
            
	public PageBean<Flower> findPageBean(int currentPage,int pageSize);

	public Flower getFlowerById(String id);
}
