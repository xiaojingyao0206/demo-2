<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    <%
        HttpSession s = request.getSession();     
  	%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
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
	.divcss{margin-top:10px}

</style>

<script type="text/javascript">
var userId = <%=s.getAttribute("userId")%>;

function submitForm(){
	if( userId==""||userId==null){
		$.alert("暂未登录");
		
	}
	var bankName = document.getElementById("bankName").value;
	var bankActivation=$("#bankActivation").val();
	var subBank=$("#subBank").val();
	var bankCard=$("#bankCard").val();
	if(isSpace(bankName)){
		   $.alert("请填写开户姓名", " ");
		   return;		   
	}
	if(isSpace(bankActivation)){
		   $.alert("请填写银行卡开户行", " ");
		   return;		   
	}
	if(isSpace(subBank)){
		   $.alert("请填写银行卡开户支行", " ");
		   return;		   
	}
	if(isSpace(bankCard)){
		   $.alert("请填写银行卡号", " ");
		   return;		   
	}
	
	$.ajax({
  		url:"bank/binding",
  		type:"post",
  		async:false,
  		data:{"bankName":bankName,
  			  "bankActivation":bankActivation,
  			  "subBank":subBank,
  			  "bankCard":bankCard},
  		dataType:"json",
  		success:function(data){
  			if(data !=null && data==1){
  				$.alert(username+"该银行卡已被绑定");
  				return;
  				
  		}
  			if(data==0){
  				$.alert("注册成功!");
  				
  			}
  			if(data==2){
  				
  			}
  	}
	});  
}
</script>

<title>绑定银行卡</title>
</head>
<body ontouchstart>
<div class="content" id="checkUserDiv">
		<div class="zc-span">用户开户姓名：</div>
		<div class="zc-input">
			<input type="text" id="bankName" placeholder="请输入用户开户姓名" style="color:black;" />
		</div>
		<div class="zc-span">银行卡开户行：</div>
		<div class="zc-input">
			<input style="color:black;" id="bankActivation" type="text" placeholder="请输入银行卡开户行" />
		</div>
		<div class="zc-span">银行卡开户支行：</div>
		<div class="zc-input">
			<input type="text" id="subBank" placeholder="请输入银行卡开户支行" style="color:black;" />
		</div>
		<div class="zc-span">银行卡号：</div>
		<div class="zc-input">
			<input type="text" id="bankCard" placeholder="请输入银行卡号" style="color:black;" />
		</div>
		
		 <div style="clear:both"></div>
</div>

<div style="clear:both"></div>
<div style="clear:both"></div>
<div class="divcss"></div>
<div class="demos-content-padded">
      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
          <span style="color:#ffffff;">绑定</span>
      </a>
</div>
</body>
</html>