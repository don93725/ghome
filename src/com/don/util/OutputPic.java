package com.don.util;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.Article_commentsDAO;
import com.forum.dao.Article_photosDAO;

/**
 * Servlet implementation class OutputPic
 */
@WebServlet("/util/OutputPic")
public class OutputPic extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/JPEG");
		ServletOutputStream out = res.getOutputStream();
		String art_cmt_no = req.getParameter("art_cmt_no");
		String art_no = req.getParameter("art_no");
		
		byte[] bytes=null;
		try {
			//判斷區請寫入B
			if(art_cmt_no!=null){
				bytes = new Article_commentsDAO().getPic(art_cmt_no);	
			}
			if(art_no!=null){
				String art_pt_idx = req.getParameter("art_pt_idx");
				String where = "art_no="+art_no+"and art_pt_idx="+art_pt_idx;
				bytes = new Article_photosDAO().getPic(where);
			}
			if(bytes!=null){			
				out.write(bytes);				
			}else{
				 InputStream in =getServletContext().getResourceAsStream("/front_end/forum/images/tomcat.gif");              
				 bytes = new byte[in.available()];	
				 in.read(bytes);
			     out.write(bytes);
			     in.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			 InputStream in =getServletContext().getResourceAsStream("/front_end/forum/images/tomcat.gif");              
			 bytes = new byte[in.available()];
		     in.read(bytes);
		     out.write(bytes);
		     in.close();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
