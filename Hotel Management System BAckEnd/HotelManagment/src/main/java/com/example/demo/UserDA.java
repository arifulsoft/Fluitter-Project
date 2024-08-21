package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDA {
	public User adminLogin (String username,String  password) {
		User roomrent =null;
		
		try {
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/hotel","root","nclc123456");
			PreparedStatement pst=con.prepareStatement("select * from user where username=? and password=?");
		
			pst.setString(1, username);
			pst.setString(2, password);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				System.out.println("works");
				roomrent = new User(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
				
			}
			System.out.println("find by id");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return roomrent;
		
		
	}
	
	
//	Admin-Customar-Register-------------------------------------------
	public User newUser(User s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotel", "root", "nclc123456");
			PreparedStatement pst = con.prepareStatement("INSERT INTO user VALUES(?,?,?,?)");
			pst.setString(1, s.getUsername());
			pst.setString(2, s.getEmail());
			pst.setString(3, s.getPassword());
			pst.setString(4, s.getRole());
			
			
			
			pst.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}
	
//	Admin-Customar-Register in flutter-------------------------------------------
	public User adminreg(User s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotel", "root", "nclc123456");
			PreparedStatement pst = con.prepareStatement("INSERT INTO user VALUES(?,?,?,?)");
			pst.setString(1, s.getUsername());
			pst.setString(2, s.getEmail());
			pst.setString(3, s.getPassword());
			pst.setString(4, s.getRole());
			
			
			
			pst.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}
	
	
	
	//admin logion flutter--------------------------------------------
	public User studentSigninById(String username) {
		User s = new User();
		try {
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotel", "root", "nclc123456");
//			PreparedStatement pstmt = con.prepareStatement("select * from user where username=" + username);
			PreparedStatement pstmt = con.prepareStatement("select * from user where username=?");
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				s = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
			
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return s;
	}
	
}
