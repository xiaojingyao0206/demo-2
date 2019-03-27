<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    <%
        HttpSession s = request.getSession();     
  	%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
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
		$.alert("暂未登录不能绑定,请先登录","",function(){
			window.location.href="login";
			return;
		});
		
	}
});
function submitForm(){
	
	var bankName = document.getElementById("bankName").value;
	var bankActivation=$("#bankActivation").val();
	var subBank=$("#subBank").val();
	var bankCard=$("#bankCard").val();
	if(isSpace(bankName)){
		   $.alert("请填写开户姓名", " ");
		   return;		   
	}
	if(isSpace(bankActivation)){
		   $.alert("请填写银行卡开户行", " ");
		   return;		   
	}
	if(isSpace(subBank)){
		   $.alert("请填写银行卡开户支行", " ");
		   return;		   
	}
	if(isSpace(bankCard)){
		   $.alert("请填写银行卡号", " ");
		   return;		   
	}else{
		if(!luhnCheck(bankCard)){
			return;
		}
	}
	
	$.ajax({
  		url:"bank/binding",
  		type:"post",
  		async:false,
  		data:{"bankName":bankName,
  			  "bankActivation":bankActivation,
  			  "subBank":subBank,
  			  "bankCard":bankCard},
  		dataType:"json",
  		success:function(data){
  			if(data !=null && data==1){
  				$.alert(userId+"该银行卡已被绑定");
  				return;
  				
  		}
  			if(data==0){
  				$.alert("绑定成功!");
  				window.location.href="cardList";
  			}
  			if(data==2){
  				$.alert("绑定失败!");
  			}
  	}
	});  
};
//银行卡号码检测
function luhnCheck(bankno) {
    var lastNum = bankno.substr(bankno.length - 1, 1); //取出最后一位（与luhn进行比较）
    var first15Num = bankno.substr(0, bankno.length - 1); //前15或18位
    var newArr = new Array();
    for (var i = first15Num.length - 1; i > -1; i--) { //前15或18位倒序存进数组
        newArr.push(first15Num.substr(i, 1));
    }
    var arrJiShu = new Array(); //奇数位*2的积 <9
    var arrJiShu2 = new Array(); //奇数位*2的积 >9
    var arrOuShu = new Array(); //偶数位数组
    for (var j = 0; j < newArr.length; j++) {
        if ((j + 1) % 2 == 1) { //奇数位
            if (parseInt(newArr[j]) * 2 < 9) arrJiShu.push(parseInt(newArr[j]) * 2);
            else arrJiShu2.push(parseInt(newArr[j]) * 2);
        } else //偶数位
        arrOuShu.push(newArr[j]);
    }

    var jishu_child1 = new Array(); //奇数位*2 >9 的分割之后的数组个位数
    var jishu_child2 = new Array(); //奇数位*2 >9 的分割之后的数组十位数
    for (var h = 0; h < arrJiShu2.length; h++) {
        jishu_child1.push(parseInt(arrJiShu2[h]) % 10);
        jishu_child2.push(parseInt(arrJiShu2[h]) / 10);
    }

    var sumJiShu = 0; //奇数位*2 < 9 的数组之和
    var sumOuShu = 0; //偶数位数组之和
    var sumJiShuChild1 = 0; //奇数位*2 >9 的分割之后的数组个位数之和
    var sumJiShuChild2 = 0; //奇数位*2 >9 的分割之后的数组十位数之和
    var sumTotal = 0;
    for (var m = 0; m < arrJiShu.length; m++) {
        sumJiShu = sumJiShu + parseInt(arrJiShu[m]);
    }

    for (var n = 0; n < arrOuShu.length; n++) {
        sumOuShu = sumOuShu + parseInt(arrOuShu[n]);
    }

    for (var p = 0; p < jishu_child1.length; p++) {
        sumJiShuChild1 = sumJiShuChild1 + parseInt(jishu_child1[p]);
        sumJiShuChild2 = sumJiShuChild2 + parseInt(jishu_child2[p]);
    }
    //计算总和
    sumTotal = parseInt(sumJiShu) + parseInt(sumOuShu) + parseInt(sumJiShuChild1) + parseInt(sumJiShuChild2);

    //计算luhn值
    var k = parseInt(sumTotal) % 10 == 0 ? 10 : parseInt(sumTotal) % 10;
    var luhn = 10 - k;

    if (lastNum == luhn) {
    	
        return true;
    } else {
    	$.alert("银行卡号填写有误!", " ");
        return false;
    }
}
</script>

<title>绑定银行卡</title>
</head>
<body ontouchstart>
<div class="content" id="checkUserDiv">
		<div class="zc-span">用户开户姓名：</div>
		<div class="zc-input">
			<input type="text" id="bankName" placeholder="请输入用户开户姓名" style="color:black;" />
		</div>
		<div class="zc-span">银行卡开户行：</div>
		<div class="zc-input">
			<input style="color:black;" id="bankActivation" type="text" placeholder="请输入银行卡开户行" />
		</div>
		<div class="zc-span">银行卡开户支行：</div>
		<div class="zc-input">
			<input type="text" id="subBank" placeholder="请输入银行卡开户支行" style="color:black;" />
		</div>
		<div class="zc-span">银行卡号：</div>
		<div class="zc-input">
			<input type="text" id="bankCard" placeholder="请输入银行卡号" style="color:black;" />
		</div>
		
		 <div style="clear:both"></div>
</div>

<div style="clear:both"></div>
<div style="clear:both"></div>
<div class="divcss"></div>
<div class="demos-content-padded">
      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
          <span style="color:#ffffff;">绑定</span>
      </a>
</div>
</body>
</html>