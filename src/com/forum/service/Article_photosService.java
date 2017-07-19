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
			if("file".equals(part.getName())){
				Article_photos article_photos = new Article_photos();
				article_photos.setArt_pt_idx(String.valueOf(i++));
				try {
					article_photos.setArt_pt(TransData.transBlob(part));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				list.add(article_photos);
			}
			
		}
		
		return list;
		
	}
	public List<Article_photos> setArticle_photos(Collection<Part> parts,String order,String updateInfo){
		
		List<Article_photos> list = new ArrayList<Article_photos>();
		String[] orders = order.split(",");
		String[] updateInfos = updateInfo.split(",");
		int numForNew = orders.length-1;
		int i = 0;
		for(Part part : parts){			
			if("file".equals(part.getName())){
				Article_photos article_photos = new Article_photos();
				if(i<updateInfos.length){
					article_photos.setArt_pt_idx(updateInfos[i++]);
				}else{
					article_photos.setArt_pt_idx(String.valueOf(numForNew++));						
				}
				try {
					article_photos.setArt_pt(TransData.transBlob(part));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				list.add(article_photos);
			}
			
		}
		
		return list;
		
	}
		

}
