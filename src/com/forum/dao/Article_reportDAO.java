package com.forum.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.forum.domain.Article_report;
import com.forum.domain.Articles;
import com.forum.inteface.DAOInterface;
import com.forum.util.BasicDAO;
import com.forum.util.SQLHelper;

public class Article_reportDAO extends BasicDAO implements DAOInterface<Article_report>{
		//建置查詢

		public List<Article_report> getVOBySQL(String SQL,Object[] param){
		List list = new SQLHelper().executeQuery(SQL, param);
		List<Article_report> tempList = new ArrayList<Article_report>();
		for(int i = 0 ; i < list.size() ; i++){
		Object[] obj =(Object[]) list.get(i);
		Article_report article_report= new Article_report();
		if(obj[0]!=null){
		article_report.setArt_rpt_no((String)obj[0]);
		}
		if(obj[1]!=null){
		Articles articles = new Articles();
		articles.setArt_no(String.valueOf(obj[1]));
		articles.setForum_no(String.valueOf(obj[7]));
		articles.setArt_type(String.valueOf(obj[8]));
		articles.setArt_name(String.valueOf(obj[9]));
		articles.setArt_ctx(String.valueOf(obj[10]));		
		article_report.setArt_no(articles);
		}
		if(obj[2]!=null){
		article_report.setRpt_mem_no((String)obj[2]);
		}
		if(obj[3]!=null){
		article_report.setRpt_type((String)obj[3]);
		}
		if(obj[4]!=null){
		article_report.setRpt_ctx((String)obj[4]);
		}
		if(obj[5]!=null){
		article_report.setRpt_time((Date)obj[5]);
		}
		if(obj[6]!=null){
		article_report.setRpt_stat((String)obj[6]);
		}
		tempList.add(article_report);
		}
		return tempList;
		}
		//建置查詢單筆

		public Article_report getVOByPK(String art_rpt_no){
		String SQL ="Select * from article_report where art_rpt_no=?";
		Object[] param ={art_rpt_no};
		List<Article_report> list=getVOBySQL(SQL,param);
		Article_report article_report=list.get(0);
		return article_report;
		}
		//建置查詢全部

		public List<Article_report> getAll(){
		String SQL="select * from article_report";
		List<Article_report> list=getVOBySQL(SQL,null);
		return list;
		}
		//算數量

		public int countAll(){
		String SQL = "select * from article_report";
		return countBySQL(SQL);
		}
		//建置修改

		public boolean updateByVO(Article_report article_report){
		String SQL="update article_report set rpt_stat=1 where art_rpt_no=?";
		Object[] param ={article_report.getArt_rpt_no()};
		boolean updateResult = new SQLHelper().executeUpdate(SQL,param);
		return updateResult;
		}
		//建置新增

		public boolean executeInsert(Article_report article_report){
		String SQL="insert into article_report values(article_report_pk_seq.nextval,?,?,?,?,default,default)";
		Object[] param ={article_report.getArt_no().getArt_no(),article_report.getRpt_mem_no(),article_report.getRpt_type(),article_report.getRpt_ctx()};
		boolean insertResult = new SQLHelper().executeUpdate(SQL,param);
		return insertResult;
		}
		//建置刪除

		public boolean executeDelete(String art_rpt_no){
		String SQL="delete from article_report where art_rpt_no=?";
		Object[] param={art_rpt_no};
		boolean deleteResult = new SQLHelper().executeUpdate(SQL,param);
		return deleteResult;
		}
		//建置分頁(彈性排序可設條件)

		public List<Article_report> pageAndRank(int page,int pageSize,String order,String where){
		int firstPage=(page-1)*pageSize+1;
		int lastPage = page*pageSize;
		String SQL="select art_rpt_no,art_no,rpt_mem_no,rpt_type,rpt_ctx,rpt_time,rpt_stat,forum_no,art_type,art_name,art_ctx from (select art_rpt_no,art_no,rpt_mem_no,rpt_type,rpt_ctx,rpt_time,rpt_stat,forum_no,art_type,art_name,art_ctx, rownum rn from (select art_rpt_no,a.art_no,rpt_mem_no,rpt_type,rpt_ctx,rpt_time,rpt_stat,forum_no,art_type,art_name,art_ctx from article_report a join (select forum_no,art_type,art_name,art_ctx,art_no from articles) b on a.art_no=b.art_no";
		if(where!=null){
		SQL = SQL +" where " + where;
		}
		SQL = SQL+ " order by "+order+")) where rn between "+firstPage+" and "+lastPage;;
		List<Article_report> list=getVOBySQL(SQL,null);
		return list;
		}
		//建置分頁(彈性排序不設條件)

		public List<Article_report> pageAndRank(int page,int pageSize,String order){
		List<Article_report> list=pageAndRank(page,pageSize,order);
		return list;
		}
		//建置分頁(PK排序)

		public List<Article_report> pageAndRankByPk(int page,int pageSize){
		List<Article_report> list=pageAndRank(page,pageSize,"art_rpt_no");
		return list;
		}
		//建置取得欄位資料

		public Object[] getCol(String col, Object[] param){
		String SQL = "select "+col+" from article_report where art_rpt_no=?";
		List<Object[]> list = new SQLHelper().executeQuery(SQL, param);
		Object[] colData= list.get(0);
		return colData;

		}

		
}