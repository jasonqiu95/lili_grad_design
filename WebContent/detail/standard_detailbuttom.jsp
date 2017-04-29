<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page	import="com.estarcom.cnis.cssn.salesystem.order.service.TProductStandardElec"%>
<%@page	import="com.estarcom.cnis.cssn.salesystem.order.service.AbstractTProductStandardElec"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.axis2.rpc.client.RPCServiceClient" %>
<%@ page import="com.lkscn.common.WebServiceClientConn" %>
<%@ page import="com.lkscn.common.Constant" %>
<%@ page import="javax.xml.namespace.QName" %>
<%@ page import="com.util.JsonUtil" %>
<%@ page import="cn.gov.cnis.cssn.wssort.StandardElecInfo" %>

<%

String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";

String a001=request.getParameter("a001");
String a000="",a100="",a101="",a104="",a205="",a207="",a206="",a850="",a298="",a300="",a301="",a302="",a330="",a825="",a826="";
String pageNum="",pageFormat="",fileName="";
RPCServiceClient serviceClient =WebServiceClientConn.getServiceClient();
QName opAddEntry = WebServiceClientConn.getTheMethod("getStandardDetail");
Object[] opaddentryArgs = new Object[]{ Constant.ORGLOGINNAME,Constant.ORGPASSWD, Constant.UKEYID, Constant.ORGCODE,a001 };
Class[] classes = new Class[] { String.class };
String jsonStr = (String) serviceClient.invokeBlocking(opAddEntry,opaddentryArgs, classes)[0];
List resultstr = JsonUtil.json2bean(jsonStr, ArrayList.class);
for (int i = 0; i < resultstr.size(); i++) 
{
	Map<String,String> map = (Map<String,String>) resultstr.get(i);
	a000=map.get("A000");
	a100=map.get("A100");
	a101=map.get("A101");
	a104=map.get("A104");
	a205=map.get("A205");
	a207=map.get("A207");
	a206=map.get("A206");
	a850=map.get("A850");
	a298=map.get("A298");
	a300=map.get("A300");
	a301=map.get("A301");
	a302=map.get("A302");
	a330=map.get("A330");
	a825=map.get("A825");
	a826=map.get("A826");
}
boolean hasElec=false;
opAddEntry = WebServiceClientConn.getTheMethod("getStandardElec");
opaddentryArgs = new Object[] { Constant.ORGLOGINNAME,Constant.ORGPASSWD, Constant.UKEYID, Constant.ORGCODE, "",
a001 };
classes = new Class[] { StandardElecInfo[].class };
StandardElecInfo[] info = (StandardElecInfo[]) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
if(info.length>0)
{
	hasElec=true;
	pageNum=info[0].getPageNum();
	pageFormat=info[0].getPageFormat();
	fileName=info[0].getFileName();
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<base href="<%=basePath%>">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<title>欢迎来到标准服务中心__详细标准信息</title>
<link rel="stylesheet" href="asserts/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="asserts/css/design.css" type="text/css" />
<link rel="stylesheet" href="asserts/css/detailpage.css" type="text/css" />
<link href="asserts/css/style.css" rel="stylesheet" type="text/css"  />
</head>

<body>
	<!--主内容区-->
	<div class="mainBox detailbg">
		<div class="row-fluid">
			<!--左侧详细内容区-->
			<div class="detailLeft">
				<div class="detailtopBox nowbgc">
					<h3><%=a100%><span class="marked"><%=a000.equals("D")?"作废":"现行"%></span>
						<%
						if (hasElec) 
						{
						%>
<!-- 						<tr> -->
<!-- 							<td colspan="4">&nbsp;</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td colspan="4"> -->
<%-- 								<a href="detail/get_standard_adopt.jsp?a001=<%=a001%>&type=An800" target="_blank">下载</a> --%>
<!-- 							</td> -->
<!-- 						</tr> -->
						<%
						}
						%>
					</h3>
					<div class="row-fluid">
						<div class="span8">
							<dl class="<%if (a302.length() <= 62) {%>dl-horizontal<%} else {%>dl-horizontal-more<%}%>">
								<dt>中文题名：</dt>
								<dd><%=a298%></dd>
								<dt>英文题名：</dt>
								<dd><%=a302%></dd>
							</dl>
						</div>
						<div class="span4">
							<div class="btnBox">
								<div style="margin-top: 15px;">
									
				   <c:choose> 
				   	       <c:when test="${user==null }">									
	           		      			<a class="btn btn-info" href="${pageContext.request.contextPath }/logining.htm?from=search&url=<%=request.getRequestURL()+"?" + request.getQueryString()%>" target="_parent"> 如需下载请先登录</a>
						  </c:when> 
	           		      <c:when test="${user!=null }">									
	           		      			<a class="btn btn-info" target="_blank" href="${pageContext.request.contextPath }/search/download.htm?a001=<%=a001 %>&a100=<%=a100 %>&fileName=<%=fileName %>" target="_parent">
<!-- 										<i class="icon-shopping-cart icon-white"></i>下载 -->
									点击下载
									</a>
									<a class="btn btn-info"  target="_blank" href="${pageContext.request.contextPath }/search/onlineread.htm?a001=<%=a001 %>&a100=<%=a100 %>&fileName=<%=fileName %>" target="_parent">
<!-- 										<i class="icon-shopping-cart icon-white"></i>下载 -->
									点击预览
									</a>
						  </c:when> 
	           		      <c:otherwise></c:otherwise> 
 				   </c:choose>  


<!-- 									<a class="btn btn-info" -->
<%-- 										onClick="saveCollectionOneNew('<%//=loginname%>','<%//=sipstr%>','<%=a001%>')"> --%>
<!-- 										<i class="icon-star icon-white"></i> 收藏 -->
<!-- 									</a>  -->
<!-- 									<a class="btn btn-info" -->
<%-- 										onClick="javascript:AddPush('<%//=loginname%>','<%=a001%>')"> --%>
<!-- 										<i class="icon-globe icon-white"></i> 跟踪 -->
<!-- 									</a> -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<dl class="detailBox">
					<dt class="icon_info">基本信息</dt>
						<dd> 发布机构：<%=a104%></dd>
						<dd> 发布日期：<%=a101%></dd>
						<dd> 实施日期：<%=a205%></dd>
						<%if(!a207.equals("")){ %><dd> 确认日期：<%=a207%></dd><%} %>
						<%if(!a206.equals("")){ %><dd> 废止日期：<%=a206%></dd><%} %>
						<dd> 全文语种：<span id="getlanguagecn"></span></dd>
						<dd> 电子文档：<%=hasElec?"有":"无"%></dd>
						<%if(hasElec){ %>
						<dd> 全文页数:<%=pageNum %>P(<%=pageFormat %>)</dd>
						<%} %>
				</dl>
				
				<%if(!a300.equals("")) {%>
				<dl class="detailBox">
					<dt class="icon_scope">适用范围</dt>
					<dd>
						<%=a330 %>
					</dd>
				</dl>
				<%} %>
				<dl class="detailBox">
					<dt class="icon_assoc">关联标准</dt>
 					<!-- 替代与被替代 -->
					<dd class="row-fluid">
						<div id="getStandardReplace" class="span5">						
						</div>
						<div id="getStandardReplaced" class="span5">

						</div>
					</dd>
					
					<!-- 引用与被引用 -->
					<dd class="row-fluid">
						<div id="getStandardQuote" class="span5">
						
						</div>
						<div id="getStandardQuoted" class="span5">
						
						</div>
					</dd>
					
					<!-- 采用与被采用 -->
					<dd class="row-fluid">
						<div id="getStandardAdopt" class="span5">
						
						</div>
						<div id="getStandardAdopted" class="span5">
						
						</div>
					</dd>

				</dl>
				<dl class="detailBox">
					<dt class="icon_sort">标准分类号</dt>
					<dd>中国标准分类号：<span id="getCcsCn"></span>
					<dd>国际标准分类号：<span id="getIcsCn"></span>
				</dl>
<!-- 				<dl class="detailBox"> -->
<!-- 					<dt class="icon_other"> -->
<!-- 						浏览过的文献<span id="saveCookies"></span> -->
<!-- 					</dt> -->
<!-- 					<dd> -->
<!-- 						<span id="getBrowseHistory"></span> -->
<!-- 					</dd> -->
<!-- 				</dl> -->
			</div>
			<!--左侧详细内容区结束-->
			<!--右侧详细内容区-->
			<div class="detailRight">
				<dl class="otherLink">
					<dt>您可能关注的其他标准</dt>
					<dd>
						<ul>
							<span id="getInterestedStanard"></span>
						</ul>
					</dd>
				</dl>

				<dl class="otherLink">
					<dt>
						同一中国标准分类下的其他标准
						<p>
							<span id="getCcsCnShow"></span>
						</p>
					</dt>
					<dd>
						<ul>
							<span id="getIdenticalCcs"></span>
						</ul>
					</dd>
				</dl>

				<dl class="otherLink">
					<dt>
						同一国际标准分类下的其他标准
						<p>
							<span id="getIcsCnShow"></span>
						</p>
					</dt>
					<dd>
						<ul>
							<span id="getIdenticalIcs"></span>
						</ul>
					</dd>
				</dl>
			</div>
			<!--右侧详细内容区结束-->

		</div>
	</div>
	<form name="addCar" id="addCar"
		action="/pagesnew/trade/standard_shopingcar_validator.jsp"
		method="post" target="standard_shopingcar">
		<input type="hidden" name="carCheckBox" value="" /> <input
			type="hidden" name="a001" value="" />
	</form>
	<form name="addPush" action="/pagesnew/search/add_push.jsp"
		method="post" target="win_add_push">
		<input type="hidden" name="a001" value="" />
	</form>
	<form name="formtableone" id="formtableone"
		action="collection_standard_one.jsp" method="post"
		target="standard_shopingcar"></form>


	<!--弹出层区域-->
	<div class="modal hide" id="shopping">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>操作成功</h3>
		</div>
		<div class="modal-body">
			<p>您已经将《酒精通用分析方法》放入购物车了。</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">关闭</a> <a
				id="showShoppingCar" href="#" target="_blank"
				class="btn btn-primary" data-dismiss="modal">去购物车并结算</a>
		</div>
	</div>
	<div class="modal hide" id="shoppingUK">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>操作成功</h3>
		</div>
		<div class="modal-body">
			<p>您已经将《酒精通用分析方法》放入购物车了。</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">关闭</a> <a
				id="showShoppingCarUk" href="#" target="_blank"
				class="btn btn-primary" data-dismiss="modal">去购物车并结算</a>
		</div>
	</div>
	<div class="modal hide" id="favorites">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>操作提示</h3>
		</div>
		<div class="modal-body">
			<p></p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">确定继续添加</a> <a href="#"
				class="btn" data-dismiss="modal">关闭</a> <a id="showFavorites"
				href="#" class="btn btn-primary" data-dismiss="modal">查看收藏列表</a>
		</div>
	</div>
	<div class="modal hide" id="track">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>操作成功</h3>
		</div>
		<div class="modal-body">
			<p>您已经对《酒精通用分析方法》进行了跟踪。</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">关闭</a> <a id="showTrack"
				href="#" class="btn btn-primary" data-dismiss="modal">查看标准跟踪列表</a>
		</div>
	</div>
	<!--弹出层区域结束-->
	<!--主内容区结束-->

<%@ include file="/common/foot.jsp"%>
<script type="text/javascript"
	src="/pagesnew/js/dojo-1.0.2/dojo/dojo.js"
	djConfig="isDebug: false, parseOnLoad: true"></script>

<script language="JavaScript" src="../js/search.js"></script>
<script language="JavaScript" src="../js/nv_service.js"></script>

<script type="text/javascript">
$(document).ready(function()
{
	
	$.get("detail/get_ccs_cn.jsp?a825=<%=a825%>", function(result){
		$("#getCcsCn").html(result);
		$("#getCcsCnShow").html(result);
	});
	
	$.get("detail/get_ics_cn.jsp?a826=<%=a826%>", function(result){
			$("#getIcsCn").html(result);
			$("#getIcsCnShow").html(result);
	});
	$.get("detail/get_language_cn.jsp?a300=<%=a300%>", function(result){
			$("#getlanguagecn").html(result);
	});
	
	$.get("detail/get_standard_replace.jsp?a001=<%=a001%>&type=A462", function(result){
			$("#getStandardReplace").html(result);
	});
	
	$.get("detail/get_standard_replace.jsp?a001=<%=a001%>&type=A461", function(result){
			$("#getStandardReplaced").html(result);
	});
	
	$.get("detail/get_standard_quote.jsp?a001=<%=a001%>&type=A502", function(result){
			$("#getStandardQuote").html(result);
	});
	
	$.get("detail/get_standard_quote.jsp?a001=<%=a001%>&type=An502", function(result){
			$("#getStandardQuoted").html(result);
	});
	$.get("detail/get_standard_adopt.jsp?a001=<%=a001%>&type=A800", function(result){
			$("#getStandardAdopt").html(result);
	});
	
	$.get("detail/get_standard_adopt.jsp?a001=<%=a001%>&type=An800", function(result){
			$("#getStandardAdopted").html(result);
	});
	
	$.get("detail/get_interested_standard.jsp?a001=<%=a001%>", function(result){
			$("#getInterestedStanard").html(result);
	});
	
	$.get("detail/get_identical_css.jsp?a825=<%=a825%>", function(result){
			$("#getIdenticalCcs").html(result);
	});

	$.get("detail/get_identical_ics.jsp?a826=<%=a826%>", function(result){
			$("#getIdenticalIcs").html(result);
	});
	

	$("#showShoppingCar")
			.click(
					function() {
						window
								.open("/pagesnew/trade/standard_shopingcar.jsp");

					});

	$("#showShoppingCarUk")
			.click(
					function() {
						window
								.open("/pagesnew/trade/standard_shopingcar.jsp");

					});
	$("#showFavorites")
			.click(
					function() {
						window
								.open("/pagesnew/mystandard/standard_restore_list.jsp");

					});

	$("#showTrack")
			.click(
					function() {
						window
								.open("/pagesnew/mystandard/userCenter_standardTracking.jsp");

					});

	});

	function addShopingCar(lname, a001) {

		/*
		document.addCar.action = "/pages/nv_trade/standard_shopingcar_validator.jsp";
		document.addCar.method = "post";
		document.addCar.target = "standard_shopingcar";
		document.addCar.a001.value = a001;
		 */

		/*
		if(!lname || lname=="" || lname=="null"){
			alert("您还没有登陆系统，请先登陆系统！");
			return;
		}
		 */
		//alert("a001 = " + a001);
		//window.open("","standard_shopingcar","toolbar=0,menubar=0,location=0,status=1,scrollbars=0,resizable=1");
		document.addCar.a001.value = a001;

		//

		var a0001 = "";
		var objectlist = document.all("checkboxPriceee");
		var objest = document.getElementsByTagName("checkboxPriceee");
		var flag = false;

		if (objectlist != null) {

			for (var i = 0; i < objectlist.length; i++) {
				if (objectlist[i].checked) {
					a0001 += objectlist[i].value + ","; ///"TRUE, ,TRUE"
					flag = true;
				}
			}
			if (!flag) {
				alert("请最少选择一项");
				return;
			}

		}

		document.addCar.carCheckBox.value = a0001;
		document.addCar.submit();

		var htmlobj = $.ajax({
			url : "select_standard.jsp?b001=" + a001,
			async : false
		});

		$("div#shopping .modal-body p").empty();
		var str = "您已经将《" + htmlobj.responseText + "》放入购物车了。";
		$("div#shopping .modal-body p").html(str);
		$("#shopping").modal('show');

	}
	function trim(str) {
		return str.replace(/^(\s|\u00A0)+/, '')
				.replace(/(\s|\u00A0)+$/, '');
	}
	function addShopingCarUk(lname, a001, a100) {
		var flag = $.ajax({
			url : "shopingcar_isexist.jsp?a100=" + a100 + "&a="
					+ new Date(),
			async : false
		});
		var retStr = trim(flag.responseText);
		if (retStr == "true") {
			document.addCar.a001.value = a001;
			document.addCar.submit();
			var htmlobj = $.ajax({
				url : "select_standard.jsp?b001=" + a001,
				async : false
			});
			$("div#shopping .modal-body p").empty();
			var str = "您已经将《" + htmlobj.responseText + "》放入购物车了。";
			$("div#shopping .modal-body p").html(str);
			$("#shopping").modal('show');
		} else {
			$("div#shoppingUK .modal-body p").empty();
			var str = "该标准已放入购物车，请选择其它标准！";
			$("div#shoppingUK .modal-body p").html(str);
			$("#shoppingUK").modal('show');
		}
	}

	function saveCollectionOneNew() {
		var lname = arguments[0];
		var surl = arguments[1];
		var a001 = arguments[2];
		if (!lname || lname == "" || lname == "null") {
			alert("您还没有登陆系统，请先登陆系统在收藏！");
			return;
		}
		//alert("a001 = " + a001);
		//alert("lname = " + lname);

		//var ids = [a001];
		//var param = {};
		//param = '{"loginname":"' + lname + '","a001":"' + a001 + '"}';

		//alert("param = " + param);
		//var urlstr = "/pages/nv_search/collection_standard.jsp";
		var urlstr = "/pagesnew/search/collection_standard_one.jsp?loginName="
				+ lname + "&a001=" + a001;
		/*var ajax = new Ajax();
		var ret = ajax.send(urlstr,param,false);
		if(ret=="true"){
			alert("标准收藏完成，请在收藏夹中查看！");
		}*/
		dojo.xhrPost({
			url : urlstr,
			form : "formtableone",
			handleAs : "text",
			load : function(data) {

				var htmlobj = $.ajax({
					url : "select_standard.jsp?b001=" + a001,
					async : false
				});
				var str = "您已经将《" + htmlobj.responseText + "》收藏了";
				$("div#favorites .modal-body p").empty();
				$("div#favorites .modal-body p").html(str);
				$("#favorites").modal('show');

				//window.open("/pagesnew/search/collectionOk.jsp","","toolbar=0,menubar=0,location=0,status=0,width=480,height=360,scrollbars=0,resizable=0,left=100,top=100");
				//alert("标准收藏完成，请在收藏夹中查看！");
			},
			error : function(data) {
				alert(data);
			},
			timeout : 20000
		});
	}

	//加入推送列表
	function AddPush(lname, a001) {
		if (!lname || lname == "" || lname == "null") {
			alert("您还没有登陆系统，请先登陆系统！");
			return;
		}
		//window.open("","win_add_push","toolbar=0,menubar=0,location=0,status=0,width=480,height=360,scrollbars=0,resizable=0,left=100,top=100");
		//document.addPush.a001.value = a001
		//document.addPush.submit();

		var htmlobj = $.ajax({
			url : "add_push.jsp?a001=" + a001,
			async : false
		});

		$("div#track .modal-body p").empty();
		$("div#track .modal-body p").html(htmlobj.responseText);
		$("#track").modal('show');

	}
</script>
<!--javascript区结束-->
</body>
</html>