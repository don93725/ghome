package com.commets.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.don.inteface.DAOInterface;
import com.don.util.BasicDAO;
import com.don.util.SQLHelper;

public class Board_cmtDAO extends BasicDAO implements DAOInterface<Board_cmt> {
	// 建置查詢

	public List<Board_cmt> getVOBySQL(String sql, Object[] param) {
		List list = new SQLHelper().executeQuery(sql, param);
		List<Board_cmt> tempList = new ArrayList<Board_cmt>();
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			Board_cmt board_cmt = new Board_cmt();
			if (obj[0] != null) {
				board_cmt.setBd_cmt_no((String) obj[0]);
			}
			if (obj[1] != null) {
				board_cmt.setMem_no((String) obj[1]);
			}
			if (obj[2] != null) {
				board_cmt.setCmt_type((String) obj[2]);
			}
			if (obj[3] != null) {
				board_cmt.setOrg_no((String) obj[3]);
			}
			if (obj[4] != null) {
				board_cmt.setBd_cmt_ctx((String) obj[4]);
			}
			if (obj[5] != null) {
				board_cmt.setCmt_likes(Integer.parseInt(obj[5].toString()));
			}
			if (obj[6] != null) {
				board_cmt.setBd_cmt_time((Date) obj[6]);
			}
			tempList.add(board_cmt);
		}
		return tempList;
	}
	// 建置查詢單筆

	public Board_cmt getVOByPK(String bd_cmt_no) {
		String sql = "Select * from board_cmt where bd_cmt_no=?";
		Object[] param = { bd_cmt_no };
		List<Board_cmt> list = getVOBySQL(sql, param);
		Board_cmt board_cmt = list.get(0);
		return board_cmt;
	}
	// 建置查詢全部

	public List<Board_cmt> getAll() {
		String sql = "select * from board_cmt";
		List<Board_cmt> list = getVOBySQL(sql, null);
		return list;
	}
	// 算數量

	public int countAll() {
		String sql = "select * from board_cmt";
		return countBySQL(sql);
	}
	// 建置修改

	public boolean updateByVO(Board_cmt board_cmt) {
		String sql = "update board_cmt set mem_no=?,cmt_type=?,org_no=?,bd_cmt_ctx=?,cmt_likes=?,bd_cmt_time=? where bd_cmt_no=?";
		Object[] param = { board_cmt.getBd_cmt_no(), board_cmt.getMem_no(), board_cmt.getCmt_type(),
				board_cmt.getOrg_no(), board_cmt.getBd_cmt_ctx(), board_cmt.getCmt_likes(),
				board_cmt.getBd_cmt_time() };
		boolean updateResult = new SQLHelper().executeUpdate(sql, param);
		return updateResult;
	}
	// 建置新增

	public boolean executeInsert(Board_cmt board_cmt) {
		String sql = "insert into board_cmt values(?,?,?,?,?,?,?)";
		Object[] param = { board_cmt.getBd_cmt_no(), board_cmt.getMem_no(), board_cmt.getCmt_type(),
				board_cmt.getOrg_no(), board_cmt.getBd_cmt_ctx(), board_cmt.getCmt_likes(),
				board_cmt.getBd_cmt_time() };
		boolean insertResult = new SQLHelper().executeUpdate(sql, param);
		return insertResult;
	}
	// 建置刪除

	public boolean executeDelete(String bd_cmt_no) {
		String sql = "delete from board_cmt where bd_cmt_no=?";
		Object[] param = { bd_cmt_no };
		boolean deleteResult = new SQLHelper().executeUpdate(sql, param);
		return deleteResult;
	}
	// 建置分頁(彈性排序可設條件)

	public List<Board_cmt> pageAndRank(int page, int pageSize, String order, String where) {
		int firstPage = (page - 1) * pageSize + 1;
		int lastPage = page * pageSize;
		String sql = "select bd_cmt_no,mem_no,cmt_type,org_no,bd_cmt_ctx,cmt_likes,bd_cmt_time from (select bd_cmt_no,mem_no,cmt_type,org_no,bd_cmt_ctx,cmt_likes,bd_cmt_time, rownum rn from (select * from board_cmt";
		if (where != null) {
			sql = sql + " where " + where;
		}
		sql = sql + " order by " + order + ")) where rn between " + firstPage + " and " + lastPage;
		List<Board_cmt> list = getVOBySQL(sql, null);
		return list;
	}
	// 建置分頁(彈性排序不設條件)

	public List<Board_cmt> pageAndRank(int page, int pageSize, String order) {
		List<Board_cmt> list = pageAndRank(page, pageSize, order);
		return list;
	}
	// 建置分頁(PK排序)

	public List<Board_cmt> pageAndRankByPk(int page, int pageSize) {
		List<Board_cmt> list = pageAndRank(page, pageSize, "bd_cmt_no");
		return list;
	}
	// 建置取得欄位資料

	public Object[] getCol(String col, Object[] param) {
		String sql = "select " + col + " from board_cmt where bd_cmt_no=?";
		List<Object[]> list = new SQLHelper().executeQuery(sql, param);
		Object[] colData = list.get(0);
		return colData;
	}
}
