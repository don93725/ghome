package com.forum.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.Art_typesDAO;
import com.forum.dao.ArticlesDAO;
import com.forum.dao.ForumsDAO;
import com.forum.domain.Art_types;
import com.forum.domain.Articles;
import com.forum.service.ArticlesSevice;
import com.forum.service.ForumsSevice;

/**
 * Servlet implementation class ForumShowCtrl
 */
@WebServlet("/forum/ForumShowCtrl")
public class ForumShowCtrl extends HttpServlet {
	@Override

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String forum_no = req.getParameter("forum_no");
		
		if(forum_no!=null){
			ArticlesDAO articlesDAO=new ArticlesDAO();
			String thisPage = req.getParameter("thisPage");
			if(thisPage==null){
				thisPage="1";
			}
			int pageSize = 8;
			String art_type_no = req.getParameter("art_type_no");
			if(art_type_no==null) {
				int allPageCount = articlesDAO.countBySQL("select count(*) from articles where forum_no='"+forum_no+"' and art_type_no='"+art_type_no+"'");
			}else {
				int allPageCount = articlesDAO.countBySQL("select count(*) from articles where forum_no='"+forum_no+"'");
			}
			List<Art_types> art_types = new Art_typesDAO()
					.getVOBySQL("select * from art_types where forum_no=" + forum_no, null);
			req.setAttribute("art_types", art_types);
			int allPageCount = articlesDAO.countBySQL("select count(*) from articles where forum_no='"+forum_no+"'");
			allPageCount = (allPageCount-1)/pageSize+1;
			req.setAttribute("allPageCount", allPageCount);
			String queryStr ="ForumShowCtrl?forum_no="+forum_no;
			req.setAttribute("queryStr", queryStr);				
			req.setAttribute("thisPage", thisPage);		
			new ForumsSevice().increaseViews(forum_no);
			List<Articles> articles=new ArticlesSevice().getPageData(Integer.parseInt(thisPage), pageSize, forum_no);
			req.setAttribute("articles", articles);
			req.getRequestDispatcher("/WEB-INF/forum/Forum.jsp").forward(req, res);
		}else{
			req.setAttribute("msg", "不知哪版怎去?");
			req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
