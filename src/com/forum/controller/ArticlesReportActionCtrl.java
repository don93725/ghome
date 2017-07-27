package com.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.ArticlesDAO;
import com.forum.dao.ForumsDAO;
import com.forum.domain.Article_report;
import com.forum.service.Article_reportService;
import com.forum.service.ArticlesService;
import com.members.model.Members;

/**
 * Servlet implementation class ArticlesReportCtrl
 */
@WebServlet("/forum/ArticlesReportActionCtrl")
public class ArticlesReportActionCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		Members user = (Members)req.getSession().getAttribute("user");
		String action = req.getParameter("action");
		res.setContentType("text/html ; charset=utf-8");
		PrintWriter out = res.getWriter();
		if (user == null) {
			String URL = this.getServletContext().getContextPath() + "/LoginCtrl";
			res.sendRedirect(URL);
			return;
		}		
		if("insert".equals(action)){
			String rpt_type = req.getParameter("rpt_type");
			String rpt_ctx = req.getParameter("rpt_ctx");
			String art_no = req.getParameter("art_no");
			String mem_no = req.getParameter("mem_no");
			Article_reportService article_reportServiece = new Article_reportService();
			System.out.println(rpt_type+rpt_ctx+art_no+mem_no);
			boolean result = article_reportServiece.add(art_no, user.getMem_no(), rpt_type, rpt_ctx);
			if(result){
				out.print("ok");
			}		
			return;
		}
		
		if("update".equals(action)){
			Article_reportService article_reportServiece = new Article_reportService();
			String art_rpt_no = req.getParameter("art_rpt_no");
			boolean result = article_reportServiece.updateVO(art_rpt_no);
			if(result){
				out.print("ok");
			}
			return;
		}
		if("delete".equals(action)){
			ArticlesDAO articlesDAO = new ArticlesDAO();
			String art_no = req.getParameter("art_no");			
			boolean result = articlesDAO.executeDelete(art_no);		
			if(result){
				out.print("ok");
			}
			return;
		}
		
		if("select".equals(action)){
			Article_reportService article_reportServiece = new Article_reportService();
			String thisPage = (req.getParameter("thisPage")==null)? "1":req.getParameter("thisPage");
			String rpt_type = req.getParameter("rpt_type");
			String forum_no = req.getParameter("forum_no");
			int pageSize = 8;
			List<Article_report> article_report = article_reportServiece.pageAndRank(thisPage, pageSize,forum_no, rpt_type);
			String queryStr = "ArticlesReportActionCtrl?action=select&forum_no="+forum_no;
			if(rpt_type!=null){
				queryStr = queryStr +"&rpt_type="+rpt_type;
			}
			int allPageCount = article_reportServiece.countAllPage(forum_no,pageSize);
			Object[] param = {forum_no};
			String forum_name= (String)new ForumsDAO().getCol("forum_name",param )[0];			
			req.setAttribute("forum_name", forum_name);
			req.setAttribute("queryStr", queryStr);
			req.setAttribute("thisPage", thisPage);
			req.setAttribute("article_report", article_report);
			req.setAttribute("allPageCount", allPageCount);
			req.getRequestDispatcher("/front_end/forum/ArticlesReport.jsp").forward(req, res);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
