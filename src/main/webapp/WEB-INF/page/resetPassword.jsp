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
	.divcss{margin-top:10px}

</style>

<title>��������</title>
</head>
<body>
<div class="content" id="checkUserDiv">
		<div class="zc-span">�û�����</div>
		<div class="zc-input">
			<input type="text" placeholder="������ע����û���" style="color:black;" />
		</div>
		<div class="zc-span">�ֻ����룺</div>
		<div class="zc-input">
			<input style="color:black;" type="text" placeholder="������ע���õ��ֻ���" />
		</div>
		<div class="zc-span">��     �룺</div>
			<div class="zc-input">
				<input  style="color:black;" type="password" placeholder="������������" name="password" id="passWord"/>
			</div>
		<div class="zc-span">�ظ����룺</div>
			<div class="zc-input">
				<input  style="color:black;" type="password" placeholder="���ظ�����������" name="repassword" id="repassword"/>
		</div>
		
		 <div style="clear:both"></div>
</div>

<div style="clear:both"></div>
<div style="clear:both"></div>
<div class="divcss"></div>
<div class="demos-content-padded">
      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
          <span style="color:#ffffff;">����</span>
      </a>
</div>

</body>
</html>