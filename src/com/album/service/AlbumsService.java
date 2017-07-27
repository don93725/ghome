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

	public boolean add(String mem_no, String al_name, String al_prvt) {
		Albums albums = new Albums();
		albums.setMem_no(mem_no);
		albums.setAl_name(al_name);
		albums.setAl_prvt(al_prvt);
		DAOInterface dao = new AlbumsDAO();
		boolean result = dao.executeInsert(albums);
		return result;
	}
	public boolean update(String al_no, String al_name, String al_prvt) {
		Albums albums = new Albums();
		albums.setAl_no(al_no);
		albums.setAl_name(al_name);
		albums.setAl_prvt(al_prvt);
		DAOInterface dao = new AlbumsDAO();
		boolean result = dao.updateByVO(albums);
		return result;
	}
	public boolean delete(String[] al_no) {
		AlbumsDAO dao = new AlbumsDAO();
		boolean result = dao.executeDelete(al_no);
		return result;
	}
	public List<Albums> getPublicVO(int page,int pageSize,String mem_no){
		AlbumsDAO albumsDAO = new AlbumsDAO();
		String where = "mem_no="+mem_no;
		String order = "al_date";
		Object[] param = {mem_no};
		List<Albums> albums = albumsDAO.pageAndRank(page, pageSize, order, where);
		return albums;
	}
	public List<Albums> getPrivateVO(int page,int pageSize,String mem_no){
		AlbumsDAO albumsDAO = new AlbumsDAO();
		String where = "mem_no="+mem_no+" and al_prvt=0 ";
		String order = "al_date";
		Object[] param = {mem_no};
		List<Albums> albums = albumsDAO.pageAndRank(page, pageSize, order, where);
		return albums;
	}
	public int getPublicNum(String mem_no,int pageSize){
		AlbumsDAO albumsDAO = new AlbumsDAO();
		String sql = "select count(*) from albums where mem_no="+mem_no;
		int num = albumsDAO.countBySQL(sql);
		return (num-1)/pageSize+1;
	}
	public int getPrivateNum(String mem_no,int pageSize){
		AlbumsDAO albumsDAO = new AlbumsDAO();
		String sql = "select count(*) from albums where mem_no="+mem_no+" and al_prvt=0";
		int num = albumsDAO.countBySQL(sql);
		return (num-1)/pageSize+1;
	}

}
