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
		$.alert("��δ��¼���ܰ�,���ȵ�¼","",function(){
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
		   $.alert("����д��������", " ");
		   return;		   
	}
	if(isSpace(bankActivation)){
		   $.alert("����д���п�������", " ");
		   return;		   
	}
	if(isSpace(subBank)){
		   $.alert("����д���п�����֧��", " ");
		   return;		   
	}
	if(isSpace(bankCard)){
		   $.alert("����д���п���", " ");
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
  				$.alert(userId+"�����п��ѱ���");
  				return;
  				
  		}
  			if(data==0){
  				$.alert("�󶨳ɹ�!");
  				window.location.href="cardList";
  			}
  			if(data==2){
  				$.alert("��ʧ��!");
  			}
  	}
	});  
};
//���п�������
function luhnCheck(bankno) {
    var lastNum = bankno.substr(bankno.length - 1, 1); //ȡ�����һλ����luhn���бȽϣ�
    var first15Num = bankno.substr(0, bankno.length - 1); //ǰ15��18λ
    var newArr = new Array();
    for (var i = first15Num.length - 1; i > -1; i--) { //ǰ15��18λ����������
        newArr.push(first15Num.substr(i, 1));
    }
    var arrJiShu = new Array(); //����λ*2�Ļ� <9
    var arrJiShu2 = new Array(); //����λ*2�Ļ� >9
    var arrOuShu = new Array(); //ż��λ����
    for (var j = 0; j < newArr.length; j++) {
        if ((j + 1) % 2 == 1) { //����λ
            if (parseInt(newArr[j]) * 2 < 9) arrJiShu.push(parseInt(newArr[j]) * 2);
            else arrJiShu2.push(parseInt(newArr[j]) * 2);
        } else //ż��λ
        arrOuShu.push(newArr[j]);
    }

    var jishu_child1 = new Array(); //����λ*2 >9 �ķָ�֮��������λ��
    var jishu_child2 = new Array(); //����λ*2 >9 �ķָ�֮�������ʮλ��
    for (var h = 0; h < arrJiShu2.length; h++) {
        jishu_child1.push(parseInt(arrJiShu2[h]) % 10);
        jishu_child2.push(parseInt(arrJiShu2[h]) / 10);
    }

    var sumJiShu = 0; //����λ*2 < 9 ������֮��
    var sumOuShu = 0; //ż��λ����֮��
    var sumJiShuChild1 = 0; //����λ*2 >9 �ķָ�֮��������λ��֮��
    var sumJiShuChild2 = 0; //����λ*2 >9 �ķָ�֮�������ʮλ��֮��
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
    //�����ܺ�
    sumTotal = parseInt(sumJiShu) + parseInt(sumOuShu) + parseInt(sumJiShuChild1) + parseInt(sumJiShuChild2);

    //����luhnֵ
    var k = parseInt(sumTotal) % 10 == 0 ? 10 : parseInt(sumTotal) % 10;
    var luhn = 10 - k;

    if (lastNum == luhn) {
    	
        return true;
    } else {
    	$.alert("���п�����д����!", " ");
        return false;
    }
}
</script>

<title>�����п�</title>
</head>
<body ontouchstart>
<div class="content" id="checkUserDiv">
		<div class="zc-span">�û�����������</div>
		<div class="zc-input">
			<input type="text" id="bankName" placeholder="�������û���������" style="color:black;" />
		</div>
		<div class="zc-span">���п������У�</div>
		<div class="zc-input">
			<input style="color:black;" id="bankActivation" type="text" placeholder="���������п�������" />
		</div>
		<div class="zc-span">���п�����֧�У�</div>
		<div class="zc-input">
			<input type="text" id="subBank" placeholder="���������п�����֧��" style="color:black;" />
		</div>
		<div class="zc-span">���п��ţ�</div>
		<div class="zc-input">
			<input type="text" id="bankCard" placeholder="���������п���" style="color:black;" />
		</div>
		
		 <div style="clear:both"></div>
</div>

<div style="clear:both"></div>
<div style="clear:both"></div>
<div class="divcss"></div>
<div class="demos-content-padded">
      <a href="javascript:submitForm();" class="weui_btn weui_btn_primary">
          <span style="color:#ffffff;">��</span>
      </a>
</div>
</body>
</html>