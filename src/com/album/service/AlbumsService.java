package com.album.service;

import java.util.Date;
import java.util.List;

import com.album.dao.AlbumsDAO;
import com.album.domain.Albums;
import com.don.inteface.DAOInterface;
import com.don.inteface.ServiceIntface;
import com.forum.domain.Article_comments;

public class AlbumsService {
	// 封裝新增物件

	public boolean add(String al_no, String mem_no, Date al_date, String al_name, Integer al_views, String al_prvt) {
		Albums albums = new Albums();
		albums.setAl_no(al_no);
		albums.setMem_no(mem_no);
		albums.setAl_date(al_date);
		albums.setAl_name(al_name);
		albums.setAl_views(al_views);
		albums.setAl_prvt(al_prvt);
		DAOInterface dao = new AlbumsDAO();
		boolean result = dao.executeInsert(albums);
		return result;
	}

}
