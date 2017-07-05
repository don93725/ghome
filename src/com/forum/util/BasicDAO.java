package com.forum.util;

import java.util.List;

public class BasicDAO {
	
	public int countBySQL(String SQL) {
		List list = (List) new SQLHelper().executeQuery(SQL, null);
		System.out.println(list.size());
		Object[] obj =null;
		if(list.size()!=0){
			obj = (Object[]) list.get(0);
		}
		int num = 0;
		if (obj != null) {
			num = Integer.parseInt(obj[0].toString());
		}
		return num;
	}
	
	public List executeQuery(String SQL,Object[] param){
		return new SQLHelper().executeQuery(SQL, param);
	}
		
	public boolean executeUpdate(String SQL,Object[] param){
		return new SQLHelper().executeUpdate(SQL, param);
	}
	public boolean executeUpdate(String[] SQL,Object[][] param){
		return new SQLHelper().executeUpdate(SQL, param);
	}
	
	
}
