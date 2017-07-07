package com.forum.dao;

import java.util.ArrayList;
import java.util.List;

import com.forum.domain.*;
import com.forum.inteface.DAOInterface;
import com.forum.util.BasicDAO;
import com.forum.util.SQLHelper;

public class ForumsDAO extends BasicDAO implements DAOInterface<Forums> {
	// 建置查詢

	public List<Forums> getVOBySQL(String SQL, Object[] param) {
		List list = new SQLHelper().executeQuery(SQL, param);
		List<Forums> tempList = new ArrayList<Forums>();
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			Forums forums = new Forums();
			if (obj[0] != null) {
				forums.setForum_no((String) obj[0]);
			}
			if (obj[1] != null) {
				forums.setMem_no((String) obj[1]);
			}
			if (obj[2] != null) {
				forums.setForum_name((String) obj[2]);
			}
			if (obj[3] != null) {
				forums.setForum_desc((String) obj[3]);
			}
			if (obj[4] != null) {
				forums.setForum_note((String) obj[4]);
			}
			if (obj[5] != null) {
				forums.setForum_stat((String) obj[5]);
			}
			if (obj[6] != null) {
				forums.setForum_views(Integer.parseInt(obj[6].toString()));
			}
			if (obj[7] != null) {
				forums.setForum_mviews(Integer.parseInt(obj[7].toString()));
			}
			tempList.add(forums);
		}
		return tempList;
	}
	// 建置查詢單筆

	public Forums getVOByPK(String forum_no) {
		String SQL = "Select * from forums where forum_no=?";
		Object[] param = { forum_no };
		List<Forums> list = getVOBySQL(SQL, param);
		Forums forums = list.get(0);
		return forums;
	}
	// 建置查詢全部

	public List<Forums> getAll() {
		String SQL = "select * from forums";
		List<Forums> list = getVOBySQL(SQL, null);
		return list;
	}
	// 算數量

	public int countAll() {
		String SQL = "select * from forums";
		return countBySQL(SQL);
	}
	// 建置修改

	public boolean updateByVO(Forums forums) {
		String SQL = "update forums set mem_no=?,forum_name=?,forum_desc=?,forum_note=?,forum_stat=?,forum_views=?,forum_mviews=? where forum_no=?";
		Object[] param = { forums.getForum_no(), forums.getMem_no(), forums.getForum_name(), forums.getForum_desc(),
				forums.getForum_note(), forums.getForum_stat(), forums.getForum_views(), forums.getForum_mviews() };
		boolean updateResult = new SQLHelper().executeUpdate(SQL, param);
		return updateResult;
	}
	// 建置新增

	public boolean executeInsert(Forums forums) {
		String SQL = "insert into forums values(?,?,?,?,?,?,?,?)";
		Object[] param = { forums.getForum_no(), forums.getMem_no(), forums.getForum_name(), forums.getForum_desc(),
				forums.getForum_note(), forums.getForum_stat(), forums.getForum_views(), forums.getForum_mviews() };
		boolean insertResult = new SQLHelper().executeUpdate(SQL, param);
		return insertResult;
	}
	// 建置刪除

	public boolean executeDelete(String forum_no) {
		String SQL = "delete from forums where forum_no=?";
		Object[] param = { forum_no };
		boolean deleteResult = new SQLHelper().executeUpdate(SQL, param);
		return deleteResult;
	}
	// 建置分頁(彈性排序可設條件)

	public List<Forums> pageAndRank(int page, int pageSize, String order, String where) {
		int firstPage = (page - 1) * pageSize + 1;
		int lastPage = page * pageSize;
		String SQL = "select forum_no,mem_no,forum_name,forum_desc,forum_note,forum_stat,forum_views,forum_mviews from (select forum_no,mem_no,forum_name,forum_desc,forum_note,forum_stat,forum_views,forum_mviews, rownum rn from (select * from forums";
		if (where != null) {
			SQL = SQL + " where " + where;
		}
		SQL = SQL + " order by " + order + ")) where rn between " + firstPage + " and " + lastPage;
		List<Forums> list = getVOBySQL(SQL, null);
		return list;
	}
	// 建置分頁(彈性排序不設條件)

	public List<Forums> pageAndRank(int page, int pageSize, String order) {
		List<Forums> list = pageAndRank(page, pageSize, order);
		return list;
	}
	// 建置分頁(PK排序)

	public List<Forums> pageAndRankByPk(int page, int pageSize) {
		List<Forums> list = pageAndRank(page, pageSize, "forum_no");
		return list;
	}
	// 建置取得欄位資料

	public Object[] getCol(String col, Object[] param) {
		String SQL = "select " + col + " from forums where forum_no=?";
		List<Object[]> list = new SQLHelper().executeQuery(SQL, param);
		Object[] colData = list.get(0);	
		
		return colData;
	}
	
	
	
}
