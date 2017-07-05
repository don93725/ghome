package com.forum.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.domain.Art_types;
import com.forum.domain.Articles;
import com.forum.domain.User;
import com.forum.model.Art_typesDAO;
import com.forum.model.ArticlesDAO;

/**
 * Servlet implementation class ArticlesMakerCtrl
 */
@WebServlet("/forum/ArticlesMakerCtrl")
public class ArticlesMakerCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		String forum_no = req.getParameter("forum_no");
		if(action.equals("new")&&forum_no!=null){
			List<Art_types> art_types=new Art_typesDAO().getVOBySQL("select * from art_types where forum_no="+forum_no, null );
			req.setAttribute("art_types", art_types);
			req.getRequestDispatcher("/WEB-INF/forum/ArticlesMaker.jsp").forward(req, res);
		}else if(action.equals("create")&&forum_no!=null){
			Articles articles=new Articles();
			articles.setArt_name((String) req.getParameter("art_name"));
			articles.setArt_type((String) req.getParameter("art_type_name"));
			articles.setArt_ctx((String) req.getParameter("art_ctx"));
			articles.setForum_no(forum_no);
			articles.setMem_no(((User)req.getSession().getAttribute("user")).getMem_no());
			boolean createResult = new ArticlesDAO().executeInsert(articles);
			if(createResult){
				String URL = this.getServletContext().getContextPath()+"/forum/ForumShowCtrl?forum_no="+forum_no;
				res.sendRedirect(URL);				
			}else{
				req.setAttribute("msg", "失敗");	
				req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
			}
			
			
		}else{
			req.setAttribute("msg", "不知哪版怎去?");
			req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
