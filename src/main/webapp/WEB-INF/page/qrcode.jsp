<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

<script type="text/javascript" src="static/qrcode/jquery.min.js"></script>
<script type="text/javascript" src="static/qrcode/qrcode.js"></script>


<title>扫描注册</title>
<style type="text/css">
.box {
  	    
    margin: 0 auto;
    line-height: 80px;
    text-align: center;
    position: absolute;
    left: 50%;
    top: 30%;
    transform: translate(-50%,-50%);
    font-size:3em;
}
</style>
</head>

<body >
	
<div id="qrcode" class="box" ></div>
	
<script type="text/javascript">
var qrcode = new QRCode(document.getElementById("qrcode"), {
	
}); 
function makeCode () {		
	var elText = "http://172.16.17.125:8181/userRegister?sysId=1";
	
	if (!elText) {
		alert("Input a text");
		return;
	}
	
	qrcode.makeCode(elText);
}
makeCode();

</script>
</body>
</html>