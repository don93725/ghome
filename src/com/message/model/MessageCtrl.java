package com.message.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.model.MembersVO;

/**
 * Servlet implementation class MessageCtrl
 */
@WebServlet("/message/MessageCtrl")
public class MessageCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		MembersVO user = (MembersVO) req.getSession().getAttribute("user");
		String user_no = user.getMem_no();
		MessageService messageService = new MessageService();

		if(action==null){
			
			List<Message> lastestMsg = messageService.getLastestMsg(user_no);
			req.setAttribute("lastestMsg", lastestMsg);
			req.getRequestDispatcher("/front_end/message/Message.jsp").forward(req, res);
			return;
		}
		if("getOne".equals(action)){
			String post_no = req.getParameter("post_no");
			int thisPage = (req.getParameter("thisPage")==null)? 1:Integer.parseInt(req.getParameter("thisPage"));
			int pageSize = 6;
			List<Message> oneMsg = messageService.getOneMsg(thisPage, pageSize, user_no, post_no);
			if(thisPage==1){
				int oneNum = (messageService.getOneMsgNum(user_no, post_no)-1)/pageSize +1;
				req.setAttribute("oneNum",oneNum);				
			}
			Collections.reverse(oneMsg);
			req.setAttribute("oneMsg",oneMsg);
			res.setContentType("text/html; charset=utf-8");
			req.getRequestDispatcher("/front_end/message/Message2.jsp").forward(req, res);
			
			return;
		}

		if ("insert".equals(action)) {
			// 新增
			messageService.add("1", "1", "好");
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
