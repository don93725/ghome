<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<script type="Text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<script src="/Forum/forum/js/jquery.colorbox.js	" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/Forum/forum/css/colorbox.css">
</head>
<body>
<select name='rpt_type'>
<option value="XXX">XXX</option>
<option value="XXX">XXX</option>
<option value="XXX">XXX</option>
<option value="XXX">XXX</option>
</select>
<input type="text" name='rpt_ctx'>
<button id='btn'>���ڰ�</button>
<script type="text/javascript">
$(function(){
	 $('button').click(function(){
	  $.colorbox({
	   html : '<h1>	Hello lightbox!!!</h1>', //�b�O�c���n��ܪ�html�r�q
	   width : 700, //�O�c�����϶����e��
	   height : 600, //�O�c�����϶�������
	   onClosed : function(){ //��O�c�����ɪ�callback funtion
	    alert('Lightbox is closed');
	   }
	  });
	 });
	})
</script>
</body>
</html>