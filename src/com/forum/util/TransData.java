package com.forum.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;

import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialClob;
import javax.sql.rowset.serial.SerialException;




public class TransData {
	public static Blob transBlob(Part part) throws IOException{
		Blob blob=null;
		InputStream in = part.getInputStream();
		byte[] b = new byte[in.available()];
		try {
			blob =new SerialBlob(b);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return blob;
	}
	public static Clob transClob(String s) throws SerialException, SQLException{
		Clob clob=new SerialClob(s.toCharArray());
		
			
		return clob;
	}
}
