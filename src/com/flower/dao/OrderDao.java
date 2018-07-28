package com.flower.dao;

import java.util.List;

import com.flower.domain.Order;
import com.flower.domain.OrderItem;
import com.flower.domain.PageBean;

public interface OrderDao {
	int add(Order order) throws Exception;

	int addItem(OrderItem oi) throws Exception;

	PageBean<Order> findAllByPage(int currPage, int pageSize, String uid) throws Exception;

	int getTotalCount(String uid) throws Exception;

	Order getById(String oid) throws Exception;

	void update(Order order) throws Exception;

	List<Order> findAllByState(String state) throws Exception;
                 
}
