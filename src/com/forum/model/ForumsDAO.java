package com.forum.model;

import java.util.ArrayList;
import java.util.List;

import com.forum.domain.*;
import com.forum.util.SQLHelper;

public class ForumsDAO {
	public List<Forum> getAllForum() {

		String SQL = "select * from Forums";
		List list = new SQLHelper().executeQuery(SQL, null);
		List<Forum> temp = new ArrayList<Forum>();

		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			Forum f = null;
			if (obj != null) {
				f = new Forum((String) obj[0], (String) obj[1], (String) obj[2], (String) obj[3], (String) obj[4],
						(String) obj[5], Integer.parseInt(obj[6].toString()));
			}
			temp.add(f);

		}
		return temp;
	}
	public String getForumName(String forum_no) {

		String SQL = "select forum_name from Forums where forum_no=?";
		Object[] param={forum_no};
		List<Object[]> list = new SQLHelper().executeQuery(SQL, param);
		String name= (String)list.get(0)[0];	
		return name;
	}
}
