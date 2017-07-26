package com.album.domain;

public class Photos {
	String photo_no,album_no;
	byte[] photo,sphoto;
	public String getPhoto_no() {
		return photo_no;
	}
	public void setPhoto_no(String photo_no) {
		this.photo_no = photo_no;
	}
	public String getAlbum_no() {
		return album_no;
	}
	public void setAlbum_no(String album_no) {
		this.album_no = album_no;
	}
	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	public byte[] getSphoto() {
		return sphoto;
	}
	public void setSphoto(byte[] sphoto) {
		this.sphoto = sphoto;
	}
	
	
}
