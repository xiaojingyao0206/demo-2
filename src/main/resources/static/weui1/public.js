
// org递归
// 打开系统管理的五大对象的树 type:'org','user','role','group','job'
// id:接收id的text控件的id
// name:接收name的text控件的id
// isRadio:true or false true 表示前面是单选框，false表示是复选框 ；不传该参数则默认是复选框。
// showmode:static-dynamic,static
// rootId-根节点id, rootName-根节点名称, expandLevel-展开级数
var openTree_orgids = "";
var openTree_userids = "";
function openTree(type, id, name, isRadio, treeshowmode, rootId, rootName, expandLevel) {
	openTree_userids = id.value;
	openTree_names = name.value;
	var orgids = "";
	try {
		eval("orgids=creator_tree_" + id.id);
	} catch (e) {
	};

	var rootId = rootId || "0";
	var rootName = rootName || "组织机构树";
	var expandLevel = expandLevel || "1";
	
	var url = new StringBuffer().append(location.protocol).append("//")
			.append(location.host).append(getContextPath())
			.append("/eformsys/systemManager/");
	if (!IsSpace(type)) {
		if (type == "org") { // 机构树 单选与多选
			if (!IsSpace(isRadio) && isRadio) {
				url.append("org_tree_radio.jsp?rootId="+rootId + "&rootName="+rootName + "&expandLevel="+expandLevel);
			} else {
				url.append("org_tree.jsp?rootId="+rootId + "&rootName="+rootName + "&expandLevel="+expandLevel);
			}
		} else if (type == "user") { // 机构用户树 单选与多选
			if (!IsSpace(isRadio) && isRadio) {
				url.append("orgUserTreeRadio.jsp?userid=").append(id.value)
						.append("&userName=").append(name.value+"&rootId="+rootId + "&rootName="+rootName + "&expandLevel="+expandLevel);
			} else {
				url.append("orgUserTree.jsp?orgid=").append(orgids+"&rootId="+rootId + "&rootName="+rootName + "&expandLevel="+expandLevel);
			}

		} else if (type == "role") { // 角色树 单选与多选
			if (!IsSpace(isRadio) && isRadio) {
				url.append("role_tree_radio.jsp");
			} else {
				url.append("role_tree.jsp");
			}

		} else if (type == "group") { // 组 单选与多选
			if (!IsSpace(isRadio) && isRadio) {
				url.append("groupTreeRadio.jsp");
			} else {
				url.append("groupTree.jsp");
			}

		} else if (type == "job") { // 工作岗位树 单选与多选
			if (!IsSpace(isRadio) && isRadio) {
				url.append("jobTreeRadio.jsp");
			} else {
				url.append("jobTree.jsp");
			}

		} else if (type == "business") { // 业务类别树 只有单选
			url.append("business_type_tree.jsp?busids=").append(id.value);

		} else if (type == "report") { // 报表树 只有单选
			url.append("reportmain.jsp");
		} else {
			url.append("org_tree_radio.jsp");
		}

	}

	var myReturn = "";
	if (type == "report") {
		myReturn = window.showModalDialog(url.toString(), window,
				"dialogWidth:600px");
	} else {
		myReturn = window.showModalDialog(url.toString(), window);
	}
	if (myReturn != "undefined" && myReturn != null) {
		var arr = myReturn.split(";");
		id.value = arr[0];
		name.value = arr[1];
		if (arr.length > 2) {
			eval("creator_tree_" + id.id + "=arr[2]");
		}

	}

}

//自动根据iframe尺寸调节tab尺寸
function autoSetTabSize(isSet,framename){
	if(isSet){
		if(document.frames[framename].document.body.scrollHeight > 180){
			$(framename).style.height = document.frames[framename].document.body.scrollHeight-10;		
		}
	}
	
}
//根据isHidden判断是否隐藏tab
function setTabHidden(isHidden,Tabname){
	if(isHidden){
		document.getElementById(Tabname).style.display="none";	
	}
}

//判断字符串是否为空
function IsSpace(strMain) {
	var strComp = strMain;
	try {
		if (strComp == "  " || strComp == "" || strComp == " "
				|| strComp == null || strComp == "null" || strComp.length == 0
				|| typeof strMain == "undefined" || strMain == "undefined") {
			return true;
		} else {
			return false;
		}
	} catch (e) {
		return false;
	}
}

function isSpace(strMain){
	return IsSpace(strMain);
}

function isOutStrLenth(str,lenth){
	var length = str.replace(/[^\x00-\xff]/g,"**").length;
	if(length>lenth){
		return true;
	}
	return false;
}

function clearhuanghangchar(value){
	
	    var newValue = value.replaceAll("\r\n", "\\r\\n");  
	    return newValue;   
}  


//清空字符串两边的空白
function trim(strMain) {
	if (strMain == null) {
		return "";
	}
	strMain = strMain + "";
	return strMain.replace(/(^\s*)|(\s*$)/g, "");
}

//清空combox
function clearCombo(object){
    var optionIndex = object.options.length;
    for(;optionIndex>=1;optionIndex--){
        object.options.remove(optionIndex);
    }
}

/**
 * 获取名字为objName的radio中被选中的那一项的值
 * @param objName
 * @return
 */
function getRadioGroupValue(objName){
    var radioGroupValue = "";
    var ridList = document.getElementsByName(objName);
    
    for(var i=0; i<ridList.length; i++){
        if(ridList[i].checked){
            radioGroupValue = ridList[i].value;
            break;
        }
    }
    return radioGroupValue; 
}
/**
 * 获取名字为objName的checkbox的值，并用逗号分隔
 * @param objName
 */
function getCheckboxValue(objName){
	 var checkboxValue = "";
	    var objList = document.getElementsByName(objName);
	    for(var i=0; i<objList.length; i++){
	        if(objList[i].checked){
	        	if(checkboxValue==""){
	        		checkboxValue = objList[i].value;
	        	}else{
	        		checkboxValue = checkboxValue + ","+objList[i].value;
	        	}
	        }
	    }
	    return checkboxValue;
}
 
/**
 * 设置单选按钮组的实际值
 * @param objName
 * @return
 */
function setRadioGroupValue(objName, objVal){
  var ridList = document.getElementsByName(objName);
  for(var i=0; i<ridList.length; i++){
      if(ridList[i].value == objVal){
          ridList[i].checked = true;
          break;
      }
  }
}

/**
 * 设置下拉框的初始值
 */

function setSelectValue(objName,objVal){
	var sel = document.getElementById(objName);
	for(var i = 0;i<sel.length;i++){
		if(sel.options[i].value == objVal){
			sel.options[i].selected = true;
			break;
		}
	}
}
/**
 * 对字符串中的某些特定字符进行转义
 * @param str
 * @return
 */
function descape(str){
	  if(/{\'/.test(str)){
		  str = str.replace("{'","chr(41)");
	  }
	  if(/\'}/.test(str)){
		  str = str.substring(0, str.length - 2) + str.substring(str.length -2, str.length).replace("'}","chr(42)");
	  }
	  if(/\}/.test(str)){
		  str = str.replaceAll("}","chr(46)");
	  }
	  if(/\{/.test(str)){
		  str = str.replaceAll("{","chr(47)");
	  }
	  if(/\'\,\'/.test(str)){
		  str = str.replaceAll("','","chr(43)");
	  }
	  if(/\':\'/.test(str)){
		  str = str.replaceAll("':'","chr(44)");
	  }
	  if(/\#/.test(str)){
		 str = str.replaceAll("#","chr(50)");
	  }
	  if(/\'/.test(str)){
		str = str.replaceAll("'","chr(39)")
	  }
	  if(/\"/.test(str)){
			str = str.replaceAll('"',"chr(45)")
		  }
	  if(/\&/.test(str)){
		str = str.replaceAll("&","chr(38)")
	  }
	  if(/\</.test(str)){
		str = str.replaceAll("<","chr(60)")
	  }
	  if(/\>/.test(str)){
		str = str.replaceAll(">","chr(62)")
	  }
	  if(/\%/.test(str)){
		 str = str.replaceAll("%","chr(37)")
	  }

	  if(/\r\n/.test(str)){
		  str = str.replaceAll("\r\n","chr(64)")
	  } 
	  while(/\\/.test(str)){
		  str = str.replace("\\","chr(40)");
	  }
	  return str;
	}
/**
 * 将转义后的字符转回
 * @param str
 * @return
 */
function undescape(str){
	if(/&quot/.test(str)){
		str = str.replaceAll("&quot;","\"");
	}
	if(/&lt;/.test(str)){
		str = str.replaceAll("&lt;","<");
	}
	if(/&gt;/.test(str)){
		str = str.replaceAll("&gt;",">");
	}
	return str;
}

String.prototype.replaceAll = function (AFindText,ARepText){
  raRegExp = new RegExp(AFindText,"g");
  return this.replace(raRegExp,ARepText);
}

/**
 * 获取当前应用上下文路径
 * @param str
 * @return
 */
function getContextPath() { 
	var contextPath = document.location.pathname; 
	if(contextPath.substr(0,1) != "/"){
		contextPath="/"+contextPath;
	}
	var index =contextPath.substr(1).indexOf("/"); contextPath = contextPath.substr(0,index+1); 
	delete index;
	return contextPath; 
} 


/*展示办件历史的公共方法*/

showFlowHistoryByInsId = function(item_insid){
	var url = getContextPath()+"/kcapp/xzsp/jsp/instance/showflowhistorytiaozhuan.jsp?iteminsid="+item_insid;
	var winwidth=(screen.width - 920)/2;
	var winheight=(screen.height - 700)/2-30;
	var freatrues = "height=700,width=920,top="+winheight+"px,left="+winwidth+"px,status=yes,toolbar=no,menubar=no,location=no";

	window.open(url,"",freatrues ); 
}



/* 控制TAB页的显示或隐藏：以TAB页id为基准 */
function hideOrShowTabById(id, type) {
	  var realStyle = "";
	  if(IsSpace(type) || (type.toUpperCase()=="hide".toUpperCase())) {
		    realStyle = "none";
	  }
	  var objs = document.getElementsByTagName("div");
	  for(var i=0; i<objs.length; i++) {
		    if(trim(objs[i].id) == trim(id+"-tab")) {
			      objs[i].style.display = realStyle;
		    }
	  }
}

//获得url后面的某个参数的值。
function creator_getQueryString(item) {
	var svalue = location.search.match(new RegExp(new StringBuffer()
			.append("[\?\&]").append(item).append("=([^\&]*)(\&?)").toString(),
			"i"));
	return svalue ? svalue[1] : svalue;
}
/**
 * 页面上的字段组装成VO对象
 * @param vo对像
 * @return
 */

function getVoFromPage(vo){ 
	
	for(var name in vo ){
	  var obj = document.getElementById(name.toUpperCase());
	  if(obj){
		  var vo_node= eval("vo."+name);
		  var vo_value = eval(vo.name);
		  if(vo_node!=null ){
	    	 eval("vo."+name+".value = trim(obj.value)") ;
		  }else{
			   eval("vo."+name+" = trim(obj.value)") ; 
		  }
	  }else{
		   var vo_node= eval("vo."+name);
		   if(vo_node!=null){
		       if(eval("vo."+name+".value")){
			   }else{
				   //eval("vo."+name+" = undefined") ;//modifyby yi.yang vo有默认值情况
			   }
		  }else{
			   eval("vo."+name+" = undefined");
		  }
	   }
	}
	return vo;
}


//=====20100223添加,js字符串连接优化封装。
function StringBuffer() {
	this._strs = new Array;
}
StringBuffer.prototype.append = function(str) {
	this._strs.push(str);
	return this;
}
StringBuffer.prototype.toString = function() {
	return this._strs.join("");
}


//===============================20080424添加，通过djid获取jsp文件的路径
function getFormUrlByDjid(myDjid) {
	var formUrl = new StringBuffer().append(location.protocol).append("//")
			.append(location.host).append(getContextPath()).append("/eformsys").append("/")
			.append("jxc/dj/").append(myDjid).append(".")
			.append("jsp");
	return formUrl;
}


//20080612新增，根据表单id获取打开表单的路径。
function getOpenUrlByDjid(myDjid) {
	var openDjUrl = new StringBuffer();
	openDjUrl.append(location.protocol).append("//")
			.append(location.host).append(getContextPath()).append("/eformsys")
			.append("/fceform/common/djframe.htm?djtype=").append("ZW")
			.append("&djsn=");
	var formUrl = openDjUrl + myDjid;
	return formUrl;
}


//控制显示申请者类型
function showApplyCtrl(applyType){
    if(applyType == "1"){
        $('applyCorpArea').style.display = "";
        $('applicantArea').style.display = "none";   
    }else{
    	  $('applyCorpArea').style.display = "none";
          $('applicantArea').style.display = "";        
    }
}

/* 控制目标对象是否显示：如果已显示，则隐藏；否则显示20095-5huajun.zhang */
function showAreaCtrl(destObjId){
    var destObj = document.getElementById(destObjId);
    var srcImg = event.srcElement;
    if(destObj){
        var style = destObj.style;
        if(destObj.style.display == "none"){
            destObj.style.display = "";
            srcImg.src = "../../resources/images/menu_off.gif"
        }else{
            destObj.style.display = "none";
            srcImg.src = "../../resources/images/menu_off.gif"
        }
    }
}
//动态创建INPUT元素，兼容IE和FF浏览器
function createInputElement(type, name){
	  var oInput = null;
    if(document.all){ //IE
    	  var oStr = "<input type='"+type+"' name='"+name+"'>";
    	  oInput = document.createElement(oStr);
    	  
    }else{
    	  oInput = document.createElement("input");
    	  oInput.type = type;
    	  oInput.name = name;
    }
    return oInput;
}

/* 将日期转为长整型 */
function getLongFormat(datStr){
	 if(IsSpace(datStr)){
	 	   return null;
	 }
	 datStr = datStr.replace("-","/");
   datStr = datStr.replace("-","/");
   return Date.parse(datStr);
}
/* 取指定长度的字符串 */
function getContentByLimit(str, iLimit){
	 if(IsSpace(str)){
	 	   return null;
	 }    
	 str = trim(str);
	 if(str.length <= iLimit){
	 	  return str;
	 }else{
	 	  return str.substr(0,iLimit);
	 }
}
/* 将日期的横杠改为年月日 */
function getChnFormat(datStr){
	 if(IsSpace(datStr)){
	 	   return null;
	 }
	 return datStr.substr(0,4) + "年" + datStr.substr(5,2) + "月" + datStr.substr(8,2) + "日";
}

//全选、取消！！注意该方法之所以命名为checkAll是因为pg标签里面有一个checkAll方法
function checkAllItem(checkName,thisobj){
	 var checkObj = document.getElementsByName(checkName);
	 if( checkObj.length > 0){
	 	if(thisobj.innerText == "全选"){//表示全选
	 		for( var i = 0 ; i < checkObj.length ; i ++){
	 			checkObj[i].checked = true;
	 		}
	 		thisobj.innerText = "取消";
	 	}else{//表示反选
	 		for( var i = 0 ; i < checkObj.length ; i ++){
	 			checkObj[i].checked = false;
	 		}
	 		thisobj.innerText = "全选";
	 	}
	 }
}


//验证身份证是否合法
function clsIDCard(CardNo) {
	  this.Valid=false;
	  this.ID15='';
	  this.ID18='';
	  this.Local='';
	  if(CardNo!=null)this.SetCardNo(CardNo);
	}

	// 设置身份证号码，15位或者18位
	clsIDCard.prototype.SetCardNo = function(CardNo) {
	  this.ID15='';
	  this.ID18='';
	  this.Local='';
	  CardNo=CardNo.replace(" ","");
	  var strCardNo;
	  if(CardNo.length==18) {
	    pattern= /^\d{17}(\d|x|X)$/;
	    if (pattern.exec(CardNo)==null)return;
	    strCardNo=CardNo.toUpperCase();
	  } else {
	    pattern= /^\d{15}$/;
	    if (pattern.exec(CardNo)==null)return;
	    strCardNo=CardNo.substr(0,6)+'19'+CardNo.substr(6,9)
	    strCardNo+=this.GetVCode(strCardNo);
	  }
	  this.Valid=this.CheckValid(strCardNo);
	}

	// 校验身份证有效性
	clsIDCard.prototype.IsValid = function() {
	  return this.Valid;
	}

	// 返回生日字符串，格式如下，1981-10-10
	clsIDCard.prototype.GetBirthDate = function() {
	  var BirthDate='';
	  if(this.Valid)BirthDate=this.GetBirthYear()+'-'+this.GetBirthMonth()+'-'+this.GetBirthDay();
	  return BirthDate;
	}

	// 返回生日中的年，格式如下，1981
	clsIDCard.prototype.GetBirthYear = function() {
	  var BirthYear='';
	  if(this.Valid)BirthYear=this.ID18.substr(6,4);
	  return BirthYear;
	}

	// 返回生日中的月，格式如下，10
	clsIDCard.prototype.GetBirthMonth = function() {
	  var BirthMonth='';
	  if(this.Valid)BirthMonth=this.ID18.substr(10,2);
	  if(BirthMonth.charAt(0)=='0')BirthMonth=BirthMonth.charAt(1);
	  return BirthMonth;
	}

	// 返回生日中的日，格式如下，10
	clsIDCard.prototype.GetBirthDay = function() {
	  var BirthDay='';
	  if(this.Valid)BirthDay=this.ID18.substr(12,2);
	  return BirthDay;
	}

	// 返回性别，1：男，0：女
	clsIDCard.prototype.GetSex = function() {
	  var Sex='';
	  if(this.Valid)Sex=this.ID18.charAt(16)%2;
	  return Sex;
	}

	// 返回15位身份证号码
	clsIDCard.prototype.Get15 = function() {
	  var ID15='';
	  if(this.Valid)ID15=this.ID15;
	  return ID15;
	}

	// 返回18位身份证号码
	clsIDCard.prototype.Get18 = function() {
	  var ID18='';
	  if(this.Valid)ID18=this.ID18;
	  return ID18;
	}

	// 返回所在省，例如：上海市、浙江省
	clsIDCard.prototype.GetLocal = function() {
	  var Local='';
	  if(this.Valid)Local=this.Local;
	  return Local;
	}

	clsIDCard.prototype.GetVCode = function(CardNo17) {
	  var Wi = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);
	  var Ai = new Array('1','0','X','9','8','7','6','5','4','3','2');
	  var cardNoSum = 0;
	  for (var i=0; i<CardNo17.length; i++)cardNoSum+=CardNo17.charAt(i)*Wi[i];
	  var seq = cardNoSum%11;
	  return Ai[seq];
	}

	clsIDCard.prototype.CheckValid = function(CardNo18) {
	  if(this.GetVCode(CardNo18.substr(0,17))!=CardNo18.charAt(17))return false;
	  if(!this.IsDate(CardNo18.substr(6,8)))return false;
	  var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
	  if(aCity[parseInt(CardNo18.substr(0,2))]==null)return false;
	  this.ID18=CardNo18;
	  this.ID15=CardNo18.substr(0,6)+CardNo18.substr(8,9);
	  this.Local=aCity[parseInt(CardNo18.substr(0,2))];
	  return true;
	}

	clsIDCard.prototype.IsDate = function(strDate) {
	  var r = strDate.match(/^(\d{1,4})(\d{1,2})(\d{1,2})$/);
	  if(r==null)return false;
	  var d= new Date(r[1], r[2]-1, r[3]);
	  return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[2]&&d.getDate()==r[3]);
	}



//验证身份证是否合法
function checkIdcard(idcard){ 	
	var checkFlag = new clsIDCard(idcard);
if (!checkFlag.IsValid()){
	  return "验证不通过！";
}else{
	  return "验证通过!";
}
} 
//url特殊字符
function encodeURLKcapp(str){
	if(!IsSpace(str)){
		return encodeURIComponent(encodeURIComponent(str));
	}else{
		return str;
	}
}
//解码
function decodeURLKcapp(str){
	if(!IsSpace(str)){
		return decodeURIComponent(decodeURIComponent(str));
	}else{
		return str;
	}
}

//特殊字符转码（可扩展）
function Escape2Sql(str){
    str = str.replaceAll("'","'||chr(39)||'")
    str = str.replaceAll("&","'||chr(38)||'")
    str = str.replaceAll("<","'||chr(60)||'")
    str = str.replaceAll(">","'||chr(62)||'")
    str = str.replaceAll("%","'||chr(37)||'")
    //str = str.replaceAll("%","\\%")
    return str;
}

function iframeFitHeight(oIframe)
{//Iframe窗口自适应高度 兼容IE6.0,google, FF2.0以上
try
{
var oWin = oIframe.name ? window.frames[oIframe.name] : oIframe.contentWindow; 
oIframe.style.height = oWin.document.body.scrollHeight + "px";
}
catch(e){}
}

/*
 * 根据参数创建页面隐藏域
 * */
function createHiddenHtml(reportParam){
	var str = reportParam.split("&");
	for(var i = 0 ; i < str.length ; i++){	
		var name = str[i].split("=")[0];
		//var value = decodeURLKcapp(str[i].split("=")[1]);
		var value = str[i].split("=")[1];
		if(!IsSpace(name)){
			value = value.replaceAll("%25","%");
			if (IsSpace(document.getElementsByName(name))) {
				value = value.replaceAll("'","&#x27;");
				var hiddenObj = document.createElement("<input type = 'hidden' name = '"+name+"' value = '" + value + "'>");
				var tdObj = document.getElementById("hiddenTd1");
				tdObj.appendChild(hiddenObj);
			} else {
				document.getElementsByName(name)[0].value = value;				
			}
		}
	}
}

//
var docEle = function() {
    return document.getElementById(arguments[0]) || false;
}

function openNewDiv() {
    var m = "mask";
    var _id = "newdiv";
    if (docEle(_id)) document.body.removeChild(docEle(_id));
    if (docEle(m)) document.body.removeChild(docEle(m));
    //mask遮罩层
    var newMask = document.createElement("div");
    newMask.id = m;
    newMask.style.position = "absolute";
    newMask.style.zIndex = "9999";
    _scrollWidth = Math.max(document.body.scrollWidth,document.documentElement.scrollWidth);
    _scrollHeight = Math.max(document.body.scrollHeight,document.documentElement.scrollHeight);
    newMask.style.width = _scrollWidth + "px";
    newMask.style.height = _scrollHeight + "px";
    newMask.style.top = "0px";
    newMask.style.left = "0px";
    newMask.style.background = "#33393C";
    newMask.style.filter = "alpha(opacity=20)";
    newMask.style.opacity = "0.80";
    document.body.appendChild(newMask);
    //新弹出层
    var newDiv = document.createElement("div");
    newDiv.id = _id;
    newDiv.style.position = "absolute";
    newDiv.style.zIndex = "9999";
    newDivWidth = 200;
    newDivHeight = 40;
    newDiv.style.width = newDivWidth + "px";
    newDiv.style.height = newDivHeight + "px";
    newDiv.style.top = (document.body.scrollTop + document.body.clientHeight/2 - newDivHeight/2) + "px";
    newDiv.style.left = (document.body.scrollLeft + document.body.clientWidth/2 - newDivWidth/2) + "px";
    newDiv.style.background = "#EFEFEF";
    newDiv.style.border = "1px solid #860001";
    newDiv.style.padding = "15px";
	var marquee = document.createElement("marquee");
	marquee.direction = "right";
	marquee.behavior = "alternate";
	marquee.style.lineHeight = "1.2"; 
	marquee.innerText = "正在处理，请稍候...";
	newDiv.appendChild(marquee);
 
    document.body.appendChild(newDiv);
}
//关闭层
function closeDiv(){
	  document.body.removeChild(docEle('newdiv'));
      document.body.removeChild(docEle('mask'));
      return false;
}

function openNewDiv_new() {
    var m = "mask_new";
    var _id = "newdiv_new";
    if (docEle(_id)) document.body.removeChild(docEle(_id));
    if (docEle(m)) document.body.removeChild(docEle(m));
    //mask遮罩层
    var newMask = document.createElement("div");
    newMask.id = m;
    newMask.style.position = "absolute";
    newMask.style.zIndex = "9999";
    _scrollWidth = Math.max(document.body.scrollWidth,document.documentElement.scrollWidth);
    _scrollHeight = Math.max(document.body.scrollHeight,document.documentElement.scrollHeight);
    newMask.style.width = _scrollWidth + "px";
    newMask.style.height = _scrollHeight + "px";
    newMask.style.top = "0px";
    newMask.style.left = "0px";
    newMask.style.background = "#33393C";
    newMask.style.filter = "alpha(opacity=20)";
    newMask.style.opacity = "0.80";
    document.body.appendChild(newMask);
    //新弹出层
    var newDiv = document.createElement("div");
    newDiv.id = _id;
    newDiv.style.position = "absolute";
    newDiv.style.zIndex = "9999";
    newDivWidth = 200;
    newDivHeight = 40;
    newDiv.style.width = newDivWidth + "px";
    newDiv.style.height = newDivHeight + "px";
    newDiv.style.top = (document.body.scrollTop + document.body.clientHeight/2 - newDivHeight/2) + "px";
    newDiv.style.left = (document.body.scrollLeft + document.body.clientWidth/2 - newDivWidth/2) + "px";
    newDiv.style.background = "#EFEFEF";
    newDiv.style.border = "1px solid #860001";
    newDiv.style.padding = "15px";
	var marquee = document.createElement("marquee");
	marquee.direction = "right";
	marquee.behavior = "alternate";
	marquee.style.lineHeight = "1.2"; 
	marquee.innerText = "正在努力加载中，请稍候...";
	newDiv.appendChild(marquee);
 
    document.body.appendChild(newDiv);
}
//关闭层
function closeDiv_new(){
	if(document.getElementById("newdiv_new")!=null){
	     document.body.removeChild(docEle('newdiv_new'));
	}
	if(document.getElementById('mask_new')!=null){
         document.body.removeChild(docEle('mask_new'));
	}
      return false;
}

// 校验
function valiBlank(id,text){
	var val = document.getElementById(id).value;
	if(IsSpace(val)){
		alert(text);
		return false;
	}else{
		return true;
	}
}

// 选中下拉
function checkSelect(id,val){
	var sel = document.getElementById(id);
	for(var i=0;i<sel.options.length;i++){
		if(sel.options[i].value == val){
			sel.options[i].selected = true;
			break;
		}
	}
}

//得到下拉值
function getSelectInnerHTML(id){
	var sel = document.getElementById(id);
	for(var i=0;i<sel.options.length;i++){
		if(sel.options[i].selected == true){
			return sel.options[i].innerHTML;
			break;
		}
	}
}
//数字金额格式化，s输入数值，n保留小数点位数
function fmoney(s, n) {
	if(s!="") {
		n = n > 0 && n <= 20 ? n : 2;
		s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
		var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
		t = "";
		for (i = 0; i < l.length; i++) {
			t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
		}
		return t.split("").reverse().join("") + "." + r;
	} else {
		return "";
	}
}

/**
 * 重新设置url中cname参数的值cvalue
 */
function resetCondition(url,cname,cvalue){
	var condition = cname+"="+cvalue;
	if(url.indexOf("&"+cname+"=")>-1){
		var arr = url.split("&");
		for(var i=0;i<arr.length;i++){
			if(arr[i].indexOf(cname)>-1){
				url = url.replace(arr[i],condition);
			}
		}
	}else{
		url+="&"+condition;
	}
	return url;
}

function globalnavigation(path,instance_code){
	//var url = window.top.window.frames["perspective_main"].window.frames["perspective_toolbar"].location.href;
	var url = path+"/ccapp/app_5/leftMenu.jsp?1=1";
	url = resetCondition(url,"instance_code",instance_code);
	//alert(url);
	window.top.window.frames["perspective_main"].window.frames["perspective_toolbar"].location=url;
}

/**
 * 后退
 */
function tobck(pat){
	//history.go(-1);R
	// 回首页
	window.location.href = pat+"/fristPage.jsp";
}

var checkAllCommon = function(obj,name) {
		var status = $(obj).attr("checked");
		if (status == 'checked') {
			$("[name='"+name+"']").attr("checked", "checked");
		} else {
			$("[name='"+name+"']").removeAttr("checked");
		}
	};

	/**用户登录
	 * @param url
	 * @param userId
	 */
	function userCheckAndSub(url,userId){
		 if(userId==null||userId==""){//如果没登录
			 $.promptt("用户登录", function(username,password) {
			  if(IsSpace(username)){
			       $.toast("请输入身份证","text");
			       
			       setTimeout(function() {
			    	   userCheckAndSub(url,userId);
			    	    }, 2000);
				 return;
			 }
			  if(checkIdcard(username)=="验证不通过！"){
				 $.toast("请输入有效的身份证","text");
				  setTimeout(function() {
			    	   userCheckAndSub(url,userId);
			    	    }, 2000);
				 return;
				 
			 }
			  if(IsSpace(password)){
			       $.toast("请输入密码","text");
			       
			       setTimeout(function() {
			    	   userCheckAndSub(url,userId);
			    	    }, 2000);
				 return;
			 }
				 if(username !=null && password !=null){
					$.ajax({
						url:"userLogin"+url+"&idCard="+username+"&userPwd="+password,
						type:"post",
						async:false,
						dataType:"json",
						success:function(data){
							if(data.message=='1'){
								//$.alert("登录成功");
								location.href=url;
								
							}else{
								$.alert("该用户不存在,请先注册");
								 $("#zhuce").show();
								 $("#login").hide();
								 $("#out").hide();
							}
						}
					});
				 }else{
					 $.alert("请输入用户名和密码！");
				 }
			 }, function() {
		         //取消操作
				 $("#zhuce").show();
				 $("#login").show();
		       });
			 
		 }else{
			 location.href=url;
		 }
	}	
	var flag="";
	/**用户注册
	 * @param url
	 * @param username
	 */
	function registeruser(){
			 $.promptres("用户注册", function(username,password,repassword,idCard) {
				 checkuser(username,password,repassword,idCard);
				 if(flag !="1"){
					 $.ajax({
							url:"wechatBuss_insertregister.do?user.userName="+username+"&user.passWord="+password+"&user.idCard="+idCard,
							type:"post",
							async:false,
							dataType:"json",
							success:function(data){
								if(data.message=='1'){
									//$.alert("登录成功");
									location.href=url;
									 $("#zhuce").hide();
									 $("#login").show();
								}else{
									 $.alert("该用户已存在","警告！");
								}
							}
						});
				 }else{
					 registeruser();
				 }
				 
				
			 }, function() {
		         //取消操作
		         //return ;
		       });
		
	}
	function checkuser(username,password,repassword,idCard){
		var panode = $(".weui_dialog_hd").parent();
		//alert($(".weui_dialog_hd").parent().html());
		 if(IsSpace(username)){
			 panode.hide();
			$.alert("请输入用户名","警告！");
			flag="1" ;
			
		 }else if(IsSpace(password)){
			 $.alert("请设置密码","警告！");
			 flag="1";
		 }else  if(IsSpace(repassword)){
			 $.alert("请重复密码","警告！");
			 flag="1";
		 }else if(IsSpace(idCard)){
			 $.alert("请输入身份证号码","警告！");
			 flag="1";
		 }else if(password !=repassword){
			 $.alert("密码与重复密码不一致","警告！");
			 flag="1";
		 }else if(checkIdcard(idCard)=="验证不通过！"){
			 $.alert("请输入有效的身份证","警告！");
			 flag="1";
		 }
	}
	function userCheckAndSuborg(url,userId,returnurl){
		 if(userId==null||userId==""){//如果没登录
			 $.prompttt("用户登录", function(username,password) {
			  if(IsSpace(username)){
			       $.toast("请输入身份证","text");
			       
			       setTimeout(function() {
			    	   userCheckAndSuborg(url,userId,returnurl);
			    	    }, 2000);
				 return;
			 }
			  if(checkIdcard(username)=="验证不通过！"){
				 $.toast("请输入有效的身份证","text");
				  setTimeout(function() {
					  userCheckAndSuborg(url,userId,returnurl);
			    	    }, 2000);
				 return;
				 
			 }
			  if(IsSpace(password)){
			       $.toast("请输入密码","text");
			       
			       setTimeout(function() {
			    	   userCheckAndSuborg(url,userId,returnurl);
			    	    }, 2000);
				 return;
			 }
				 if(username !=null && password !=null){
					$.ajax({
						url:"wechatBuss_ajaxLogin.do?requestUrl="+url+"&idCard="+username+"&userPwd="+password,
						type:"post",
						async:false,
						dataType:"json",
						success:function(data){
							if(data.message=='1'){
								//$.alert("登录成功");
								location.href=url;
								
							}else{
								$.alert("该用户不存在,请先注册");
								 $("#zhuce").show();
								 $("#login").hide();
								 $("#out").hide();
							}
						}
					});
				 }else{
					 $.alert("请输入用户名和密码！");
				 }
			 }, function() {
		         //取消操作
				 location.href=returnurl;
				 $("#zhuce").show();
				 $("#login").show();
		       });
			 
		 }else{
			 location.href=url;
		 }
	}
	