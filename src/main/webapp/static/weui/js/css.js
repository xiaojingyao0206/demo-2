	function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}
	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}
 
	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}
 
	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array();
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}
	
	function senfe(o, a, b, c, d) {
		var t = document.getElementById(o).getElementsByTagName("tr");
		for ( var i = 0; i < t.length; i++) {
			t[i].style.backgroundColor = (t[i].sectionRowIndex % 2 == 0) ? a
					: b;
			t[i].onclick = function() {
				if (this.x != "1") {
					this.x = "1";//本来打算直接用背景色判断，FF获取到的背景是RGB值，不好判断
					this.style.backgroundColor = d;
				} else {
					this.x = "0";
					this.style.backgroundColor = (this.sectionRowIndex % 2 == 0) ? a: b;
				}
			};
			t[i].onmouseover = function() {
				if (this.x != "1")
					this.style.backgroundColor = c;
			};
			t[i].onmouseout = function() {
				if (this.x != "1")
					this.style.backgroundColor = (this.sectionRowIndex % 2 == 0) ? a: b;
			};
		}
	}
	// by zhangxinxu welcome to visit my personal website http://www.zhangxinxu.com/
	// 2010-03-12 v1.0.0
	//十六进制颜色值域RGB格式颜色值之间的相互转换

	//-------------------------------------
	//十六进制颜色值的正则表达式
	var reg = /^#([0-9a-fA-f]{3}|[0-9a-fA-f]{6})$/;
	/*RGB颜色转换为16进制*/
	String.prototype.colorHex = function(){
		var that = this;
		if(/^(rgb|RGB)/.test(that)){
			var aColor = that.replace(/(?:\(|\)|rgb|RGB)*/g,"").split(",");
			var strHex = "#";
			for(var i=0; i<aColor.length; i++){
				var hex = Number(aColor[i]).toString(16);
				if(hex === "0"){
					hex += hex;	
				}
				strHex += hex;
			}
			if(strHex.length !== 7){
				strHex = that;	
			}
			return strHex;
		}else if(reg.test(that)){
			var aNum = that.replace(/#/,"").split("");
			if(aNum.length === 6){
				return that;	
			}else if(aNum.length === 3){
				var numHex = "#";
				for(var i=0; i<aNum.length; i+=1){
					numHex += (aNum[i]+aNum[i]);
				}
				return numHex;
			}
		}else{
			return that;	
		}
	};

	//-------------------------------------------------

	/*16进制颜色转为RGB格式*/
	String.prototype.colorRgb = function(){
		var sColor = this.toLowerCase();
		if(sColor && reg.test(sColor)){
			if(sColor.length === 4){
				var sColorNew = "#";
				for(var i=1; i<4; i+=1){
					sColorNew += sColor.slice(i,i+1).concat(sColor.slice(i,i+1));	
				}
				sColor = sColorNew;
			}
			//处理六位的颜色值
			var sColorChange = [];
			for(var i=1; i<7; i+=2){
				sColorChange.push(parseInt("0x"+sColor.slice(i,i+2)));	
			}
			return "RGB(" + sColorChange.join(",") + ")";
		}else{
			return sColor;	
		}
	};