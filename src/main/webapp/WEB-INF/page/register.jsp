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
		   $.alert("�������û���", "����");
		   return;
	   }
	   if(isSpace(password)){
		   $.alert("����������", " ");
		   return;
		   
	   }
	   if(IsSpace(repassword)){
		   $.alert("���ظ�����", " ");
		   return;
		   
	   }
	 if(password != repassword){
		 $.alert("�������ظ����벻һ��", " ");
		  return;
	 }
	/*  if(IsSpace(idCard)){
		 $.alert("���������֤����", " ");
		  return;
	 } */
	 if(IsSpace(phone)){
		 $.alert("�������ֻ�����", " ");
		  return; 
	 }
	/*  if(!reg1.test(phone)){
		 $.alert("��������ȷ���ֻ�����", " ");
		  return;
	 } */
	 
	/*  if(checkIdcard(idCard)=="��֤��ͨ����"){
		 $.alert("��������Ч�����֤����", " ");
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
	  				$.alert(username+"���û����ѱ�ע��");
	  				return;
	  				
	  		}
	  			if(data=='0'){
	  				$.alert("ע��ɹ�!");
	  				location.href="login";
	  			}
	  			if(data=='2'){
	  				
	  			}
	  	}
		});  
	/* location.href="login"; */
}
</script>
<title>�û�ע��</title>
</head>


<body >

	      
	    <div class="content" id="checkUserDiv">
			<div class="zc-span">�û�����</div>
			<div class="zc-input">
				<input type="text" style="color:black;" placeholder="�������û���" name="userName" id="userName"/>
			</div>
			<div class="zc-span">��     �룺</div>
			<div class="zc-input">
				<input  style="color:black;" type="password" placeholder="�������¼����" name="password" id="password"/>
			</div>
			<div class="zc-span">�ظ����룺</div>
			<div class="zc-input">
				<input  style="color:black;" type="password" placeholder="���ظ���������" name="repassword" id="repassword"/>
			</div>
			<div class="zc-span">�ֻ����룺</div>
			<div class="zc-input">
				<input type="text" style="color:black;" placeholder="�������ֻ�����" name="phone" id="phone"/>
			</div>
			

	      
	     	
	    </div>
	    <div style="clear:both"></div>
	     <div style="clear:both"></div>
	 	
	 	<div class="divcss"></div>
	 
	     <div class="demos-content-padded">
	      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
	      		<span style="color:#ffffff;">ע��</span>
	      </a>
	    </div>
	    
    
</body>
</html>