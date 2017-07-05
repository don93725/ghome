package com.forum.dao;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.forum.domain.Art_types;
import com.forum.domain.Article_comments;
import com.forum.util.BasicDAO;
import com.forum.util.DAOInterface;
import com.forum.util.SQLHelper;

public class Article_commentsDAO extends BasicDAO implements DAOInterface<Article_comments>{
	//建置查詢

	public List<Article_comments> getVOBySQL(String SQL,Object[] param){
	List list = new SQLHelper().executeQuery(SQL, param);
	List<Article_comments> tempList = new ArrayList<Article_comments>();
	for(int i = 0 ; i < list.size() ; i++){
	Object[] obj =(Object[]) list.get(i);
	Article_comments article_comments= new Article_comments();
	if(obj[0]!=null){
	article_comments.setArt_cmt_no((String)obj[0]);
	}
	if(obj[1]!=null){
	article_comments.setArt_no((String)obj[1]);
	}
	if(obj[2]!=null){
	article_comments.setMem_no((String)obj[2]);
	}
	if(obj[3]!=null){
	article_comments.setArt_cmt_ctx((String)obj[3]);
	}
	if(obj[4]!=null){
	article_comments.setArt_cmt_img((Blob)obj[4]);
	}
	if(obj[5]!=null){
	article_comments.setArt_cmt_time((Date)obj[5]);
	}
	tempList.add(article_comments);
	}
	return tempList;
	}
	//建置查詢單筆

	public Article_comments getVOByPK(String art_cmt_no){
	String SQL ="Select * from article_comments where art_cmt_no=?";
	Object[] param ={art_cmt_no};
	List<Article_comments> list=getVOBySQL(SQL,param);
	Article_comments article_comments=list.get(0);
	return article_comments;
	}
	//建置查詢全部

	public List<Article_comments> getAll(){
	String SQL="select * from article_comments";
	List<Article_comments> list=getVOBySQL(SQL,null);
	return list;
	}
	//算數量

	public int countAll(){
	String SQL = "select * from article_comments";
	return countBySQL(SQL);
	}
	//建置修改

	public boolean updateByVO(Article_comments article_comments){
	String SQL="update article_comments set art_no=?,mem_no=?,art_cmt_ctx=?,art_cmt_img=?,art_cmt_time=? where art_cmt_no=?";
	Object[] param ={article_comments.getArt_cmt_no(),article_comments.getArt_no(),article_comments.getMem_no(),article_comments.getArt_cmt_ctx(),article_comments.getArt_cmt_img(),article_comments.getArt_cmt_time()};
	boolean updateResult = new SQLHelper().executeUpdate(SQL,param);
	return updateResult;
	}
	//建置新增

	public boolean executeInsert(Article_comments article_comments){
	String SQL="insert into article_comments values(article_comments_pk_seq.nextval,?,?,?,?,sysdate)";
	Object[] param ={article_comments.getArt_no(),article_comments.getMem_no(),article_comments.getArt_cmt_ctx(),article_comments.getArt_cmt_img()};
	boolean insertResult = new SQLHelper().executeUpdate(SQL,param);
	return insertResult;
	}
	//建置刪除

	public boolean executeDelete(String art_cmt_no){
	String SQL="delete from article_comments where art_cmt_no=?";
	Object[] param={art_cmt_no};
	boolean deleteResult = new SQLHelper().executeUpdate(SQL,param);
	return deleteResult;
	}
	//建置分頁(彈性排序可設條件)

	public List<Article_comments> pageAndRank(int page,int pageSize,String order,String where){
	int firstPage=(page-1)*pageSize;
	int lastPage = page*pageSize-1;
	if(page==1){
		firstPage = 1;		
	}
	String SQL="select art_cmt_no,art_no,mem_no,art_cmt_ctx,art_cmt_img,art_cmt_time from (select art_cmt_no,art_no,mem_no,art_cmt_ctx,art_cmt_img,art_cmt_time, rownum rn from (select * from article_comments";
	if(where!=null){
	SQL = SQL +" where " + where;
	}
	SQL = SQL+ " order by "+order+")) where rn between "+firstPage+" and "+lastPage;
	List<Article_comments> list=getVOBySQL(SQL,null);
	return list;
	}
	//建置分頁(彈性排序不設條件)

	public List<Article_comments> pageAndRank(int page,int pageSize,String order){
	List<Article_comments> list=pageAndRank(page,pageSize,order);
	return list;
	}
	//建置分頁(PK排序)

	public List<Article_comments> pageAndRankByPk(int page,int pageSize){
	List<Article_comments> list=pageAndRank(page,pageSize,"art_cmt_no");
	return list;
	}
}
