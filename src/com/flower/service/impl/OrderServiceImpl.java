package com.flower.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.flower.dao.OrderDao;
import com.flower.dao.impl.OrderDaoImpl;
import com.flower.domain.Order;
import com.flower.domain.OrderItem;
import com.flower.domain.PageBean;
import com.flower.domain.UserInfo;
import com.flower.service.OrderService;
import com.flower.utils.JdbcUtils;

public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao = new OrderDaoImpl();

	@Override
	public void add(Order order) throws SQLException {
		JdbcUtils.startTransaction();
		try {
			for (OrderItem orderItem : order.getItems()) {
				orderDao.addItem(orderItem);
			}
			orderDao.add(order);
			JdbcUtils.commitAndClose();
		} catch (Exception e) {
			e.printStackTrace();
			JdbcUtils.rollbackAndClose();
		}
	}

	public void add(OrderItem orderItem) throws Exception {

	}
	
	/**
	 * 分页查询订单
	 */
	@Override
	public PageBean<Order> findAllByPage(int currentPage, int pageSize, UserInfo user) throws Exception {
		
		// 查询当前页数据
		return orderDao.findAllByPage(currentPage,pageSize,user.getUserId());
		
		
	}
}
