package com.forum.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

import com.forum.domain.Article_photos;
import com.forum.util.TransData;

public class Article_photosService {
	public List<Article_photos> setArticle_photos(Collection<Part> parts){
		
		List<Article_photos> list = new ArrayList<Article_photos>();
		int i = 0;
		for(Part part : parts){
			Article_photos article_photos = new Article_photos();
			article_photos.setArt_pt_idx((i++)+"");
			try {
				article_photos.setArt_pt(TransData.transBlob(part));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			list.add(article_photos);
		}
		
		return list;
		
	}
}
