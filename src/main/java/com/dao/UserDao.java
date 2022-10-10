package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dataobjects.User;

public class UserDao {
	private Connection conn;
	public UserDao(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean userRegister(User user) {
		boolean f = false;
		try {
			String sql = "insert into user_dtls(full_name,email,password) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public User login(String email,String password) {
		User user=null;
		try {
			String sql = "select * from user_dtls where email=? and password=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setFullName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	public boolean checkOldPassword(int userId, String oldPassword) {
		boolean f=false;
		try {
			String sql = "select * from user_dtls where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, oldPassword);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean changePassword(int userId, String newPassword) {
		boolean f=false;
		try {
			String sql = "update user_dtls set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userId);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}
