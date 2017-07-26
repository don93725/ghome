package com.forum.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.members.model.Members;

/**
 * Servlet implementation class Login
 */
@WebServlet("/forum/Login")
public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Members members = new Members();
		members.setMem_no("1");
		members.setMem_nickname("神東");
		members.setMem_rank("3");
		session.setAttribute("user",members);
		res.setContentType("text/html; charset=utf-8");
		res.getWriter().println("login");
		System.out.println(((Members)session.getAttribute("user")).getMem_nickname()+"登入了");
		req.getRequestDispatcher("/forum/ForumCtrl").forward(req, res);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
