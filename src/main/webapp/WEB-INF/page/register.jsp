<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">


<link rel="stylesheet" href="static/weui1/weui.min.css">
<link rel="stylesheet" href="static/weui1/jquery-weui.css">
<script type="text/javascript" src="static/weui1/jquery-2.1.4.js"></script>
<script type="text/javascript" src="static/weui1/jquery-weui.js"></script>
<script type="text/javascript" src="static/weui1/public.js"></script>
<link rel="stylesheet" href="static/weui1/demos.css">
<link rel="stylesheet" href="static/weui1/css.css">

<style type="text/css">
	.divcss{margin-top:10px}

</style>
<script type="text/javascript">
function submitForm(){
	var username=$("#userName").val();
	 var password=$("#password").val();
	 var repassword=$("#repassword").val();
	 /* var idCard=$("#idCard").val(); */
	 var phone=$("#phone").val();
		var reg1 = /^1\d{10}$/;
	if(username ==""){
		   $.alert("请输入用户名", "警告");
		   return;
	   }
	   if(isSpace(password)){
		   $.alert("请设置密码", " ");
		   return;
		   
	   }
	   if(IsSpace(repassword)){
		   $.alert("请重复密码", " ");
		   return;
		   
	   }
	 if(password != repassword){
		 $.alert("密码与重复密码不一致", " ");
		  return;
	 }
	/*  if(IsSpace(idCard)){
		 $.alert("请输入身份证号码", " ");
		  return;
	 } */
	 if(IsSpace(phone)){
		 $.alert("请输入手机号码", " ");
		  return; 
	 }
	/*  if(!reg1.test(phone)){
		 $.alert("请输入正确的手机号码", " ");
		  return;
	 } */
	 
	/*  if(checkIdcard(idCard)=="验证不通过！"){
		 $.alert("请输入有效的身份证号码", " ");
		  return;
	 } */
		  $.ajax({
	  		url:"user/register",
	  		type:"post",
	  		async:false,
	  		data:{"name":username,"password":password,"phone":phone},
	  		dataType:"json",
	  		success:function(data){
	  			if(data !=null && data=='1'){
	  				$.alert(username+"该用户名已被注册");
	  				return;
	  				
	  		}
	  			if(data=='0'){
	  				$.alert("注册成功!");
	  				location.href="login";
	  			}
	  			if(data=='2'){
	  				
	  			}
	  	}
		});  
	/* location.href="login"; */
}
</script>
<title>用户注册</title>
</head>


<body >

	      
	    <div class="content" id="checkUserDiv">
			<div class="zc-span">用户名：</div>
			<div class="zc-input">
				<input type="text" style="color:black;" placeholder="请输入用户名" name="userName" id="userName"/>
			</div>
			<div class="zc-span">密     码：</div>
			<div class="zc-input">
				<input  style="color:black;" type="password" placeholder="请输入登录密码" name="password" id="password"/>
			</div>
			<div class="zc-span">重复密码：</div>
			<div class="zc-input">
				<input  style="color:black;" type="password" placeholder="请重复输入密码" name="repassword" id="repassword"/>
			</div>
			<div class="zc-span">手机号码：</div>
			<div class="zc-input">
				<input type="text" style="color:black;" placeholder="请输入手机号码" name="phone" id="phone"/>
			</div>
			

	      
	     	
	    </div>
	    <div style="clear:both"></div>
	     <div style="clear:both"></div>
	 	
	 	<div class="divcss"></div>
	 
	     <div class="demos-content-padded">
	      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
	      		<span style="color:#ffffff;">注册</span>
	      </a>
	    </div>
	    
    
</body>
</html>