package com.forum.service;

import java.io.IOException;

import javax.servlet.http.Part;

import com.forum.dao.Article_commentsDAO;
import com.forum.domain.Article_comments;
import com.forum.domain.Articles;
import com.forum.util.TransData;

public class Article_commentsSevice {
	public boolean add(String art_no, String mem_no,Part part  , String art_cmt_ctx){
		Article_comments article_comments = new Article_comments();
		article_comments.setArt_no(art_no);
		article_comments.setMem_no(mem_no);
		if(part!=null){				
			try {
				article_comments.setArt_cmt_img(TransData.transBlob(part));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			article_comments.setArt_cmt_img(null);		
		}
		article_comments.setArt_cmt_ctx(art_cmt_ctx);
		boolean result = new Article_commentsDAO().executeInsert(article_comments);
		return result;
		
	}
	
}
