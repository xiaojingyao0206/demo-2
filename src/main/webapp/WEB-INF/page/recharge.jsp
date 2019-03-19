<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

<script type="text/javascript" src="static/weui1/jquery-2.1.4.js"></script>
<script type="text/javascript" src="static/weui1/jquery-weui.js"></script>
<link rel="stylesheet" href="static/weui1/demos.css">
<link rel="stylesheet" href="static/weui1/weui.min.css">
<link rel="stylesheet" href="static/weui1/jquery-weui.css">
<script type="text/javascript">

</script>
<title>充值</title>
<style type="text/css">         
            .input_text {
                outline: none;
                
               	position: absolute;
   				left: 50%;
    			top: 30%;
    			transform: translate(-50%,-50%);
    			width:80%;
    			height:50px;
    			
             	font-size:2.5em;
                
                border-left-width:0px;
                border-top-width:0px;
                border-right-width:0px;
                border-bottom-color:blue;
                display: block;
                margin: 0 auto;
            }
           .content {
           		
			   	width: 300px;
			    height: 35%;
				line-height: 180px;
			    
			    text-align: center;
			    margin: 0 auto;
			    font-size:1.5em;
			}
			.content1 {
				
   				
			    height: 5%;
			    
			   
			    text-align: center;
			    margin: 0 auto;
			   
			}
        </style>

</head>
<body>

<div class="content">
	<span >充值金额：</span>	
</div>
<div class="content1">
	
</div>
<div >	
	<input name="carType" type="text" class="input_text" id="carType" />
</div>
<div class="demos-content-padded">
		<a href="javascript:submitForm();" class="weui_btn weui_btn_primary">储值</a>
</div> 


 	
</body>
</html>