package com.album.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.album.domain.Albums;
import com.don.inteface.DAOInterface;
import com.don.util.BasicDAO;
import com.don.util.SQLHelper;

public class AlbumsDAO extends BasicDAO implements DAOInterface<Albums> {
	// 建置查詢

	public List<Albums> getVOBySQL(String sql, Object[] param) {
		List list = new SQLHelper().executeQuery(sql, param);
		List<Albums> tempList = new ArrayList<Albums>();
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			Albums albums = new Albums();
			if (obj[0] != null) {
				albums.setAl_no((String) obj[0]);
			}
			if (obj[1] != null) {
				albums.setMem_no((String) obj[1]);
			}
			if (obj[2] != null) {
				albums.setAl_date((Date) obj[2]);
			}
			if (obj[3] != null) {
				albums.setAl_name((String) obj[3]);
			}
			if (obj[4] != null) {
				albums.setAl_views(Integer.parseInt(obj[4].toString()));
			}
			if (obj[5] != null) {
				albums.setAl_prvt((String) obj[5]);
			}
			tempList.add(albums);
		}
		return tempList;
	}
	// 建置查詢單筆

	public Albums getVOByPK(String al_no) {
		String sql = "Select * from albums where al_no=?";
		Object[] param = { al_no };
		List<Albums> list = getVOBySQL(sql, param);
		Albums albums = list.get(0);
		return albums;
	}
	// 建置查詢全部

	public List<Albums> getAll() {
		String sql = "select * from albums";
		List<Albums> list = getVOBySQL(sql, null);
		return list;
	}
	// 算數量

	public int countAll() {
		String sql = "select * from albums";
		return countBySQL(sql);
	}
	// 建置修改

	public boolean updateByVO(Albums albums) {
		String sql = "update albums set al_name=?,al_prvt=? where al_no=?";
		Object[] param = { albums.getAl_name(),albums.getAl_prvt(),albums.getAl_no()};
		boolean updateResult = new SQLHelper().executeUpdate(sql, param);
		return updateResult;
	}
	// 建置新增

	public boolean executeInsert(Albums albums) {
		String sql = "insert into albums values(albums_pk_seq.nextval,?,default,?,default,?)";
		Object[] param = {albums.getMem_no(), albums.getAl_name(), albums.getAl_prvt() };
		boolean insertResult = new SQLHelper().executeUpdate(sql, param);
		return insertResult;
	}
	// 無使用刪除
	@Override
	public boolean executeDelete(String no) {
		// TODO Auto-generated method stub
		return false;
	}
	// 建置刪除

	public boolean executeDelete(String[] al_no) {
		SQLHelper helper =	new SQLHelper();
		Connection con = helper.getConnection();
		PreparedStatement pstmt =null;
		boolean result = false;
		try {
			con.setAutoCommit(false);
			PhotosDAO photosDAO = new PhotosDAO(); 
			boolean innerResult = photosDAO.executeDelete(al_no,con);
			boolean innerResult2 = false;
			if(innerResult){
				innerResult2 = true;
				String sql = null;
				for(String s: al_no){
					sql = "delete from albums where al_no=?";
					Object[] param = {s};
					String res = helper.executeUpdate(sql, param, null, con);
					if(res==null){
						innerResult2=false;
					}
				}
				
			}
			
			if(innerResult2){
				con.rollback();
				
			}else{
				con.commit();
				result = true;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			helper.close(con, pstmt);
		}
		return result;
		
	}
	// 建置分頁(彈性排序可設條件)

	public List<Albums> pageAndRank(int page, int pageSize, String order, String where) {
		int firstPage = (page - 1) * pageSize + 1;
		int lastPage = page * pageSize;
		String sql = "select al_no,mem_no,al_date,al_name,al_views,al_prvt from (select al_no,mem_no,al_date,al_name,al_views,al_prvt, rownum rn from (select * from albums";
		if (where != null) {
			sql = sql + " where " + where;
		}
		sql = sql + " order by " + order + ")) where rn between " + firstPage + " and " + lastPage;
		List<Albums> list = getVOBySQL(sql, null);
		return list;
	}
	// 建置分頁(彈性排序不設條件)

	public List<Albums> pageAndRank(int page, int pageSize, String order) {
		List<Albums> list = pageAndRank(page, pageSize, order);
		return list;
	}
	// 建置分頁(PK排序)

	public List<Albums> pageAndRankByPk(int page, int pageSize) {
		List<Albums> list = pageAndRank(page, pageSize, "al_no");
		return list;
	}
	// 建置取得欄位資料

	public Object[] getCol(String col, Object[] param) {
		String sql = "select " + col + " from albums where al_no=?";
		List<Object[]> list = new SQLHelper().executeQuery(sql, param);
		Object[] colData = list.get(0);
		return colData;

	}
	// 建置修改

	public boolean updateAlbumViews(String al_no) {
			
			String sql = "update albums set al_views=al_views+1 from album where al_no=?";
			Object[] param = { al_no };
			boolean updateResult = new SQLHelper().executeUpdate(sql, param);
			return updateResult;
	}


}