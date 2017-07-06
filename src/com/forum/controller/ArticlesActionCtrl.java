package com.forum.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.Art_typesDAO;
import com.forum.dao.ArticlesDAO;
import com.forum.domain.Art_types;
import com.forum.domain.Articles;
import com.forum.domain.User;
import com.forum.service.ArticlesSevice;

/**
 * Servlet implementation class ArticlesMakerCtrl
 */
@WebServlet("/forum/ArticlesActionCtrl")
public class ArticlesActionCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		String forum_no = req.getParameter("forum_no");
		if (action.equals("new") && forum_no != null) {
			List<Art_types> art_types = new Art_typesDAO()
					.getVOBySQL("select * from art_types where forum_no=" + forum_no, null);
			req.setAttribute("art_types", art_types);
			req.getRequestDispatcher("/WEB-INF/forum/ArticlesMaker.jsp").forward(req, res);
			
		} else if (forum_no != null) {
			switch (action) {
			case "create":
				Articles articles = new Articles();
				String art_name = req.getParameter("art_name");
				String art_type_name = req.getParameter("art_type_name");
				String art_ctx = req.getParameter("art_ctx");
				String mem_no = ((User) req.getSession().getAttribute("user")).getMem_no();
				ArticlesSevice articlesSevice = new ArticlesSevice();
				boolean createResult = articlesSevice.add(mem_no, forum_no, art_type_name, art_name, art_ctx);
				if (createResult) {
					String URL = this.getServletContext().getContextPath() + "/forum/ForumShowCtrl?forum_no="
							+ forum_no;
					res.sendRedirect(URL);
				} else {
					req.setAttribute("msg", "失敗");
					req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
				}
			case "update":
				System.out.println("update?");
				break;
			case "delete":
				System.out.println("delete?");
				break;
			case "report":
				System.out.println("report?");
				break;
			default:
				System.out.println("what r u doing?");
			}

		} else {
			req.setAttribute("msg", "不知哪版怎去?");
			req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
