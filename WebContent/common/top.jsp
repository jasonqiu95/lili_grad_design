<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.estarcom.cnis.cssn.customersystem.user.Operator" %>
<%@ page import="com.estarcom.cnis.cssn.astm.util.ASTMConstant"%>
<%
	String logID=session.getAttribute("logID")!=null?session.getAttribute("logID").toString() : "";
	String loginByUkeyIdActionUrl="/loginByUkeyIdServlet";
	if(session.getAttribute("loginByUkeyIdActionUrl") != null){
		loginByUkeyIdActionUrl = (String)session.getAttribute("loginByUkeyIdActionUrl");
	}
	
	String loginByUkeyIdActionUrlIso ="/loginByUkeyIdServletIso";
	if(session.getAttribute("loginByUkeyIdActionUrlIso") != null){
		loginByUkeyIdActionUrlIso = (String)session.getAttribute("loginByUkeyIdActionUrlIso");
	}
  String userAgent = request.getHeader("user-agent");
  boolean ie6 = false;
  if(userAgent!=null && !"".equals(userAgent) && userAgent.indexOf("MSIE 6.0")>0){
	  ie6 = true;
  }
  String loginActionUrl = "/logonServlet";
  if(session.getAttribute("AuthLoginActionUrl") != null){
	loginActionUrl = (String)session.getAttribute("AuthLoginActionUrl");
  }
  HttpServletRequestWrapper originalRequest = new HttpServletRequestWrapper(request);
  request.getParameter("");
  session.setAttribute("AuthOriginalRequest",originalRequest);
  Operator operator = (Operator) request.getSession().getAttribute("operator");
  String DRM_FLAG = null;
  if(request.getSession().getAttribute("DRM_FLAG")!=null){
	  DRM_FLAG =   (String)request.getSession().getAttribute("DRM_FLAG") ;
  }
  
	
  //String on = operator!=null ? operator.getRealName() : null;
  String on = operator!=null ? operator.getLoginName() : null;
  ArrayList shopingcarlist = null;
  if(request.getSession().getAttribute("stan_shopingcar") != null) {
	shopingcarlist = (ArrayList) request.getSession().getAttribute("stan_shopingcar");
  }
  int shopingcarsize = 0;
  if(shopingcarlist != null && shopingcarlist.size()>0) shopingcarsize = shopingcarlist.size();

  HashMap astmshopingcarlist = (HashMap)request.getSession().getAttribute(ASTMConstant.ASTM_CAR_NAME);
  int astmshopingcarsize = 0;
  if(astmshopingcarlist != null && astmshopingcarlist.size()>0) astmshopingcarsize = astmshopingcarlist.size();
%>
<%
  Date date = new Date();
  SimpleDateFormat form = new SimpleDateFormat("今天是"+"yyyy年MM月dd日 E");
  String stri=form.format(date); 
%>
<%if(ie6){%>
<link href="/pagesnew/css/ie6.min.css" rel="stylesheet">
<%}%>
<div class="topBox clearfix">
  <div class="loginBox fleft">
    <span class="tgray mr10"><%=on!=null?on+"您好，":""%><%if(logID!=null&&!logID.equals("")&&logID.equals("uKey")){%>您是<%}else{%>欢迎来到<%}%>中国标准服务网<%if(logID!=null&&!logID.equals("")&&logID.equals("uKey")){%>大客户<%}%></span>
	<%if(operator==null){%>
	<a href="#" onclick="loginByUkey()"><img src="../img/USBlogin2.png"/></a>
    <a href="/pagesnew/common/login_index.jsp" class="btn btn-primary btn-mini"><i class="icon-lock icon-white"></i> 登录</a>
    <span class="line-top"></span>
    <a href="/pagesnew/common/registration.jsp">注册</a>
	 <%}else{%>
	   <a href="/pagesnew/common/logout.jsp" class="btn btn-primary btn-mini">退出</a>
	<%}%>
	<%if(!ie6){%>
	<span class="line-top"></span>
	<span class="line-top" style="vertical-align:baseline">
	<form class="form-search" id="websearch" name="websearch" action="/pagesnew/common/webin_search.jsp" target="_blank">
	<INPUT TYPE="hidden" id="showSearch" name="showSearch" value="">
	  <div class="input-append">
    	<input id="focusSearch" name="focusSearch" type="text" class="search-query" placeholder="站内检索..."  value="站内检索..." onKeyDown="if(event.keyCode == 13) websech_submit()"/>
	  </div>
	</form>
	</span>
   <%}%>
   <span  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
  <!--
 
   <a href="http://www.cssn.net.cn"  class="btn btn-primary btn-mini" style="background-color:#8c8c8c" target="_blank">访问旧站 </a>
    -->
  </div>
  	
  <div class="userBox fright">
  	<span id="astmcarinfo"><%if(astmshopingcarsize>0){%><a href="/pagesnew/astm/astm_shopping_car.jsp" class="btn btn-primary btn-mini" target="_blank"><i class="icon-shopping-cart icon-white"></i> ASTM购物车(<%=astmshopingcarsize%>)</a><%}%></span>
    <a href="/pagesnew/trade/standard_shopingcar.jsp" class="btn btn-primary btn-mini" target="_blank"><i class="icon-shopping-cart icon-white"></i> 购物车<span id="carsizeinfo"><%if(shopingcarsize>0){%>(<%=shopingcarsize%>)<%}%></span></a>
    <span class="line-top"></span>
    <a href="/pagesnew/mystandard/userCenter_orderView.jsp?menu=ddll" target="_blank">我的订单</a>
    <span class="line-top"></span>
    <a href="/pagesnew/mystandard/userCenter_standardTracking.jsp?menu=dzbzgz" target="_blank">免费标准跟踪</a>
    <span class="line-top"></span>
    <a href="/pagesnew/mystandard/userCenter.jsp?menu=yhzx" target="_blank">用户中心</a>
	 
	 <span class="line-top"></span>
    <a target="_blank" href="/pagesnew/search/search_base_EN.jsp">English</a>
	 
	<%if(ie6){%>
	<span class="line-top"></span>
    <form class="form-search" id="websearch" name="websearch" action="/pagesnew/common/webin_search.jsp" target="_blank" method="get">
	<INPUT TYPE="hidden" id="showSearch" name="showSearch" value="">
	  <div class="input-append">
    	<input id="focusSearch" name="focusSearch" type="text" class="search-query" placeholder="站内检索..."  value="站内检索..." onKeyDown="if(event.keyCode == 13) websech_submit()"/>
	  </div>
	</form>
	<%}%>
  </div>
<object id="Object1" classid="clsid:023FB4F6-3CF9-4E5C-9E33-9FDE19CE9080" style="display:none" ></object>
	<form id="ukeyForm" name="ukeyForm" action="<%=loginByUkeyIdActionUrl%>" style="display:none">
   		<INPUT TYPE="hidden" id="ukeyId" name="ukeyId" value=""/>
   		<INPUT TYPE="hidden" id="topJsp" name="topJsp" value="topJsp"/>
   		</form>
   		<form id="ukeyFormIso" name="ukeyFormIso" action="<%=loginByUkeyIdActionUrlIso%>" style="display:none">
   		</form>
</div>
<div>
    <input type="hidden" id="ISO" value="<%=operator%>"/>
</div>
<script type="text/javascript" src="/pagesnew/js/jquery-1.7.2.min.js"></script>
<script src="/pagesnew/js/jquery.js"  language="JavaScript"></script>
<script src="/pagesnew/js/jquery_dialog.js"  language="JavaScript"></script>
<link rel="stylesheet" href="/pagesnew/css/jquery_dialog.css" type="text/css"/>
<script type="text/javascript">
function loginByUkey(){
	var dd = document.getElementById("Object1");
	
	  if(navigator.userAgent.indexOf("MSIE")<0){
		  alert("请使用IE浏览器!");
		   return;
	}
	 if (dd.object==null) {
		    JqueryDialog.Open('ActiveX插件下载', "http://www.cssn.net.cn/pagesnew/common/DownPdfActiveX.jsp",400,150);
	       return;
	}

    var UKeySN= dd.ShowUKeySN(); //获取U盾序列号    
	//获取到uid
	//var UKeySN='B88A85E68001CB00';
	//alert(UKeySN);
	$("#ukeyId").val(UKeySN);
	if(UKeySN!=''){
	$("#ukeyForm").submit();
	}else{
	alert("请插入U盾");
	return;
	}
}

  function loginByUkeyIso(){
	var iso = document.getElementById("ISO").value;
	if(iso=='null'){
	   alert("您未登陆，请点击登陆！");
	   return;
	}
	$("#ukeyFormIso").submit();
}
</script>