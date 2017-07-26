package com.album.service;



import com.album.domain.Photos;

import java.io.IOException;

import javax.servlet.http.Part;

import com.album.dao.PhotosDAO;

import com.don.util.TransData;

public class PhotosService{
	//封裝新增物件

	public boolean add(String photo_no, String album_no, Part photo){
	Photos photos = new Photos();
	photos.setPhoto_no(photo_no);
	photos.setAlbum_no(album_no);
	try {
		photos.setPhoto(TransData.transBlob(photo));
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	PhotosDAO dao = new PhotosDAO();
	boolean result = dao.executeInsert(photos);
	return result;
	}
}
