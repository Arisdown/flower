package com.flower.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.flower.dao.FlowerDao;
import com.flower.dao.OrderDao;
import com.flower.dao.OrderItemDao;
import com.flower.dao.UserDao;
import com.flower.domain.Flower;
import com.flower.domain.Order;
import com.flower.domain.OrderItem;
import com.flower.domain.PageBean;
import com.flower.domain.UserInfo;
import com.flower.utils.JdbcUtils;

public class OrderDaoImpl implements OrderDao{
	private static Connection connection;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	private UserDao userDao=new UserDaoImpl();
	private OrderItemDao orderItemDao=new OrderItemDaoImpl();
	private FlowerDao flowerDao=new FlowerDaoImpl();
	

	//添加订单
	@Override
            public int add(Order order) throws Exception {
	            // TODO Auto-generated method stub
	   String sql="insert into orders(oid,ordertime,total,state,name,uid) values(?,?,?,?,?,?)";
	   int num=0;
	   try{
		   connection=JdbcUtils.getConnection();
		   pstmt=connection.prepareStatement(sql);
		   pstmt.setString(1, order.getOid());
		   pstmt.setDate(2, new Date(order.getOrdertime().getTime()));;
		   pstmt.setDouble(3, order.getTotal());
		   pstmt.setInt(4, order.getState());
		   pstmt.setString(5,order.getUserInfo().getRealname());
		   pstmt.setString(6,order.getUserInfo().getUserId());
		   num=pstmt.executeUpdate();
		  
	   }catch(Exception e){
		   e.printStackTrace();
	   }finally{
		//   JdbcUtils.close(connection, pstmt, null);
	   }
	   return num;	            
            }
            //增加订单项
	@Override
            public int addItem(OrderItem oi) throws Exception {
	            // TODO Auto-generated method stub
		String sql="insert into orderitem values(?,?,?,?,?)";
		 int num=0;
		   try{
			   connection=JdbcUtils.getConnection();
			   pstmt=connection.prepareStatement(sql);
			   pstmt.setString(1, oi.getItemid());
			   pstmt.setInt(2, oi.getCount());
			   pstmt.setDouble(3, oi.getSubtotal());
			   pstmt.setString(4,oi.getFlower().getFlowerId());
			   pstmt.setString(5,oi.getOrder().getOid());
			  num=pstmt.executeUpdate();
			  
		   }catch(Exception e){
			   e.printStackTrace();
		   }finally{
			//   JdbcUtils.close(connection, pstmt, null);
		   }
		   return num;	            
            }

	@Override
	//通过分页查询订单
            public PageBean<Order> findAllByPage(int currentPage, int pageSize,
                                    String uid) throws Exception {
	            // TODO Auto-generated method stub
		String sql="select * from orders where uid=? limit ?,? ";
		System.out.println(uid);
		List<Order> list=new ArrayList<Order>();
		PageBean<Order> pb=new PageBean<Order>();
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setInt(2,currentPage);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()){
				//封装对象
				Order order=new Order();
				order.setOid(rs.getString("oid"));
				order.setTotal(rs.getDouble("total"));
				order.setState(rs.getInt("state"));
			            order.setOrdertime(rs.getDate("ordertime"));
			            List<OrderItem> items= orderItemDao.findItemsByOid(rs.getString("oid"));
			            for(OrderItem item:items){
			            	Flower  flower= flowerDao.getFlowerById(item.getFlower().getFlowerId());
			            	item.setFlower(flower);
			            	System.out.println(flower);
			            	System.out.println(item);
			            	order.getItems().add(item);
			            }
			          
				list.add(order);	
			}
			sql="select count(*) as count from orders";
			pstmt=connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			int totalRecord=0;
			while(rs.next()){
				totalRecord=rs.getInt("count");
				System.out.println(totalRecord);
			}
			
			pb.setCurrentPage(currentPage);
			pb.setDatas(list);
			pb.setPageSize(pageSize);
			pb.setTotalRecord(totalRecord);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		//	JdbcUtils.close(connection, pstmt, rs);
		}
	            return pb;
        }

	@Override
            public int getTotalCount(String uid) throws Exception {
	            // TODO Auto-generated method stub
	            return 0;
            }

	@Override
            public Order getById(String oid) throws Exception {
	            // TODO Auto-generated method stub
		String sql="select * from orders where oid = ?";
		Order order=null;
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				order=new Order();
				order.setState(rs.getInt("state"));
				order.setTotal(rs.getDouble("total"));
				String uid=rs.getString("uid");
				UserInfo userInfo=userDao.getUserById(uid);
				order.setUser(userInfo);
				List<OrderItem> orderItems=orderItemDao.findItemsByOid(oid);
				for(OrderItem orderItem:orderItems){
					 order.getItems().add(orderItem);
				}
	                                   
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return order;
	           
            }

	@Override
            public void update(Order order) throws Exception {
	            // TODO Auto-generated method stub
	            
            }
            /**
             * 查询我的订单
             */
            
	@Override
            public List<Order> findAllByState(String state) throws Exception {
	            // TODO Auto-generated method stub
	            return null;
            }
	  public List<Order> getOrderByUserId(String userid) throws Exception {
          // TODO Auto-generated method stub
             List<Order> orders=new ArrayList<Order>();
	String sql="select * from orders where uid= ?";
	Order order=null;
	try{
		connection=JdbcUtils.getConnection();
		pstmt=connection.prepareStatement(sql);
		pstmt.setString(1, userid);
		rs=pstmt.executeQuery();
		while(rs.next()){
			order=new Order();
			order.setOid(rs.getString("oid"));
			order.setState(rs.getInt("state"));
			order.setTotal(rs.getDouble("total"));
			order.setOrdertime(rs.getDate("ordertime"));
			String uid=rs.getString("uid");
			UserInfo userInfo=userDao.getUserById(uid);
			order.setUser(userInfo);
			List<OrderItem> orderItems=orderItemDao.findItemsByOid(order.getOid());
			for(OrderItem orderItem:orderItems){
				 order.getItems().add(orderItem);
			}
			orders.add(order);         
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return orders;
         
      }
	//订单详细信息
	  public List<OrderItem> queryOrderItems(String oid){
		  return orderItemDao.findItemsByOid(oid);	  
	  }
	  

	
	

}
