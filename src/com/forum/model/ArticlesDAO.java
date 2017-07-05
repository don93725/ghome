package com.forum.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.forum.domain.Articles;
import com.forum.util.BasicDAO;
import com.forum.util.DAOInterface;
import com.forum.util.SQLHelper;

public class ArticlesDAO extends BasicDAO implements DAOInterface<Articles> {

	//建置查詢

	public List<Articles> getVOBySQL(String SQL,Object[] param){
	List list = new SQLHelper().executeQuery(SQL, param);
	List<Articles> tempList = new ArrayList<Articles>();
	for(int i = 0 ; i < list.size() ; i++){
	Object[] obj =(Object[]) list.get(i);
	Articles articles= new Articles();
	if(obj[0]!=null){
	articles.setArt_no((String)obj[0]);
	}
	if(obj[1]!=null){
	articles.setMem_no((String)obj[1]);
	}
	if(obj[2]!=null){
	articles.setForum_no((String)obj[2]);
	}
	if(obj[3]!=null){
	articles.setArt_type((String)obj[3]);
	}
	if(obj[4]!=null){
	articles.setArt_add_date((Date)obj[4]);
	}
	if(obj[5]!=null){
	articles.setArt_upd_date((Date)obj[5]);
	}
	if(obj[6]!=null){
	articles.setArt_name((String)obj[6]);
	}
	if(obj[7]!=null){
	articles.setArt_ctx((String)obj[7]);
	}
	if(obj[8]!=null){
	articles.setArt_view(Integer.parseInt(obj[8].toString()));
	}
	tempList.add(articles);
	}
	return tempList;
	}
	// 建置查詢單筆

	public Articles getVOByPK(String art_no) {
		String SQL = "Select * from articles where art_no=?";
		Object[] param = { art_no };
		List<Articles> list = getVOBySQL(SQL, param);
		Articles articles = list.get(0);
		return articles;
	}
	// 建置查詢全部

	public List<Articles> getAll() {
		String SQL = "select * from articles";
		List<Articles> list = getVOBySQL(SQL, null);
		return list;
	}
	// 算數量

	public int countAll() {
		String SQL = "select * from articles";
		return countBySQL(SQL);
	}
	// 建置修改

	public boolean updateByVO(Articles articles) {
		String SQL = "update articles set mem_no=?,forum_no=?,art_type=?,art_add_date=?,art_upd_date=?,art_name=?,art_ctx=?,art_view=? where art_no=?";
		Object[] param = { articles.getArt_no(), articles.getMem_no(), articles.getForum_no(), articles.getArt_type(),
				articles.getArt_add_date(), articles.getArt_upd_date(), articles.getArt_name(), articles.getArt_ctx(),
				articles.getArt_view() };
		boolean updateResult = new SQLHelper().executeUpdate(SQL, param);
		return updateResult;
	}
	// 建置新增

	public boolean executeInsert(Articles articles) {
		String SQL = "insert into articles values(articles_seq.nextval,?,?,?,SYSDATE,null,?,?,0)";
		Object[] param = { articles.getMem_no(), articles.getForum_no(), articles.getArt_type(), articles.getArt_name(), articles.getArt_ctx()};
		boolean insertResult = new SQLHelper().executeUpdate(SQL, param);
		return insertResult;
	}
	// 建置刪除

	public boolean executeDelete(String art_no) {
		String SQL = "delete from articles where art_no=?";
		Object[] param = { art_no };
		boolean deleteResult = new SQLHelper().executeUpdate(SQL, param);
		return deleteResult;
	}
	// 建置分頁(彈性排序可設條件)

	public List<Articles> pageAndRank(int page, int pageSize, String order, String where) {
		int firstPage = (page - 1) * pageSize + 1;
		int lastPage = page * pageSize;
		String SQL="select art_no,mem_no,forum_no,art_type,art_add_date,art_upd_date,art_name,art_ctx,art_view from"+
				   "(select art_no,mem_no,forum_no,art_type,art_add_date,art_upd_date,art_name,art_ctx,art_view, rownum rn from "+
				   "(select * from articles";
		if(where!=null){
			SQL =  SQL + " where "+where;
		}
		SQL = SQL+" order by "+ order + ")) where rn between "+firstPage+" and "+lastPage;
		
		List<Articles> list = getVOBySQL(SQL, null);
		return list;
	}
	// 分頁無條件
	public List<Articles> pageAndRank(int page, int pageSize, String order) {
	
		List<Articles> list =pageAndRank(page,pageSize,order,null);		
		
		return list;
	}
	// 建置分頁(PK排序)

	public List<Articles> pageAndRankByPk(int page, int pageSize) {
		List<Articles> list = pageAndRank(page, pageSize,"art_no");
		return list;
	}

}
