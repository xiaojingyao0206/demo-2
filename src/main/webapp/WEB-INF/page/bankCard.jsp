<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
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
function submitForm(){
	location.href="binding";
}
</script>
<title>银行卡</title>
</head>
<body>
<div class="weui_panel weui_panel_access">
      <div class="weui_panel_bd" id="data_list">
		<c:forEach items="${list}" var="card" varStatus="vs"> 
			 <div class="weui_media_box" onclick="">
				            <h1 class="weui_media_title" >
				            		${card.bankName}
				            </h1>
				            <p class="weui_media_desc"> 
				         	  		${card.bankCard}
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