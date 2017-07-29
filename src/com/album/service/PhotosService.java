package com.album.service;



import com.album.domain.Photos;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.List;

import javax.servlet.http.Part;


import com.album.dao.PhotosDAO;
import com.don.util.ResizeImage;
import com.don.util.TransData;

public class PhotosService{
	//封裝新增物件


		//封裝新增物件

		public boolean add(List<Photos> photos,String al_no) throws UnsupportedEncodingException{
			Base64.Decoder decoder = Base64.getMimeDecoder();
			
			for(Photos p : photos){

				p.setAl_no(al_no);
				String jStr = p.getSrc().split(",")[1];
				jStr = jStr.replaceAll(" ", "+");
				System.out.println(jStr);
				byte[] b = decoder.decode(jStr);
				byte[] sb = null;
				
				try {
					if(b.length>150000){
						b = ResizeImage.resizeImageAsJPG(b, 800);
						p.setPhoto(b);
					}
					sb = ResizeImage.resizeImageAsJPG(b, 200);
				} catch (IOException e) {
				// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				p.setPhoto(b);
				p.setSphoto(sb);			
			}
		
		PhotosDAO dao = new PhotosDAO();
		boolean result = dao.executeInsert(photos);
		return result;
		}
}
