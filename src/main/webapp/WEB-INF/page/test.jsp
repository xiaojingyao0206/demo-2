<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

<link rel="stylesheet" href="static/weui1/weui.min.css">
<link rel="stylesheet" href="static/weui1/jquery-weui.css">
<script type="text/javascript" src="static/weui1/jquery-2.1.4.js"></script>
<script type="text/javascript" src="static/weui1/jquery-weui.js"></script>
<script type="text/javascript" src="static/weui1/public.js"></script>
<link rel="stylesheet" href="static/weui1/demos.css">
<link rel="stylesheet" href="static/weui1/css.css">
<title>test</title>
<style type="text/css">
.yzm {
    /* cursor: pointer; */
    border: 1px ;
    text-align: center;
    line-height: 26px;
    width: 100px;
    height: 35px;
   	background-color: transparent;
   	color:#047de6 ;
}
</style>

<head>
<body>
 <div class="content" id="checkUserDiv">
   <div class="zc-span">用户名：</div>
	<div class="zc-input">
			<input type="text" placeholder="请输入注册的用户名" style="color:black;" />
	</div>
	<div class="zc-span">密     码：</div>
	<div class="zc-input">
		<input  style="color:black;" type="password" placeholder="请输入新密码" name="password" id="passWord"/>
	</div>
	<div class="zc-span">重复密码：</div>
	<div class="zc-input">
		<input  style="color:black;" type="password" placeholder="请重复输入新密码" name="repassword" id="repassword"/>
	</div>
		
	<div class="zc-span">验证码：</div>
	<div class="zc-input1">
		<input style="color:black;" type="text" placeholder="请输入验证码" />		
	</div>
	<input class="yzm" type="button" id="btn" value="获取验证码" />
	
	<br><br>
</div> 

<div style="clear:both"></div>
<div style="clear:both"></div>
	<div class="divcss"></div>
	
   <div class="demos-content-padded">
      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
          <span style="color:#ffffff;">重置</span>
      </a>
	</div>
   
 

</body>
<script type="text/javascript">
   $(document).ready(function(){
    var ordertime=60   //设置再次发送验证码等待时间
    var timeleft=ordertime
    var btn=$(".yzm")
   /*  var phone=$(".phone")
    var reg = /^1[0-9]{10}$/; */  //电话号码的正则匹配式

   /*  phone.keyup(function(){
      if (reg.test(phone.val())){
        btn.removeAttr("disabled")  //当号码符合规则后发送验证码按钮可点击
        }
      else{
        btn.attr("disabled",true)
      }
    }) */

    //计时函数
    function timeCount(){
       timeleft-=1
       if (timeleft>0){
       btn.val(timeleft+" 秒后重发");
       setTimeout(timeCount,1000)
       }
       else {
        btn.val("重新发送");
        timeleft=ordertime   //重置等待时间
        btn.removeAttr("disabled");
       }
     }

    //事件处理函数
    btn.on("click",function(){
        $(this).attr("disabled",true); //防止多次点击
        //此处可添加 ajax请求 向后台发送 获取验证码请求
        timeCount(this);
        })

      })
</script>
</html>