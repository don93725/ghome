package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.forum.domain.Article_photos;
import com.forum.inteface.DAOInterface;
import com.forum.util.BasicDAO;
import com.forum.util.SQLHelper;

public class Article_photosDAO extends BasicDAO implements DAOInterface<Article_photos>{
	//建置查詢

	public List<Article_photos> getVOBySQL(String SQL,Object[] param){
	List list = new SQLHelper().executeQuery(SQL, param);
	List<Article_photos> tempList = new ArrayList<Article_photos>();
	for(int i = 0 ; i < list.size() ; i++){
	Object[] obj =(Object[]) list.get(i);
	Article_photos article_photos= new Article_photos();
	if(obj[0]!=null){
	article_photos.setArt_pt_no((String)obj[0]);
	}
	if(obj[1]!=null){
	article_photos.setArt_no((String)obj[1]);
	}
	if(obj[3]!=null){
	article_photos.setArt_pt_idx((String)obj[3]);
	}
	tempList.add(article_photos);
	}
	return tempList;
	}
	//建置查詢單筆

	public Article_photos getVOByPK(String art_pt_no){
	String SQL ="Select * from article_photos where art_pt_no=?";
	Object[] param ={art_pt_no};
	List<Article_photos> list=getVOBySQL(SQL,param);
	Article_photos article_photos=list.get(0);
	return article_photos;
	}
	//建置查詢全部

	public List<Article_photos> getAll(){
	String SQL="select * from article_photos";
	List<Article_photos> list=getVOBySQL(SQL,null);
	return list;
	}
	//算數量

	public int countAll(){
	String SQL = "select * from article_photos";
	return countBySQL(SQL);
	}
	//建置修改

	public boolean updateByVO(Article_photos article_photos){
	String SQL="update article_photos set art_no=?,art_pt=?,art_pt_idx=? where art_pt_no=?";
	Object[] param ={article_photos.getArt_pt_no(),article_photos.getArt_no(),article_photos.getArt_pt(),article_photos.getArt_pt_idx()};
	boolean updateResult = new SQLHelper().executeUpdate(SQL,param);
	return updateResult;
	}
	//建置新增

	public boolean executeInsert(List<Article_photos> article_photos, Connection conn){
	SQLHelper helper =	new SQLHelper();
	Connection con = conn;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	boolean result = false;
	try {
		for(int i = 0 ; i < article_photos.size() ; i++){
			Article_photos temp = article_photos.get(i);
			String SQL="insert into article_photos values(ARTICLE_PHOTOS_PK_SEQ.nextval,?,?,?)";
			Object[] param ={temp.getArt_no(),temp.getArt_pt(),temp.getArt_pt_idx()};
			pstmt = con.prepareStatement(SQL);
			for(int j = 0 ; j < param.length ; j++){
				if(j==1){
					pstmt.setObject(j+1 , param[j] );
				}else{
					pstmt.setObject(j+1 , param[j] );
				}
			}
			pstmt.addBatch();
		}
		pstmt.executeBatch();
		con.commit();
		result= true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		try {
			con.rollback();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		e.printStackTrace();
	}finally {
		helper.close(con, pstmt);
	}
	
	return result;
	}
	//建置刪除

	public boolean executeDelete(String art_pt_no){
	String SQL="delete from article_photos where art_pt_no=?";
	Object[] param={art_pt_no};
	boolean deleteResult = new SQLHelper().executeUpdate(SQL,param);
	return deleteResult;
	}
	//建置分頁(彈性排序可設條件)

	public List<Article_photos> pageAndRank(int page,int pageSize,String order,String where){
	int firstPage=(page-1)*pageSize+1;
	int lastPage = page*pageSize;
	String SQL="select art_pt_no,art_no,art_pt,art_pt_idx from (select art_pt_no,art_no,art_pt,art_pt_idx, rownum rn from (select * from article_photos";
	if(where!=null){
	SQL = SQL +" where " + where;
	}
	SQL = SQL+ " order by "+order+")) where rn between "+firstPage+" and "+lastPage;
	List<Article_photos> list=getVOBySQL(SQL,null);
	return list;
	}
	//建置分頁(彈性排序不設條件)

	public List<Article_photos> pageAndRank(int page,int pageSize,String order){
	List<Article_photos> list=pageAndRank(page,pageSize,order);
	return list;
	}
	//建置分頁(PK排序)

	public List<Article_photos> pageAndRankByPk(int page,int pageSize){
	List<Article_photos> list=pageAndRank(page,pageSize,"art_pt_no");
	return list;
	}
	//取得圖片集合

	public byte[] getPic(String where){
	String SQL="select art_pt from article_photos where "+ where;
	byte[] list = new SQLHelper().getPic(SQL, null);
	return list;
	}
	//建置取得欄位資料

	public Object[] getCol(String col, Object[] param){
	String SQL = "select "+col+" from article_photos where art_pt_no=?";
	List<Object[]> list = new SQLHelper().executeQuery(SQL, param);
	Object[] colData= list.get(0);
	return colData;
	}

	@Override
	public boolean executeInsert(Article_photos t) {
		// TODO Auto-generated method stub
		return false;
	}
}