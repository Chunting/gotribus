function $(id){return document.getElementById(id);}
//var isIE = (document.all) ? true : false;
function Box(objID,W,H,inner,footerInner){
	var objHead,objBody,objFooter,inner,footerInner;
	if(!$(objID)){
	//创建html结构并赋id以及class		
		var obj = document.createElement("div");		
		var objHead = document.createElement("div");
		var objBody = document.createElement("div");
		var objFooter = document.createElement("div");
		obj.id=objID;
		obj.className="lightBox";		
		objHead.id=objID+"_head";
		objBody.id=objID+"_body";
		objFooter.id=objID+"_footer";
		objHead.className="Boxheader";
		objBody.className="Boxbody";
		objFooter.className="Boxfooter";		
		obj.appendChild(objHead);
		obj.appendChild(objBody);
		obj.appendChild(objFooter);
		document.body.appendChild(obj);
		//如果参数为空时的处理
		if(W==undefined||W<200||W==""){W=200}//�?��宽度
		if(H==undefined||H<60||H==""){H=60}
		if(inner==undefined || inner=="" ){inner="欢迎光临书序网！这里有很多简历和范文哦！"}
		if(footerInner==undefined || footerInner=="" ){footerInner=""}//页脚没有内容时默认�?
		var BodyLid = objID+"BodyL",BodyRid = objID+"BodyR",headerLid = objID+"headerL",FooterLid= objID+"FooterL",closeBtn= objID+"closeBtn",cancelBtn =objID+"cancel";		
		objBody.innerHTML='<div class="BodyL" id='+BodyLid+'>'+inner+'</div><div class="BodyR" id='+BodyRid+'></div>';
		objHead.innerHTML='<div class="headerL" id='+headerLid+'><span style="float:right;background:url(../view/activity/img/lightbox-close.png) no-repeat 0 center;display:inline-block;height:46px;width:16px;cursor:pointer;" id='+closeBtn+'></span></div><div class="headerR"></div>';
		objFooter.innerHTML='<div class="FooterL" id='+FooterLid+'>'+footerInner+'</div><div class="FooterR"></div>';
		//js样式设置
		$(BodyLid).style.height=H+"px";
		$(BodyLid).style.width=W+"px";
		$(FooterLid).style.width=$(headerLid).style.width=W+"px";
		$(BodyRid).style.height=$(BodyLid).clientHeight+"px";		
		obj.style.cssText+=";position:absolute;left:50%;top:50%;z-index:901;";		
		obj.style.marginLeft=-obj.scrollWidth/2+"px";
		obj.style.marginTop=-obj.scrollHeight/2+"px";	
		
		document.body.style.cssText+="height:100%;overflow:hidden;";		
		var mask=0;//是否创建遮罩�?
		if(mask){
			var objMask = document.createElement("div");
				objMask.id="Mask";objMask.className="BoxMask";
				document.body.appendChild(objMask);objMask.style.cssText+=";position:absolute;z-index:900;";
				objMask.style.height=document.documentElement.scrollHeight+document.documentElement.scrollTop+"px";
			}
		function Close(objID){
			document.body.removeChild($(objID));document.body.style.cssText+="width:100%;overflow:auto;"; if(objMask){document.body.removeChild(objMask)}
		}
		$(closeBtn).onclick = function(){Close(objID)};//关闭按钮
		if($(cancelBtn)){$(cancelBtn).onclick = function(){Close(objID)}}//取消按钮
		
		//拖动功能			
	//if(evt.keycode==27){alert("esc")};
	var w = obj.scrollWidth,h = obj.scrollHeight;
	var iWidth = document.documentElement.clientWidth; 
	var iHeight = document.documentElement.clientHeight; 	
	var moveX = 0,moveY = 0,moveTop = 0,moveLeft = 0,moveable = false;
		objHead.onmousedown = function(e) {	
		moveable = true; 	
		e = window.event?window.event:e;
		moveX = e.clientX-obj.offsetLeft;		
		moveY = e.clientY-obj.offsetTop;
		obj.style.zIndex++;
		document.onmousemove = function(e) {
				if (moveable) {
				e = window.event?window.event:e;		
				var x = e.clientX - moveX;
				var y = e.clientY - moveY;
					if ( x > 0 &&( x + w < iWidth) && y > 0 && (y + h < iHeight) ) {
						obj.style.left = x + "px";
						obj.style.top = y + "px";
						obj.style.margin = "auto";
						}
					}
				}
				document.onmouseup = function () {moveable = false;};
		}
	}else(alert("has been opened!"));
	
}//box();End
