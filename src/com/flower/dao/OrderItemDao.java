package com.flower.dao;

import java.util.List;

import com.flower.domain.OrderItem;

public interface OrderItemDao {
	public List<OrderItem> findItemsByOid(String oid);
}
