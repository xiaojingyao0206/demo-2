<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
        HttpSession s = request.getSession();     
  %>
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
	.divcss{margin-top:10px}

</style>

<script type="text/javascript">
var userId = <%=s.getAttribute("userId")%>;
var bankInfo = JSON.parse(localStorage.getItem("bankInfo"));
$(function(){
	if( userId==""||userId==null){
		$.alert("暂未登录,请先登录","",function(){
			window.location.href="login";
			return;
		});
		
	}
	
	if(bankInfo == null || bankInfo==""){
		selectChange(false);
	}else{
		selectChange(true);
	}
});
function selectChange(isSelect){
	if(isSelect){
		document.getElementById("isfalse").style.display="none";//隐藏
		document.getElementById("istrue").style.display="";//显示
		$("#bankName").html(bankInfo.bankActivation);
		$("#cardId").html(bankInfo.bankCard.substr(0,4)+"********"+bankInfo.bankCard.substr(-4));
			 
	}else{
		document.getElementById("istrue").style.display="none";//隐藏
		document.getElementById("isfalse").style.display="";//显示
		
	}
}
function selectCard(){
	window.location.href="cardList?type=2"
}
function submitForm(){
	 localStorage.clear();
}
</script>
<title>提现</title>

</head>
<body >

<div id="baseinfocontent">
      	<div class="weui_cells weui_cells_access">
      		  
		    <div class="weui_cell" id="isfalse" onclick="selectCard()">
		        <div class="weui_cell_hd">
		        	<label class="weui_label">开户姓名</label>
		        </div>
		        <div class="weui_cell_bd weui_cell_primary" >
		        	
		         	<div class="weui_input" style="text-align: right;">></div>
		        </div>
			</div>
			<div class="weui_cell" id="istrue" onclick="selectCard()">		
			 <div class="weui_media_box" onclick="queryData('${card.bankCard}')">
				            <h1 class="weui_media_title" id="bankName" >
				            		
				            </h1>
				            <a></a>
				            <p class="weui_media_desc1" id="cardId"> 	
				            		         	  						         	  		
				            </p>
			</div>
				<div class="weui_input" style="text-align: right;">></div>
			</div>
		</div>
		
</div>
<div style="clear:both"></div>
<div style="clear:both"></div>
<div class="divcss"></div>
<div class="demos-content-padded">
      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
          <span style="color:#ffffff;">提现</span>
      </a>
</div>


</body>
</html>