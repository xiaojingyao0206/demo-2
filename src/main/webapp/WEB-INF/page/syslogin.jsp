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
<link rel="stylesheet" href="static/weui1/css.css">

<style type="text/css">
.cstyle{
	display: block;
	float: right;
	margin-right: 46px;
	font-size: 15px;
}
.bstyle{
	display: block;
	float: left;
	margin-left: 46px;
	font-size: 15px;
}
.astyle{
	display: block;
	margin:0 auto;;
	text-align:center;
	font-size: 15px;
}
.divcss{margin-top:10px} 

</style>
<script type="text/javascript">
function submitForm(){
	var sysname=$("#userName").val();
	var password=$("#passWord").val();
	 $.ajax({
	  		url:"sysAdmin/login",
	  		type:"post",
	  		async:false,
	  		data:{"name":sysname,"password":password},
	  		dataType:"json",
	  		success:function(data){
	  			if(data !=null && data=='1'){
	  				$.alert("用户名与密码不匹配!");
	  				return;
	  			}	
	  			if(data=='0'){
	  				$.alert("登录成功!");
	  				//用户登录type=2,管理员type=1
	  				location.href="sysManage";
	  			}
	  			if(data=='2'){
	  				$.alert("该用户不存在!");
	  			}
	  		}
	  			
	  	
		});  
	
	
	
	/* location.href="userInfo"; */
}
function register(){
	location.href="sysRegister";
}
function resetPassword(){
	location.href="resetPassword";
}
</script>
<title>管理员登录</title>
</head>
<body ontouchstart>
     
	    <div class="content" id="checkUserDiv">
			<div class="zc-span">用户名：</div>
			<div class="zc-input">
				<input style="color:black;" type="text" placeholder="用户名" name="userName" id="userName"/>
			</div>
			<div class="zc-span">密     码：</div>
			<div class="zc-input">
				<input style="color:black;" type="password" placeholder="请输入登录密码" name="password" id="passWord"/>
			</div>
			<!-- <div class="zc-botton" onclick="changeTopIconCss(1);">下一步</div> -->
			

	      
	     	
	    </div>
	    <div style="clear:both"></div>
	    <div style="clear:both"></div>
	 	
	    <div class="divcss"></div>
	    
	    <div class="demos-content-padded">
	      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
	      		<span style="color:#ffffff;">管理员登录</span>
	      </a>
	    </div>
	    
	   <!--  <div class="demos-content-padded-right">
	      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
	      		<span style="color:#ffffff;">管理员登录</span>
	      </a>
	    </div> -->
	    <div style="clear:both"></div>
	    <div style="clear:both"></div>
	    <div class="divcss"></div>
	    <a href="javascript:register();" style="color:#888;" class="bstyle">管理员注册</a>
	    <a href="javascript:resetPassword();" style="color:#888;" class="cstyle">忘记密码</a>
		
	    
	   

</body>
</html>