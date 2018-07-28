package com.flower.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.flower.dao.FlowerDao;
import com.flower.dao.OrderItemDao;

import com.flower.domain.Flower;
import com.flower.domain.OrderItem;
import com.flower.utils.JdbcUtils;

public class OrderItemDaoImpl implements OrderItemDao{
	private static FlowerDao flowerDao=new FlowerDaoImpl();
	private static Connection connection;
	private static PreparedStatement pstmt;
	private static ResultSet rs;

	
	public List<OrderItem> findItemsByOid(String oid){
		List<OrderItem> list=new ArrayList<OrderItem>();
		String sql="select * from orderitem where oid=?";
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, oid);
			rs=pstmt.executeQuery();
			while(rs.next()){
				OrderItem orderItem=new OrderItem();
				orderItem.setCount(rs.getInt("count"));
				orderItem.setItemid(rs.getString("itemid"));
				orderItem.setSubtotal(rs.getDouble("subtotal"));
				String flowerid=rs.getString("flowerid");
				 Flower flower=flowerDao.getFlowerById(flowerid);
				 orderItem.setFlower(flower);
				 list.add(orderItem);
			}
		     }catch(Exception e){
			 e.printStackTrace();    
		     }
		return list;
		}

}
