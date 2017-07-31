package com.board.dao;

import java.util.ArrayList;
import java.util.List;

import com.board.domain.Board_photo;
import com.don.inteface.DAOInterface;
import com.don.util.BasicDAO;
import com.don.util.SQLHelper;

public class Board_photoDAO extends BasicDAO {
	// 建置查詢

	public List<Board_photo> getVOBySQL(String sql, Object[] param) {
		List list = new SQLHelper().executeQuery(sql, param);
		List<Board_photo> tempList = new ArrayList<Board_photo>();
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			Board_photo board_photo = new Board_photo();
			if (obj[0] != null) {
				board_photo.setBd_msg_no((String) obj[0]);
			}
			if (obj[1] != null) {
				board_photo.setPhoto_no((String) obj[1]);
			}
			tempList.add(board_photo);
		}
		return tempList;
	}
	// 建置查詢全部

	public List<Board_photo> getAll(String bd_msg_no) {
		String sql = "select * from board_photo where bd_msg_no=" + bd_msg_no;
		List<Board_photo> list = getVOBySQL(sql, null);
		return list;
	}
	// 算數量

	public int countAll(String bd_msg_no) {
		String sql = "select * from board_photo where bd_msg_no=" + bd_msg_no;
		return countBySQL(sql);
	}
	// 建置新增

	public boolean executeInsert(Board_photo board_photo) {
		String sql = "insert into board_photo values(?,?)";
		Object[] param = { board_photo.getBd_msg_no(), board_photo.getPhoto_no() };
		boolean insertResult = new SQLHelper().executeUpdate(sql, param);
		return insertResult;
	}
	// 建置刪除

	public boolean executeDelete(String bd_msg_no, String photo_no) {
		String sql = "delete from board_photo where bd_msg_no=" + bd_msg_no + " and photo_no=" + photo_no;
		boolean insertResult = new SQLHelper().executeUpdate(sql, null);
		return insertResult;

	}
	// 建置分頁(彈性排序可設條件)

	public List<Board_photo> pageAndRank(int page, int pageSize, String order, String where) {
		int firstPage = (page - 1) * pageSize + 1;
		int lastPage = page * pageSize;
		String sql = "select bd_msg_no,photo_no from (select bd_msg_no,photo_no,rownum rn from (select * from board_photo";
		if (where != null) {
			sql = sql + " where " + where;
		}
		sql = sql + " order by " + order + ")) where rn between " + firstPage + " and " + lastPage;
		List<Board_photo> list = getVOBySQL(sql, null);
		return list;
	}
	// 建置分頁(彈性排序不設條件)

	public List<Board_photo> pageAndRank(int page, int pageSize, String order) {
		List<Board_photo> list = pageAndRank(page, pageSize, order);
		return list;
	}
	// 建置分頁(PK排序)

	public List<Board_photo> pageAndRankByPk(int page, int pageSize) {
		List<Board_photo> list = pageAndRank(page, pageSize, "");
		return list;
	}

}
