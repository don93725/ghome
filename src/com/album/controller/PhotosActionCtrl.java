package com.album.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.don.util.ResizeImage;
import com.don.util.TransData;
import com.forum.dao.Article_commentsDAO;
import com.forum.dao.Article_photosDAO;

/**
 * Servlet implementation class PhotosActionCtrl
 */
@WebServlet("/album/PhotosActionCtrl")
@MultipartConfig(fileSizeThreshold = 100, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class PhotosActionCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Part part= req.getPart("photo");
		
		byte[] bytes = TransData.transBlob(part);
		System.out.println(bytes.length);
		byte[] b = ResizeImage.resizeImageAsJPG(bytes, 300);		
		System.out.println(b.length);
		res.setContentType("image/JPEG");		
		ServletOutputStream out = res.getOutputStream();
		Base64.Decoder decoder = Base64.getDecoder();
		byte[] buffer2 = decoder.decode("base64");	
		out.write(b);				

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
