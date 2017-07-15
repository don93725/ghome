package com.forum.service;

import java.util.List;

import com.forum.dao.ArticlesDAO;
import com.forum.dao.ForumsDAO;
import com.forum.domain.Article_photos;
import com.forum.domain.Articles;
import com.forum.domain.User;

public class ArticlesSevice {
	//含相片
	public boolean add(String mem_no, String forum_no, String art_type_name, String art_name, String art_ctx) {
		Articles articles=new Articles();
		articles.setMem_no(mem_no);
		articles.setForum_no(forum_no);
		articles.setArt_type(art_type_name);
		articles.setArt_name(art_name);
		articles.setArt_ctx(art_ctx);
		boolean result = new ArticlesDAO().executeInsert(articles);
		return result;
	}
	//含相片
	public boolean add(String mem_no, String forum_no, String art_type_name, String art_name, String art_ctx, List<Article_photos> article_photos) {
		Articles articles=new Articles();
		articles.setMem_no(mem_no);
		articles.setForum_no(forum_no);
		articles.setArt_type(art_type_name);
		articles.setArt_name(art_name);
		articles.setArt_ctx(art_ctx);
		
		boolean result = new ArticlesDAO().executeInsert(articles,article_photos);
		return result;
	}
	public boolean update(String art_type_name, String art_name, String art_ctx,String art_no) {
		Articles articles=new Articles();
		articles.setArt_type(art_type_name);
		articles.setArt_name(art_name);
		articles.setArt_ctx(art_ctx);
		articles.setArt_no(art_no);
		boolean result = new ArticlesDAO().updateByVO(articles);
		return result;
	}
	public boolean update(String art_type_name, String art_name, String art_ctx,String art_no,List<Article_photos> article_photos, String updateInfo, String deleteInfo) {
		Articles articles=new Articles();
		articles.setArt_type(art_type_name);
		articles.setArt_name(art_name);
		articles.setArt_ctx(art_ctx);
		articles.setArt_no(art_no);
		String[] updateInfos = null;
		String[] deleteInfos = null;
		boolean result = false;
		if(updateInfo.length()>1){
			updateInfos = updateInfo.split(",");			
		}
		if(deleteInfo.length()>1){
			deleteInfos = updateInfo.split(",");		
		}
		if(article_photos.size()==0&&deleteInfos==null){
			result = update(art_type_name, art_name,art_no, art_ctx);
		}else {			
			result = new ArticlesDAO().updateByVO(articles,article_photos,updateInfos,deleteInfos);
		}
		
		return result;
	}
	
	public List<Articles> getPageData(int thisPage,int pageSize,String forum_no) {
		String where = "forum_no="+forum_no;
		String order = "art_add_date desc";		
		List<Articles> articles=new ArticlesDAO().pageAndRank(thisPage, pageSize, order, where);
		return articles;
	}
	 public boolean increaseViews(String art_no){
		 ArticlesDAO articlesDAO = new ArticlesDAO();
		 String col="art_views,art_mviews";
		 Object[] param = {art_no};
		 Object[] viewVal = articlesDAO.getCol(col, param);		 
		 for(int i = 0 ; i<viewVal.length ; i++){
			 viewVal[i] = Integer.parseInt(viewVal[i].toString())+1;			 
		 }		 
		 String SQL = "update articles set art_views=?,art_mviews=? where art_no="+art_no;
		 
		 boolean result = articlesDAO.executeUpdate(SQL, viewVal);
		 return result;
	 }
	
}
