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
   <div class="zc-span">�û�����</div>
	<div class="zc-input">
			<input type="text" placeholder="������ע����û���" style="color:black;" />
	</div>
	<div class="zc-span">��     �룺</div>
	<div class="zc-input">
		<input  style="color:black;" type="password" placeholder="������������" name="password" id="passWord"/>
	</div>
	<div class="zc-span">�ظ����룺</div>
	<div class="zc-input">
		<input  style="color:black;" type="password" placeholder="���ظ�����������" name="repassword" id="repassword"/>
	</div>
		
	<div class="zc-span">��֤�룺</div>
	<div class="zc-input1">
		<input style="color:black;" type="text" placeholder="��������֤��" />		
	</div>
	<input class="yzm" type="button" id="btn" value="��ȡ��֤��" />
	
	<br><br>
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
<script type="text/javascript">
�0�2 �0�2$(document).ready(function(){
    var ordertime=60   //�����ٴη�����֤��ȴ�ʱ��
    var timeleft=ordertime
    var btn=$(".yzm")
   /*  var phone=$(".phone")
    var reg = /^1[0-9]{10}$/; */  //�绰���������ƥ��ʽ

   /*  phone.keyup(function(){
      if (reg.test(phone.val())){
        btn.removeAttr("disabled")  //��������Ϲ��������֤�밴ť�ɵ��
        }
      else{
        btn.attr("disabled",true)
      }
    }) */

    //��ʱ����
    function timeCount(){
       timeleft-=1
       if (timeleft>0){
       btn.val(timeleft+" ����ط�");
       setTimeout(timeCount,1000)
       }
       else {
        btn.val("���·���");
        timeleft=ordertime   //���õȴ�ʱ��
        btn.removeAttr("disabled");
       }
     }

    //�¼�������
    btn.on("click",function(){
        $(this).attr("disabled",true); //��ֹ��ε��
        //�˴������ ajax���� ���̨���� ��ȡ��֤������
        timeCount(this);
        })

      })
</script>
</html>