package com.forum.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.Article_commentsDAO;

/**
 * Servlet implementation class OutputPic
 */
@WebServlet("/forum/OutputPic")
public class OutputPic extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/JPEG");
		ServletOutputStream out = res.getOutputStream();
		String art_cmt_no = req.getParameter("art_cmt_no");
		byte[] b=null;
		try {
			//判斷區請寫入B
			if(art_cmt_no!=null){
				b = new Article_commentsDAO().getPic(art_cmt_no);	
			}
			
			if(b!=null){			
				out.write(b);
				
			}else{
				 InputStream in =getServletContext().getResourceAsStream("/forum/images/tomcat.gif");              
			     b = new byte[in.available()];			     		    
			     out.write(b);
			     in.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			 InputStream in =getServletContext().getResourceAsStream("/forum/images/tomcat.gif");              
		     b = new byte[in.available()];
		     in.read(b);
		     out.write(b);
		     in.close();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
