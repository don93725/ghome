<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<a href="#" target="_blank">
	<div class="panel panel-default">
		<div class="panel-heading text-left">
			<div class="row">
				<div class="col-xs-12 col-sm-1">

					<img
						src="${pageContext.request.contextPath}/util/OutputPic?mem_no=${message_board.mem_no.mem_no }&mem_rank=${message_board.mem_no.mem_rank }"
						class="img-circle cmt_mem_pic"
						title='${message_board.mem_no.mem_nickname }'>

				</div>
				<div class="col-xs-12 col-sm-11">
					<div class="col-xs-12 col-sm-12 cmtInfo">
						${message_board.mem_no.mem_nickname }</div>
					<div class="col-xs-12 col-sm-12 cmtInfo cmtTime">
						時間
						<fmt:setLocale value="en_US" />
						<fmt:formatDate value="${message_board.bd_msg_time}"
							pattern="yyyy-MM-dd HH:mm" />

					</div>

				</div>
			</div>
		</div>
		<div class="panel-body shareContent">
			<div class="col-xs-12 col-sm-12 text-left"
				style="margin-bottom: 10px;">內容?</div>
			<div class="col-xs-12 col-sm-4">
				<img
					src="https://api.fnkr.net/testimg/350x200/00CED1/FFF/?text=img+placeholder">
			</div>
			<div class="col-xs-12 col-sm-4">
				<img
					src="https://api.fnkr.net/testimg/350x200/00CED1/FFF/?text=img+placeholder">
			</div>
			<div class="col-xs-12 col-sm-4">
				<img
					src="https://api.fnkr.net/testimg/350x200/00CED1/FFF/?text=img+placeholder">
			</div>

		</div>
	</div>
</a>

      
      <a href="#" target="_blank">
        <div class="panel panel-default">
		  <div class="panel-heading text-left">
		 		<div class="row">
									<div class="col-xs-12 col-sm-1">

										<img id="sharePic" src="/BA102G4/util/OutputPic?mem_no=1&amp;mem_rank=1" class="img-circle cmt_mem_pic">

									</div>
									<div class="col-xs-12 col-sm-11">
										<div class="col-xs-12 col-sm-12 cmtInfo" id="shareNickname">小花 發佈的相片</div>
										<div class="col-xs-12 col-sm-12 cmtInfo cmtTime" id="shareTime">2017-08-08 02:00</div>

									</div>
									</div>
		  </div>
		  <div class="panel-body shareContent">
		  		
		    	<div class="col-xs-12 col-sm-12 text-left">
		    		<img id="shareIMG" src="/BA102G4/util/OutputPic?photo_no=17">
		    	</div>
		    	
		  
		  </div>
		</div>
      </a>
      