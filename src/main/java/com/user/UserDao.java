package com.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

public class UserDao {

	Connection conn=null;
	PreparedStatement st=null;
	ResultSet rs=null;
	
	private Connection getConnection(){
		String url = "jdbc:mysql://localhost:3306/student";
		String user = "root";
		String pass = "i5rtx3050";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (ClassNotFoundException  | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	protected int register(String uname,String password,String gender,String dob,String email) throws SQLException {
		String sql = "INSERT INTO useraccounts VALUES (?, ?, ?,?,?)";
		
		conn=getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, uname);
		stmt.setString(2, password);
		stmt.setString(3, gender);
		stmt.setString(4, dob);
		stmt.setString(5, email);
		
		// execute SQL statement
		int i= stmt.executeUpdate();
		return i;
	}
	protected boolean login(String uname,String password) throws SQLException {
		String sql = "select * from useraccounts where username=? and password=?";
		conn=getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, uname);
		stmt.setString(2, password);
		
		
		// execute SQL statement
		rs=stmt.executeQuery();
		if(rs.next()) {
			return true;
		}
		return false;	
	}
	public ResultSet userinfo(String uname) throws SQLException {
		String sql = "select * from useraccounts where username=? ";
		conn=getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, uname);
		
		// execute SQL statement
		rs=stmt.executeQuery();
		
		return rs;	
	}
}
