<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
        HttpSession s = request.getSession();     
  %> 
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">


<link rel="stylesheet" href="static/weui/lib/weui.min.css">
<link rel="stylesheet" href="static/weui/css/jquery-weui.css">
<script type="text/javascript" src="static/weui/lib/jquery-2.1.4.js"></script>
<script type="text/javascript" src="static/weui/lib/fastclick.js"></script>
<script type="text/javascript" src="static/weui/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="static/weui/js/public.js"></script>
<link
	href="static/front/css.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="static/front/style.css">
<script type="text/javascript">

var sysName = <%=s.getAttribute("sysName")%>;

$(function(){
	
	 if(sysName==""||sysName==null){
		 loginChange(false);
		
		$("#out").hide();
		$("#zhuce").show();
		 $("#login").show();
	 }else{
		 $("#out").show();
		 $("#zhuce").hide();
		 $("#login").hide();
		 loginChange(true);
	 }
	 
});
function loginChange(loginFlag){
	if(loginFlag){
		$(".avatar-text-box").text(sysName);
		$(".avatar-text-box-hint").text("已登录");
		
		
		$(".avatar-box").off("click");
	}else{
		$(".avatar-box").off("click");
		$(".avatar-text-box").text("未登录");
		$(".avatar-text-box-hint").text("亲，您还未登录");
		$(".avatar-box").click(doLogin); 
	}
}
function queryData(){
	window.location.href="balance";
}
function recharge(){
	window.location.href="recharge";
}
function withdraw(){
	window.location.href="withdraw";
}

function qrcode(){
	if( sysName==""||sysName==null){
		$.alert("暂未登录");
		return;
	}
	window.location.href="qrcode";
}

function doLogin(){
	
	location.href="syslogin";
}
function loginOut(){
	
	if( sysName==""||sysName==null){
		$.alert("暂未登录");
		return;
	}
	$.confirm("您确定退出登录并解绑吗?", "确认注销", function() {
		$.ajax({
			url:"sysAdmin/loginOut",
			type:"post",
			async:false,
			dataType:"json",
			success:function(data){
				if(data=='0'){
					$.toast("注销成功");					
					sysName = "";
					loginChange(false);
				}else{
					$.toast("注销失败");
					return;
				}
			}
		});
      }, function() {
        return;
      });
}
</script>
<title>系统管理员</title>
<style type="text/css">
	body{background:#f0eff4;}
	.weui-grid{padding-top:10px;padding-bottom:10px;}
	.weui-grid .weui-grid__label{font-size:17px;}
	.icon-box-daibanshiyi{background: #13c7ef;}
	.icon-box-gaojing{background: #f56262;}
	.icon-box-xuexi{background: #3b9ac6;}
	.icon-box-mystatic{background: #67daef;}
	.icon-box-myappoint{background: #6ad651;}
	.icon-box-intime_reply,.icon-box-common_reply,.icon-box-advise_reply{background: #77bdf5;}
	.wx-top-banner-box{
		background-image:url(static/images/blue.png);background-position: center center;
		background-size: cover;
	}
	.wx-nav-icon-box{font-size:19px;}
	.wx-top-banner-box .placeholder{
	padding-top:1em;padding-bottom:0.5em;
	display:table;width:100%;min-height:8em;text-align: center;
	}
	.avatar-box{
		display:inline-box;
		background-image:url(static/images/wx-me-def-avatar.png);background-position: center center;
		background-size: contain;background-repeat: no-repeat;
	}
	.avatar-text-box{color:white;font-size:1em;}
	.avatar-text-box-hint{color:#e4e4e4;font-size:0.8em;}
</style>
</head>
<body ontouchstart>
<div class="weui-flex">
      <div class="weui-flex__item wx-top-banner-box"><div class="placeholder" style="">
      	<div class="avatar-box" style="height:6em;"  >
      		<h1>&nbsp;</h1>
      	</div>
      	<p class="avatar-text-box">未登录</p>
      	<p class="avatar-text-box-hint">亲，您还未登录</p>
      </div></div>
</div>
<div class="">
    	<a class="weui-cell weui-cell_access" href="javaScript:;" onclick="recharge();">
          <div class="weui-cell__bd weui-cell_primary">
           <p>我的用户</p>
          </div>
          <div class="weui-cell__ft"></div>
        </a>
   
        <a class="weui-cell weui-cell_access" href="javaScript:;" onclick="queryData();">
          <div class="weui-cell__bd weui-cell_primary">
           <p>我的用户充值记录</p>
          </div>
          <div class="weui-cell__ft"></div>
        </a>
        
        <a class="weui-cell weui-cell_access" href="javaScript:;" onclick="qrcode();">
          <div class="weui-cell__bd weui-cell_primary">
           <p>我的二维码</p>
          </div>
          <div class="weui-cell__ft"></div>
        </a>
        
        <a class="weui-cell weui-cell_access" id="logOutCell" href="javaScript:;" onclick="loginOut();">
          <div class="weui-cell__hd wx-cell__hd icon-box-common_reply"><i class="icon iconfont icon-zixun"></i></div>
          <div class="weui-cell__bd weui-cell_primary">
           <p>注销登录</p>
          </div>
          <div class="weui-cell__ft"></div>
        </a>
</div>
	
</body>
</html>