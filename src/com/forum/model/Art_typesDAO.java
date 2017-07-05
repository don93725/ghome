package com.forum.model;

import java.util.ArrayList;
import java.util.List;

import com.forum.domain.Art_types;
import com.forum.util.BasicDAO;
import com.forum.util.DAOInterface;
import com.forum.util.SQLHelper;

public class Art_typesDAO extends BasicDAO implements DAOInterface<Art_types>{
	//建置查詢

	public List<Art_types> getVOBySQL(String SQL,Object[] param){
	List list = new SQLHelper().executeQuery(SQL, param);
	List<Art_types> tempList = new ArrayList<Art_types>();
	for(int i = 0 ; i < list.size() ; i++){
	Object[] obj =(Object[]) list.get(i);
	Art_types art_types= new Art_types();
	if(obj[0]!=null){
	art_types.setArt_type_no((String)obj[0]);
	}
	if(obj[1]!=null){
	art_types.setForum_no((String)obj[1]);
	}
	if(obj[2]!=null){
	art_types.setArt_type_name((String)obj[2]);
	}
	tempList.add(art_types);
	}
	return tempList;
	}
	//建置查詢單筆

	public Art_types getVOByPK(String art_type_no){
	String SQL ="Select * from art_types where art_type_no=?";
	Object[] param ={art_type_no};
	List<Art_types> list=getVOBySQL(SQL,param);
	Art_types art_types=list.get(0);
	return art_types;
	}
	//建置查詢全部

	public List<Art_types> getAll(){
	String SQL="select * from art_types";
	List<Art_types> list=getVOBySQL(SQL,null);
	return list;
	}
	//算數量

	public int countAll(){
	String SQL = "select * from art_types";
	return countBySQL(SQL);
	}
	//建置修改

	public boolean updateByVO(Art_types art_types){
	String SQL="update art_types set forum_no=?,art_type_name=? where art_type_no=?";
	Object[] param ={art_types.getArt_type_no(),art_types.getForum_no(),art_types.getArt_type_name()};
	boolean updateResult = new SQLHelper().executeUpdate(SQL,param);
	return updateResult;
	}
	//建置新增

	public boolean executeInsert(Art_types art_types){
	String SQL="insert into art_types values(?,?,?)";
	Object[] param ={art_types.getArt_type_no(),art_types.getForum_no(),art_types.getArt_type_name()};
	boolean insertResult = new SQLHelper().executeUpdate(SQL,param);
	return insertResult;
	}
	//建置刪除

	public boolean executeDelete(String art_type_no){
	String SQL="delete from art_types where art_type_no=?";
	Object[] param={art_type_no};
	boolean deleteResult = new SQLHelper().executeUpdate(SQL,param);
	return deleteResult;
	}
	//建置分頁(彈性排序可設條件)

	public List<Art_types> pageAndRank(int page,int pageSize,String order,String where){
	int firstPage=(page-1)*pageSize+1;
	int lastPage = page*pageSize;
	String SQL="select art_type_no,forum_no,art_type_name from (select art_type_no,forum_no,art_type_name, rownum rn from art_types";
	if(where!=null){
	SQL = SQL +" where " + where;
	}
	SQL = SQL+ " order by "+order+") where rn between "+firstPage+" and "+lastPage;
	List<Art_types> list=getVOBySQL(SQL,null);
	return list;
	}
	//建置分頁(彈性排序不設條件)

	public List<Art_types> pageAndRank(int page,int pageSize,String order){
	List<Art_types> list=pageAndRank(page,pageSize,order);
	return list;
	}
	//建置分頁(PK排序)

	public List<Art_types> pageAndRankByPk(int page,int pageSize){
	List<Art_types> list=pageAndRank(page,pageSize,"art_type_no");
	return list;
	}



}
