package com.album.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.album.domain.Photos;
import com.don.inteface.DAOInterface;
import com.don.util.BasicDAO;
import com.don.util.SQLHelper;

public class PhotosDAO extends BasicDAO implements DAOInterface<Photos> {
	// 建置查詢

	public List<Photos> getVOBySQL(String sql, Object[] param) {
		List list = new SQLHelper().executeQuery(sql, param);
		List<Photos> tempList = new ArrayList<Photos>();
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			Photos photos = new Photos();
			if (obj[0] != null) {
				photos.setPhoto_no((String) obj[0]);
			}
			if (obj[1] != null) {
				photos.setAl_no((String) obj[1]);
			}
			if (obj[2] != null) {
				photos.setPhoto_desc((String) obj[2]);
			}
			tempList.add(photos);
		}
		return tempList;
	}
	// 建置查詢單筆

	public Photos getVOByPK(String photo_no) {
		String sql = "Select * from photos where photo_no=?";
		Object[] param = { photo_no };
		List<Photos> list = getVOBySQL(sql, param);
		Photos photos = list.get(0);
		return photos;
	}
	// 建置查詢全部

	public List<Photos> getAll() {
		String sql = "select * from photos";
		List<Photos> list = getVOBySQL(sql, null);
		return list;
	}
	// 算數量

	public int countAll() {
		String sql = "select * from photos";
		return countBySQL(sql);
	}
	// 建置修改

	public boolean updateByVO(Photos photos) {
		String sql = "update photos set album_no=?,photo_desc=?,photo=?,sphoto=? where photo_no=?";
		Object[] param = { photos.getPhoto_no(), photos.getAl_no(), photos.getPhoto_desc(), photos.getPhoto(),
				photos.getSphoto() };
		boolean updateResult = new SQLHelper().executeUpdate(sql, param);
		return updateResult;
	}
	// 建置新增

	public boolean executeInsert(Photos photos) {
		String sql = "insert into photos values(photos_pk_seq.nextval,?,?,?,?)";
		Object[] param = { photos.getAl_no(), photos.getPhoto_desc(), photos.getPhoto(), photos.getSphoto() };
		boolean insertResult = new SQLHelper().executeUpdate(sql, param);

		return insertResult;
	}
	// 建置新增

	public boolean executeInsert(List<Photos> photos) {
		String sql = "insert into photos values(photos_pk_seq.nextval,?,?,?,?)";
		boolean insertResult = true;
		for (Photos p : photos) {
			Object[] param = { p.getAl_no(), p.getPhoto_desc(), p.getPhoto(), p.getSphoto() };
			System.out.println(p.getAl_no());
			boolean res = new SQLHelper().executeUpdate(sql, param);
			if (!res) {
				insertResult = false;
			}
		}
		return insertResult;
	}
	// 建置刪除

	public boolean executeDelete(String photo_no) {
		String sql = "delete from photos where photo_no=?";
		Object[] param = { photo_no };
		boolean deleteResult = new SQLHelper().executeUpdate(sql, param);
		return deleteResult;
	}
	// 建置多重交易刪除

	public boolean executeDelete(String[] al_no, Connection conn) {
		SQLHelper helper = new SQLHelper();
		Connection con = conn;
		boolean result = true;

		for (String s : al_no) {
			String sql = "delete from photos where photo_no=?";
			Object[] param = { s };
			String res = helper.executeUpdate(sql, param, null, conn);
			if (res == null) {
				result = false;
			}
		}

		return result;
	}
	// 建置分頁(彈性排序可設條件)

	public List<Photos> pageAndRank(int page, int pageSize, String order, String where) {
		int firstPage = (page - 1) * pageSize + 1;
		int lastPage = page * pageSize;
		String sql = "select photo_no,album_no,photo_desc,photo,sphoto from (select photo_no,album_no,photo_desc,photo,sphoto, rownum rn from (select * from photos";
		if (where != null) {
			sql = sql + " where " + where;
		}
		sql = sql + " order by " + order + ")) where rn between " + firstPage + " and " + lastPage;
		List<Photos> list = getVOBySQL(sql, null);
		return list;
	}
	// 建置分頁(彈性排序不設條件)

	public List<Photos> pageAndRank(int page, int pageSize, String order) {
		List<Photos> list = pageAndRank(page, pageSize, order);
		return list;
	}
	// 建置分頁(PK排序)

	public List<Photos> pageAndRankByPk(int page, int pageSize) {
		List<Photos> list = pageAndRank(page, pageSize, "photo_no");
		return list;
	}
	// 取得圖片集合

	public byte[] getPic(String where) {
		String sql = "select photo from photos where " + where;
		byte[] b = new SQLHelper().getPic(sql, null);
		return b;
	}
	// 建置取得欄位資料

	public Object[] getCol(String col, Object[] param) {
		String sql = "select " + col + " from photos where photo_no=?";
		List<Object[]> list = new SQLHelper().executeQuery(sql, param);
		Object[] colData = list.get(0);
		return colData;
		// Service層實作

	}
}