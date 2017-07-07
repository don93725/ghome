package com.forum.service;

import com.forum.dao.ForumsDAO;
import com.forum.domain.Forums;
import com.forum.inteface.DAOInterface;

public class ForumsSevice {
	 //封裝新增物件
	
	 public boolean add(String forum_no, String mem_no, String forum_name,
	 String forum_desc, String forum_note, String forum_stat, Integer
	 forum_views, Integer forum_mviews){
	 Forums forums = new Forums();
	 forums.setForum_no(forum_no);
	 forums.setMem_no(mem_no);
	 forums.setForum_name(forum_name);
	 forums.setForum_desc(forum_desc);
	 forums.setForum_note(forum_note);
	 forums.setForum_stat(forum_stat);
	 forums.setForum_views(forum_views);
	 forums.setForum_mviews(forum_mviews);
	 DAOInterface dao = new ForumsDAO();
	 boolean result = dao.executeInsert(forums);
	 return result;
	 }
	 public boolean increaseViews(String forum_no){
		 ForumsDAO forumDAO = new ForumsDAO();
		 String col="forum_views,forum_mviews";
		 Object[] param = {forum_no};
		 Object[] viewVal = forumDAO.getCol(col, param);		 
		 for(int i = 0 ; i<viewVal.length ; i++){
			 viewVal[i] = Integer.parseInt(viewVal[i].toString())+1;			 
		 }
		 
		 String SQL = "update forums set forum_views=?,forum_mviews=? where forum_no="+forum_no;
		 
		 boolean result = forumDAO.executeUpdate(SQL, viewVal);
		 return result;
	 }
}
