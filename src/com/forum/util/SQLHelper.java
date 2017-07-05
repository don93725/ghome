package com.forum.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SQLHelper {
	
	//查詢
	public ArrayList executeQuery(String sql,Object[] params){
		Connection con= null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		ResultSetMetaData rsmd = null;
		ArrayList al = new ArrayList();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			if(params!=null){
				for(int i = 0 ; i<params.length ; i++){
					if(params[i]!=null){
						pstmt.setObject(i+1, params[i]);						
					}
				}
			}
			rs = pstmt.executeQuery();
			rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
			while(rs.next()){
				Object[] obj = new Object[colCount];
				for(int i = 0 ; i<colCount ; i++){
					obj[i] = rs.getObject(i+1);
				}
				al.add(obj);
			}
		}  catch (SQLException e) {
			e.printStackTrace();
		}		
		finally {			
			close(con, pstmt, rs);			
		}
		return al;		
	}
	//執行更新
	public boolean executeUpdate(String SQL,Object[] params){
		
		Connection con =null;
		PreparedStatement pstmt = null;
		boolean updateResult=true;
		try {
			con = getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(SQL);
			if(params!=null){
				for(int i = 0 ; i < params.length ; i++){
					pstmt.setObject(i+1, params[i]);
				}
			}
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
				updateResult = false;
			} catch (SQLException e1) {
				e1.printStackTrace();
				
			}
		} finally {
			close(con, pstmt);
		}
		return updateResult;
	}
	//執行更新
	public boolean executeUpdate(String[] SQL,Object[][] params){
		
		Connection con =null;
		PreparedStatement pstmt = null;
		boolean updateResult=true;
		try {
			con = getConnection();
			con.setAutoCommit(false);
			for(int j = 0 ; j< SQL.length ; j++){
				pstmt = con.prepareStatement(SQL[j]);
				if(params[j]!=null){
					for(int i = 0 ; i < params[j].length ; i++){
						pstmt.setObject(i+1, params[j][i]);
					}
				}
				pstmt.executeUpdate();							
			}
			con.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
				updateResult = false;
			} catch (SQLException e1) {
				e1.printStackTrace();				
			}
		} finally {
			close(con, pstmt);
		}
		return updateResult;
	}	
	
	//創連線池
	static DataSource ds;
	static{		
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}		
	//獲取連線
	public Connection getConnection() {
		Connection con = null;
		
		try {
			
			if (ds != null) {				
					con = ds.getConnection();
			}
			} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			}						
		return con;
	}
	//關閉連線1
	private void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	//關閉連線2
	private void close(Connection con, PreparedStatement pstmt) {		
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}