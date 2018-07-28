package com.flower.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.flower.dao.AddressDao;
import com.flower.domain.Address;
import com.flower.utils.JdbcUtils;

public class AddressDaoImpl implements AddressDao{
	private static Connection connection;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	@Override
            public int addAddressInfo(Address address) {
		String sql="insert into address values(?,?,?,?,?,?,?,?)";
		int count=0;
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, address.getAid());
			pstmt.setString(2, address.getCountry());
			pstmt.setString(3,address.getProvince());
			pstmt.setString(4, address.getCity());
			pstmt.setString(5, address.getTelephone());
			pstmt.setString(6, address.getPhone());
			pstmt.setString(7, address.getAddress());
			pstmt.setString(8, address.getUid());
			count=pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	            return count;
            }

	@Override
            public int updateAddressInfo(Address address) {
	          
		String sql="update  address set country=?,province=?,city=?,telephone=?,phone=?,address=? where uid=?";
		int count=0;
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			
			pstmt.setString(1, address.getCountry());
			pstmt.setString(2,address.getProvince());
			pstmt.setString(3, address.getCity());
			pstmt.setString(4, address.getTelephone());
			pstmt.setString(5, address.getPhone());
			pstmt.setString(6, address.getAddress());
			//pstmt.setString(7, address.getAid());
			pstmt.setString(7, address.getUid());
			count=pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	            return count;
            }
	@Override
	public Address getAddressInfo(String uid){
		String sql="select * from address where uid=? limit 1";
		Address address=null;
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs=pstmt.executeQuery();
			while(rs.next()){
				address=new Address(rs.getString("aid"), rs.getString("country"), rs.getString("province"), rs.getString("city"),rs.getString("telephone") ,rs.getString("phone") ,rs.getString("address") ,rs.getString("uid") );
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return address;
	}

}
