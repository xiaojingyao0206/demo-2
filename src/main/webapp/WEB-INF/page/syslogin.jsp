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
	  				$.alert("�û��������벻ƥ��!");
	  				return;
	  			}	
	  			if(data=='0'){
	  				$.alert("��¼�ɹ�!");
	  				//�û���¼type=2,����Աtype=1
	  				location.href="sysManage";
	  			}
	  			if(data=='2'){
	  				$.alert("���û�������!");
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
<title>����Ա��¼</title>
</head>
<body ontouchstart>
     
	    <div class="content" id="checkUserDiv">
			<div class="zc-span">�û�����</div>
			<div class="zc-input">
				<input style="color:black;" type="text" placeholder="�û���" name="userName" id="userName"/>
			</div>
			<div class="zc-span">��     �룺</div>
			<div class="zc-input">
				<input style="color:black;" type="password" placeholder="�������¼����" name="password" id="passWord"/>
			</div>
			<!-- <div class="zc-botton" onclick="changeTopIconCss(1);">��һ��</div> -->
			

	      
	     	
	    </div>
	    <div style="clear:both"></div>
	    <div style="clear:both"></div>
	 	
	    <div class="divcss"></div>
	    
	    <div class="demos-content-padded">
	      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
	      		<span style="color:#ffffff;">����Ա��¼</span>
	      </a>
	    </div>
	    
	   <!--  <div class="demos-content-padded-right">
	      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
	      		<span style="color:#ffffff;">����Ա��¼</span>
	      </a>
	    </div> -->
	    <div style="clear:both"></div>
	    <div style="clear:both"></div>
	    <div class="divcss"></div>
	    <a href="javascript:register();" style="color:#888;" class="bstyle">����Աע��</a>
	    <a href="javascript:resetPassword();" style="color:#888;" class="cstyle">��������</a>
		
	    
	   

</body>
</html>