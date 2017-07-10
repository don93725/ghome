$(function() {
	$('#pic').change(function(event) {
		
		var myarea = document.getElementById("ctx");
		var file = document.querySelector('input[type=file]').files[0];
		var reader = new FileReader();
		var img = new Image();
		reader.addEventListener("load", function() {
			img.src = reader.result;
			img.height =100;
			myarea.innerHTML = 'xxx';
			myarea.appendChild(img);
		}, false);

		if (file) {
			reader.readAsDataURL(file);
		}

		});
}
function getContent(){
	document.getElementById("art_cmt_ctx").value = document.getElementById("ctx").innerHTML;
}