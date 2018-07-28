package com.flower.service;

import java.sql.SQLException;

import com.flower.domain.Order;
import com.flower.domain.OrderItem;
import com.flower.domain.PageBean;
import com.flower.domain.UserInfo;

public interface OrderService {
	/*
	 *        private String oid;	
		private Double total;	
		private Integer state=0;//订单状态  0:未支付  1:已支付 
		private String city;	
		private String privince;
		private String address;
		private String username;
		private String telephone;
	 */
	public void add(Order order) throws SQLException;
	public void add(OrderItem orderItem) throws Exception;
	PageBean<Order> findAllByPage(int currentPage, int pageSize,
                                    UserInfo user) throws Exception;
	
}
