package com.forum.service;

import com.forum.dao.ArticlesDAO;
import com.forum.domain.Articles;
import com.forum.domain.User;

public class ArticlesSevice {
	public boolean addArticles(String mem_no, String forum_no, String art_type_name, String art_name, String art_ctx) {
		Articles articles=new Articles();
		articles.setMem_no(mem_no);
		articles.setForum_no(forum_no);
		articles.setArt_type(art_type_name);
		articles.setArt_name(art_name);
		articles.setArt_ctx(art_ctx);
		boolean result = new ArticlesDAO().executeInsert(articles);
		return result;

	}
}
