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
<button id='btn'>按我啊</button>
<script type="text/javascript">
$(function(){
	 $('button').click(function(){
	  $.colorbox({
	   html : '<h1>	Hello lightbox!!!</h1>', //在燈箱中要顯示的html字段
	   width : 700, //燈箱中間區塊的寬度
	   height : 600, //燈箱中間區塊的高度
	   onClosed : function(){ //當燈箱關閉時的callback funtion
	    alert('Lightbox is closed');
	   }
	  });
	 });
	})
</script>
</body>
</html>