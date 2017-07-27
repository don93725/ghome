package com.forum.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.album.domain.Albums;
import com.album.service.AlbumsService;
import com.members.model.Members;


@WebServlet("/forCopy")
public class AAforCopy extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String action = req.getParameter("action");
		Members user = (Members) req.getSession().getAttribute("user");

		if (action == null) {
			
		}

		if (user == null) {
			// 轉回登入頁面
			res.sendRedirect(req.getContextPath() + "/LoginCtrl");
			return;
		}

		if ("insert".equals(action)) {
			// 新增
			return;
		}
		if ("update".equals(action)) {
			// 修改
			return;
		}
		if ("delete".equals(action)) {
			// 刪除
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


}
