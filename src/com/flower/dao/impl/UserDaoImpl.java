package com.flower.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.flower.dao.UserDao;
import com.flower.domain.UserInfo;
import com.flower.utils.JdbcUtils;

public class UserDaoImpl implements UserDao{
	private static Connection connection;
	private static PreparedStatement pstmt;
	private static ResultSet rs;

	@Override
            public UserInfo getUserInfoByuserName(String userName) {
	            // TODO Auto-generated method stub
		String sql="select * from userinfo where username='"+userName+"'";
		System.out.println(sql);
		 UserInfo userInfo=null;
		try{
		      connection=JdbcUtils.getConnection();
		      pstmt=connection.prepareStatement(sql);
		      rs=pstmt.executeQuery();
		      while(rs.next()){
			      userInfo=new UserInfo(rs.getString("userid"),rs.getString("realname"),rs.getString("username"),rs.getString("password"),rs.getDate("regtime"),rs.getString("email"));
		      }
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			//JdbcUtils.close(connection, pstmt, rs);
		}
	            return userInfo;
	            
            }

	@Override
            public UserInfo checkUserName(String userName) {
	            // TODO Auto-generated method stub
		String sql="select * from userinfo where username='"+userName+"'";
		System.out.println(sql);
		 UserInfo userInfo=null;
		try{
		      connection=JdbcUtils.getConnection();
		      pstmt=connection.prepareStatement(sql);
		      rs=pstmt.executeQuery();
		      while(rs.next()){
			      userInfo=new UserInfo(rs.getString("userId"),rs.getString("realName"),rs.getString("username"),rs.getString("password"),rs.getDate("regtime"),rs.getString("email"));
		      }
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			//JdbcUtils.close(connection, pstmt, rs);
		}
	         return userInfo;
            }

	@Override
            public int addUserInfo(UserInfo user) {
	            // TODO Auto-generated method stub
		String sql="insert into userinfo values(?,?,?,?,?,?,?,?)";
		//增加条数
		int count=0;
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1,user.getUserId());
			pstmt.setString(2,user.getRealname());
			pstmt.setString(3, user.getUsername());
			pstmt.setString(4, user.getPassword());
			pstmt.setDate(5, new Date(user.getRegtime().getTime()));
			pstmt.setString(6, user.getEmail());
			pstmt.setString(7, user.getCode());
			pstmt.setInt(8, user.getState());
			count=pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//JdbcUtils.close(connection, pstmt, null);
		}
	            return count;
            }

	@Override
            public int updatePwdByUserId(String username,String password) {
	            // TODO Auto-generated method stub
		String sql="update userinfo set password=? where username=?";
		int count=0;
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1,password);
			pstmt.setString(2,username);
			count=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//JdbcUtils.close(connection, pstmt, null);
		}
					
	            return count;
             }

	@Override
            public UserInfo loginByUserNameAndPassword(String userName,String password) {
	            // TODO Auto-generated method stub
		String sql="select * from userinfo where username='"+userName+"' and password='"+password+"'";
		System.out.println(sql);
		 UserInfo userInfo=null;
		try{
		      connection=JdbcUtils.getConnection();
		      pstmt=connection.prepareStatement(sql);
		      rs=pstmt.executeQuery();
		      while(rs.next()){
			      userInfo=new UserInfo(rs.getString("userId"),rs.getString("realName"),rs.getString("username"),rs.getString("password"),rs.getDate("regtime"),rs.getString("email"),rs.getString("code"),rs.getInt("state"));
		      }
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			//JdbcUtils.close(connection, pstmt, rs);
		}
	           return userInfo;
            }

	@Override
            public UserInfo getUserById(String uid) {
	            // TODO Auto-generated method stub
		String sql="select * from userinfo where userid='"+uid+"'";
		System.out.println(sql);
		 UserInfo userInfo=null;
		try{
		      connection=JdbcUtils.getConnection();
		      pstmt=connection.prepareStatement(sql);
		      rs=pstmt.executeQuery();
		      while(rs.next()){
			      userInfo=new UserInfo(rs.getString("userId"),rs.getString("realName"),rs.getString("username"),rs.getString("password"),rs.getDate("regtime"),rs.getString("email"));
		      }
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			//JdbcUtils.close(connection, pstmt, rs);
		}
	         return userInfo;
            }
	
	public int updateUserInfoByUid(String uid,String username,String email){
		String sql="update userinfo set username=?,email=? where userid=?";
		int count=0;
		try{
			connection=JdbcUtils.getConnection();
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1,username);
			pstmt.setString(2,email);
			pstmt.setString(3, uid);
			count=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//JdbcUtils.close(connection, pstmt, null);
		}
		return count;
					
	}
            //后期想要实现的功能用户表需要添加code和state两个字段
	@Override
            public UserInfo getUserInfoByCode(String code) {
	            // TODO Auto-generated method stub
		String sql="select * from userinfo where code=?";
		System.out.println(sql);
		 UserInfo userInfo=null;
		try{
		      connection=JdbcUtils.getConnection();
		      pstmt=connection.prepareStatement(sql);
		      pstmt.setString(1, code);
		      rs=pstmt.executeQuery();
		      while(rs.next()){
			      //后期需要增加一个有code的state这个构造函数
			      userInfo=new UserInfo(rs.getString("userId"),rs.getString("realName"),rs.getString("username"),rs.getString("password"),rs.getDate("regtime"),rs.getString("email"),rs.getString("code"),rs.getInt("state"));
		      }
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			//JdbcUtils.close(connection, pstmt, rs);
		}
	         return userInfo;
		
            }
           //激活用户状态
	@Override
            public int updateUserState(UserInfo user) {
	            // TODO Auto-generated method stub
		String sql="update userinfo set state=? where code=?";
		int num=0;
		try{
			      connection=JdbcUtils.getConnection();
			      pstmt=connection.prepareStatement(sql);
			      pstmt.setInt(1, user.getState());
			      pstmt.setString(2, user.getCode());
			     num=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return num;
	            
            }

}
