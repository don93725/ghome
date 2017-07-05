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

import com.forum.dao.ArticlesDAO;
import com.forum.dao.ForumsDAO;
import com.forum.domain.Articles;
import com.forum.domain.Forum;

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
			int allPageCount = articlesDAO.countBySQL("select count(*) from articles where forum_no='"+forum_no+"'");
			allPageCount = (allPageCount-1)/pageSize+1;
			String queryStr ="ForumShowCtrl?forum_no="+forum_no;
			req.setAttribute("allPageCount", allPageCount);
			req.setAttribute("thisPage", thisPage);			
			req.setAttribute("queryStr", queryStr);			
			String where = "forum_no="+forum_no;
			String order = "art_add_date desc";
			
			List<Articles> articles=articlesDAO.pageAndRank(Integer.parseInt(thisPage), pageSize, order, where);
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
