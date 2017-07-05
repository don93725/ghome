package com.forum.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.domain.Article_comments;
import com.forum.domain.Articles;
import com.forum.model.Article_commentsDAO;
import com.forum.model.ArticlesDAO;
import com.forum.model.ForumsDAO;
import com.forum.util.DAOInterface;

/**
 * Servlet implementation class ArticleShowCtrl
 */
@WebServlet("/forum/ArticleShowCtrl")
public class ArticleShowCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String art_no = req.getParameter("art_no");
		String forum_no = req.getParameter("forum_no");
		if(art_no!=null&&forum_no!=null){
			Articles articles = (Articles) new ArticlesDAO().getVOByPK(art_no);
			String thisPage = req.getParameter("thisPage");				
			if(thisPage==null){
				thisPage="1";
			}
			int pageSize = 5;
			int allPageCount = new Article_commentsDAO().countBySQL("select count(*) from article_comments where art_no="+art_no);
			
			if(allPageCount!=0){
				allPageCount = allPageCount/pageSize +1;				
			}else{
				allPageCount=1;
			}
			String order = "art_cmt_time";
			String where = "art_no="+art_no;
			List<Article_comments> article_comments = new Article_commentsDAO().pageAndRank(Integer.parseInt(thisPage), pageSize, order,where);
			String forum_name= new ForumsDAO().getForumName(forum_no);
			String queryStr = "ArticleShowCtrl?forum_no="+forum_no+"&art_no="+art_no;
			req.setAttribute("thisPage", thisPage);
			req.setAttribute("forum_name", forum_name);
			req.setAttribute("allPageCount", allPageCount);
			req.setAttribute("articles", articles);
			req.setAttribute("article_comments", article_comments);
			req.setAttribute("queryStr", queryStr);			
			req.getRequestDispatcher("/WEB-INF/forum/ArticleDisplay.jsp").forward(req, res);
		}else{
			req.setAttribute("msg", "from ArticleShowCtrl");
			req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
