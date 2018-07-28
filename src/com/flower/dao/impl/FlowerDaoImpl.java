package com.flower.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.flower.dao.FlowerDao;
import com.flower.domain.Flower;
import com.flower.domain.PageBean;
import com.flower.utils.JdbcUtils;

public class FlowerDaoImpl implements FlowerDao{
	private static Connection connection;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	
	public PageBean<Flower> findPageBean(int currentPage, int pageSize) {
	            // TODO Auto-generated method stub
		String sql="select * from flower limit ?,?";
		List<Flower> list=new ArrayList<Flower>();
		PageBean<Flower> pb=new PageBean<Flower>();
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			pstmt.setInt(1,currentPage);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Flower flower=new Flower(rs.getString("flowerid"), rs.getString("flowertype"), rs.getString("flowername"), rs.getString("sellpoint"), rs.getDouble("market_price"), rs.getDouble("shop_price"), rs.getInt("number"),rs.getString("flowerMaterial"),rs.getString("flowerImage"));
				list.add(flower);
			}
			sql="select count(*) as count from flower";
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
			//JdbcUtils.close(connection, pstmt, rs);
		}
	            return pb;
        }

	/**
	 * ‰Ø¿¿…Ã∆∑œÍ«È
	 */
            public Flower getFlowerById(String id) {
	            // TODO Auto-generated method stub
		String sql="select * from flower where flowerid='"+id+"'";
		System.out.println(sql);
		Flower flower=null;
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
		                  flower=new Flower(rs.getString("flowerid"), rs.getString("flowertype"), rs.getString("flowername"), rs.getString("sellpoint"), rs.getDouble("market_price"), rs.getDouble("shop_price"), rs.getInt("number"),rs.getString("flowerMaterial"),rs.getString("flowerImage"));	
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		//	JdbcUtils.close(connection, pstmt, rs);
		}
	            return flower;
            }

}
