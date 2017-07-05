package com.forum.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.forum.domain.Article_comments;
import com.forum.domain.User;
import com.forum.model.Article_commentsDAO;
import com.forum.util.TransData;



@WebServlet("/forum/ArtCmtMakerCtrl")
public class ArtCmtMakerCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		HttpSession session = req.getSession();
		String art_no = req.getParameter("art_no");
		User user = ((User)session.getAttribute("user"));
		
		Part part = null;
		String art_cmt_ctx = req.getParameter("art_cmt_ctx");
		if(user==null){
			String URL = this.getServletContext().getContextPath()+"/forum/LoginCtrl";
			res.sendRedirect(URL);
		}else if(art_no!=null&&art_cmt_ctx!=null){
			String mem_no = user.getMem_no();
			Article_comments article_comments = new Article_comments();
			article_comments.setArt_no(art_no);
			article_comments.setMem_no(mem_no);
			if(part!=null){				
				article_comments.setArt_cmt_img(TransData.transBlob(part));
			}else{
				article_comments.setArt_cmt_img(null);		
			}
			article_comments.setArt_cmt_ctx(art_cmt_ctx);
			boolean result = new Article_commentsDAO().executeInsert(article_comments);
			if(result){
				String forum_no=req.getParameter("forum_no");
				String URL=getServletContext().getContextPath()+"/forum/ArticleShowCtrl?forum_no="+forum_no	+"&art_no="+art_no;
				res.sendRedirect(URL);
			}else{
				req.setAttribute("msg", "fail create comment");
				req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
			}
		}else{
			req.setAttribute("msg", "from cmtMaker");
			req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
