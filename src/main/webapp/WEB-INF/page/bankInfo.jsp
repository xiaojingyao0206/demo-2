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
$(function(){
	if( userId==""||userId==null){
		$.alert("��δ��¼,���ȵ�¼","",function(){
			window.location.href="login";
			return;
		});
		
	}
});
function submitForm(){
	var bankCard=$("#bankCard").text();
	if(bankCard=="" || bankCard==null){
		$.alert("��δ�����п���")
		return;
	}else{ 
		$.ajax({
	  		url:"bank/unbound",
	  		type:"post",
	  		async:false,
	  		data:{"bankCard":bankCard},
	  		dataType:"json",
	  		success:function(data){
	  			if(data=="0"){
	  				$.alert("���ɹ�!","",function(){
	  					window.location.href=document.referrer;
		  				return;
	  				});
	  				  				
	  			}else{
	  				$.alert("���ʧ��!");
	  			}
	  		}
		});  
	}
}
</script>

<title>���п���Ϣ</title>
</head>
<body>

      <div id="baseinfocontent">
      	<div class="weui_cells weui_cells_access">
		      <div class="weui_cell">
		        <div class="weui_cell_hd"><label class="weui_label">��������</label></div>
		        <div class="weui_cell_bd weui_cell_primary">
		        	<%-- <div class="weui-cell__bd">
	     			 <input class="weui-input"  value = "${bankInfo.bankName}" id="destination">
	  				</div> --%>
		         	<div class="weui_input"  style="text-align: right;">${bankInfo.bankName}</div>
		        </div>
			</div>
			<div class="weui_cell">
		        <div class="weui_cell_hd"><label class="weui_label">���п�������</label></div>
		        <div class="weui_cell_bd weui_cell_primary">
		        	<!-- <div class="weui-cell__bd">
	     			 <input class="weui-input"  placeholder="����������ص�" id="destination">
	  				</div> -->
		         	<div class="weui_input" style="text-align: right;">${bankInfo.bankActivation}</div>
		        </div>
			</div>
			<div class="weui_cell">
		        <div class="weui_cell_hd"><label class="weui_label">���п�����֧��</label></div>
		        <div class="weui_cell_bd weui_cell_primary">
		        	<!-- <div class="weui-cell__bd">
	     			 <input class="weui-input"  placeholder="����������ص�" id="destination">
	  				</div> -->
		         	<div class="weui_input" style="text-align: right;">${bankInfo.subBank}</div>
		        </div>
			</div>
			<div class="weui_cell">
		        <div class="weui_cell_hd"><label class="weui_label">���п���</label></div>
		        <div class="weui_cell_bd weui_cell_primary">
		        	<!-- <div class="weui-cell__bd">
	     			 <input class="weui-input"  placeholder="����������ص�" id="destination">
	  				</div> -->
		         	<div class="weui_input" id="bankCard" style="text-align: right;">${bankInfo.bankCard}</div>
		        </div>
			</div>
		</div>
	</div>

<div style="clear:both"></div>
<div style="clear:both"></div>
<div class="divcss"></div>
<div class="demos-content-padded">
      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
          <span style="color:#ffffff;">���</span>
      </a>
</div>

</body>
</html>