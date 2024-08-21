package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

public class FoodtransactionDA {
	
//	public Foodtransaction Foodtransaction12(int c_id) {
//		Foodtransaction roomrent = null;
//
//		try {
//			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotel", "root", "nclc123456");
//			PreparedStatement pst = con.prepareStatement("select * from foodtransaction where c_id=?");
//
//			pst.setInt(1, c_id);
//
//			ResultSet rs = pst.executeQuery();
//			while (rs.next()) {
//			
//				roomrent = new Foodtransaction(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
//						rs.getDouble(5), rs.getString(7));
//
//			}
//			
//
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return roomrent;
//
//	}
	
	public List<Foodtransaction> showallorder() {
		List<Foodtransaction> stlist = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotel", "root", "nclc123456");
			PreparedStatement pst = con.prepareStatement("select * from foodtransaction");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				stlist.add(new Foodtransaction(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
						rs.getDouble(5), rs.getString(6)));
			}
			
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return stlist;
	}
}
