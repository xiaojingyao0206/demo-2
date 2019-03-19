<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

<link rel="stylesheet" href="static/weui1/weui.min.css">
<link rel="stylesheet" href="static/weui1/jquery-weui.css">
<script type="text/javascript" src="static/weui1/jquery-2.1.4.js"></script>
<script type="text/javascript" src="static/weui1/jquery-weui.js"></script>
<script type="text/javascript" src="static/weui1/public.js"></script>
<link rel="stylesheet" href="static/weui1/demos.css">

<script type="text/javascript">
function recharge(){
	window.location.href="recharge";
}
function withdraw(){
	window.location.href="withdraw";
}
</script>
<title>我的余额</title>
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
.content {
   	width: 300px;
    height: 45%;
    
    line-height: 150px;
    text-align: center;
    margin: 0 auto;
    font-size:1em;
}

	
</style>
</head>
<body >


<div class="content">
	<span style="color:#047de6;">我的余额</span>	
</div>
 <div class="box">
 		10000.00         
 </div>
 
	<div class="demos-content-padded">
		<a href="javascript:recharge();" class="weui_btn weui_btn_primary">充值</a>
	</div> 
	<!-- <div class="demos-second-title"> -->
	<div class="demos-content-padded">
		<a href="javascript:withdraw();" class="weui_btn weui_btn_primary1">
		<span style="color:#047de6;">提现</span>
		</a>
	</div> 	


      
</body>
</html>