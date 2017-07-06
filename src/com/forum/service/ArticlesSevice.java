package com.forum.service;

import java.util.List;

import com.forum.dao.ArticlesDAO;
import com.forum.domain.Articles;
import com.forum.domain.User;

public class ArticlesSevice {
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
	public boolean update(String art_type_name, String art_name, String art_ctx,String art_no) {
		Articles articles=new Articles();
		articles.setArt_type(art_type_name);
		articles.setArt_name(art_name);
		articles.setArt_ctx(art_ctx);
		articles.setArt_no(art_no);
		boolean result = new ArticlesDAO().updateByVO(articles);
		return result;
	}
	public boolean update(){
		Articles articles = new  Articles();
		boolean result = new ArticlesDAO().updateByVO(articles);
		return result;
	}
	public List<Articles> getPageData(int thisPage,int pageSize,String forum_no) {
		String where = "forum_no="+forum_no;
		String order = "art_add_date desc";		
		List<Articles> articles=new ArticlesDAO().pageAndRank(thisPage, pageSize, order, where);
		return articles;
	}
	
}
