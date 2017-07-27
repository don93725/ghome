package com.album.service;



import com.album.domain.Photos;

import java.io.IOException;

import javax.servlet.http.Part;

import com.album.dao.PhotosDAO;
import com.don.util.ResizeImage;
import com.don.util.TransData;

public class PhotosService{
	//封裝新增物件


		//封裝新增物件

		public boolean add(String album_no, String photo_desc, Part photo, Part sphoto){
		Photos photos = new Photos();
		photos.setAlbum_no(album_no);
		photos.setPhoto_desc(photo_desc);
		try {
			photos.setPhoto(TransData.transBlob(photo));
			photos.setSphoto(ResizeImage.resizeImageAsJPG(photos.getPhoto(),100));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PhotosDAO dao = new PhotosDAO();
		boolean result = dao.executeInsert(photos);
		return result;
		}
}
