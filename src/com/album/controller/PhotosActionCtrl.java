package com.album.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.util.Base64;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.album.domain.Photos;
import com.album.service.PhotosService;
import com.don.util.ResizeImage;
import com.don.util.TransData;
import com.forum.dao.Article_commentsDAO;
import com.forum.dao.Article_photosDAO;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * Servlet implementation class PhotosActionCtrl
 */
@WebServlet("/album/PhotosActionCtrl")
public class PhotosActionCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		

		BufferedReader br = req.getReader();
		StringBuffer jsonIn = new StringBuffer();
		String line = null;
		while ((line = br.readLine()) != null) {
			jsonIn.append(line);
			System.out.println(line);
		}
		String al_no = req.getParameter("al_no");
		Gson gson = new Gson();
		Type collectionType = new TypeToken<List<Photos>>(){}.getType();	
		List<Photos> photos = gson.fromJson(jsonIn.toString(), collectionType);

		PhotosService photosService = new PhotosService();
		boolean result = photosService.add(photos, al_no);
		
//		byte[] bytes = TransData.transBlob(part);
//		System.out.println(bytes.length);
				
//		System.out.println(b.length);
//		res.setContentType("image/JPEG");		
//		ServletOutputStream out = res.getOutputStream();
//		Base64.Decoder decoder = Base64.getDecoder();
//		byte[] buffer2 = decoder.decode("base64");	
//		out.write(b);				

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
