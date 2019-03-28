<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%
        HttpSession s = request.getSession();     
  	%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

<script type="text/javascript" src="static/weui1/jquery-2.1.4.js"></script>
<script type="text/javascript" src="static/weui1/jquery-weui.js"></script>
<link rel="stylesheet" href="static/weui1/demos.css">
<link rel="stylesheet" href="static/weui1/weui.min.css">
<link rel="stylesheet" href="static/weui1/jquery-weui.css">

<style type="text/css">
	.divcss{margin-top:10px}

</style>
<script type="text/javascript">
var type = ${type};
var userId = <%=s.getAttribute("userId")%>;
$(function(){
	if( userId==""||userId==null){
		$.alert("暂未登录,请先登录","",function(){
			window.location.href="login";
			return;
		});
		
	}
});
function submitForm(){
	
	location.href="binding";
};
function queryData(bankCard){
	
	if(type == "1"){
		location.href="bankInfo?bankCard="+bankCard;
	}else{
		$.ajax({
			url:"bank/getBankInfo?bankCard="+bankCard,
			type:"GET",
			async:false,
			dataType:"json",
			success:function(data){
				if(data!=null){
					$.toast("选择成功");					
					localStorage.setItem("bankInfo",JSON.stringify(data));
					window.location.href="withdraw";
				}else{
					
					return;
				}
			}
		});
	}
	
}
</script>
<title>银行卡</title>
</head>
<body>
<div class="weui_panel weui_panel_access">
      <div class="weui_panel_bd" id="data_list">
		<c:forEach items="${list}" var="card" varStatus="vs"> 
			 <div class="weui_media_box" onclick="queryData('${card.bankCard}')">
				            <h1 class="weui_media_title" >
				            		${card.bankActivation}
				            </h1>
				            <p class="weui_media_desc1"> 	
				            		${card.bankCard.substring(0,4)}*******${card.bankCard.substring(card.bankCard.length()-4)}	         	  		
				         	  		
				            </p>
			</div>
			
		</c:forEach>
		</div>
</div>
<div class="divcss"></div>
<div class="demos-content-padded">
	      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
	      		<span style="color:#ffffff;">新增银行卡</span>
	      </a>
</div>

			    
</body>
</html>