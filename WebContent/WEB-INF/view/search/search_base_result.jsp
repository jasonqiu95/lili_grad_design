
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.saas.po.UserInfo"%>
<%@ page import="com.saas.common.Query" %>
<%

String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
UserInfo u=(UserInfo)session.getAttribute("user");
String username="";
if(u!=null)
	username=u.getreal_account();
boolean iscancel=false;
String strSorts="";
boolean upanddown=false;
Query q = (Query)request.getAttribute("Query");
int TotalPage=(int)q.getTotalPage();
System.out.println("total！:"+TotalPage);
long RecordCount=(long)q.getRecordCount();
int PageIndex=(int)q.getPageIndex();
//上次的查询字符串
String queryStr=q.getQueryStr();
Map<String, String> condition =q.getQueryCondition();
System.out.println("queryStr："+queryStr);
//每页显示的标准数
String iPageSize="10";
if(condition.get("iPageSize")!=null)
{
	iPageSize=condition.get("iPageSize");
}
//排序字段 如A104
String orderBy="";
if(condition.get("orderBy")!=null)
{
	orderBy=condition.get("orderBy");
}
//升序(asc)或者倒序(desc)
String ordering="";
if(condition.get("ordering")!=null)
	
{
	ordering=condition.get("ordering");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
<title>中国标准服务网__资源检索__标准检索结果</title>
<link rel="stylesheet" href="asserts/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="asserts/css/design.css" type="text/css"/>
<link rel="stylesheet" href="asserts/css/search.css" type="text/css"/>
<link href="asserts/css/style.css" rel="stylesheet" type="text/css"  />
</head>

<body>
<iframe src="search/header1.jsp" id="auto" height="130" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
 <script type="text/javascript" charset="utf-8">
      function autoHeight(){ 
        var ifr = document.getElementById('auto'); 
        ifr.height = ( ifr.contentDocument && ifr.contentDocument.body.offsetHeight ) ||
                     ( ifr.contentWindow.document.body.scrollHeight ); 
      }
    </script>
<!--主内容区-->
<div class="mainBox">
	<!--面包屑区-->
	<ul class="breadcrumb">
		<li>
			<a href="#">首页</a>
			<span class="divider">/</span>
		</li>
<!--		<li><a href="search_base.jsp">资源检索</a> <span class="divider">/</span></li>-->
		<li><a href="#">标准检索</a> <span class="divider">/</span></li>
		<li class="active">检索结果</li>
	</ul>
	<!--面包屑区结束-->
	<div class="row-fluid">
		<!--左侧搜索区-->
		<div class="span10">
			<div class="input-append">
				<form id="searchForm" name="searchForm" action="${pageContext.request.contextPath}/search/base.htm">
					<input class="span4" id="keyword" name="keyword" size="100" type="text" value="标准号或中英文关键词"  >
					<input type="hidden" name="flag" value="shaixuan">
					<button class="btn btn-primary" type="submit">搜索</button>
					<button class="btn" type="button" onclick="searchOnResult('<%//=direct1%>')">在结果中查找</button>
					<button class="btn" type="button" onclick="javascript:history.back();">返回</button>
<!-- 					<button id="orgfltop" class="btn btn-primary" data-toggle="modal" href="#interClass2"><i class="icon-check"></i> 按品种筛选</button> -->
				</form>
			</div>
		</div>
		<!--左侧搜索区结束-->
	</div> 
	<!--结果列表区-->
	<div class="result_table">
  		<table class="table table-striped">
			<thead>
				<tr>
					<th width="20%">
						<a href="#" onclick="sortReuslt('a100')">标准号
						<%
						if(orderBy.equals("A100"))
						{
							if(ordering.equals("asc"))
							{
						%>
								<i class="icon-arrow-up"></i>
						<%
							}
							else
							{	
						%>
								<i class="icon-arrow-down"></i>	
						<%
							}
						}
						else
						{
						%>
							<i class="icon-arrow-up icon-gray"></i>
						<%
						}
						%>
						</a>
					</th>
					<th width="40%">
						<a href="#" onclick="sortReuslt('cn_superscription')">标准名称
						<%
						if(strSorts != null && strSorts.indexOf("中文题名") >=0){
							if(upanddown){
						%>
								<i class="icon-arrow-up"></i>
						<%
							}else{	
						%>
								<i class="icon-arrow-down"></i>	
						<%
							}
						}else{%>
							<i class="icon-arrow-up icon-gray"></i>
						<%}%></a>
					</th>
					<th width="11%">
						<a href="#" onclick="sortReuslt('publ_date')">发布日期
						<%
						if(strSorts != null && strSorts.indexOf("发布或出版日期") >=0){
							if(upanddown){
						%>
								<i class="icon-arrow-up"></i>
						<%
							}else{	
						%>
								<i class="icon-arrow-down"></i>	
						<%
							}
						}else{%>
							<i class="icon-arrow-up icon-gray"></i>
						<%}%></a>
					</th>
					<th width="11%">
						<a href="#" onclick="sortReuslt('apply_date')">实施日期
						<%
						if(strSorts != null && strSorts.indexOf("实施或试行日期") >=0){
							if(upanddown){
						%>
								<i class="icon-arrow-up"></i>
						<%
							}else{	
						%>
								<i class="icon-arrow-down"></i>	
						<%
							}
						}else{%>
							<i class="icon-arrow-up icon-gray"></i>
						<%}%></a>
					</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
<%
List ResultList=(List)q.getResultList();
if(TotalPage>0)
{
	for(int i=0;i<ResultList.size();i++)
	{
		Map<String,String> item=(Map<String,String>)ResultList.get(i);
		String a000=item.get("记录状态");
		String a001 = item.get("记录标识符");
		String a100 = item.get("文献号");
		String hasElec = item.get("是否存在电子文件");
		String pubDate = item.get("发布或出版日期");
		String applyDate = item.get("实施或试行日期");
		String a298=item.get("中文题名");
		String a302= item.get("英文题名");
		System.out.println("zwtm:"+a298);
%>

				<tr>
					<td>
						<%if("D".equals(a000)){%><font color="red"><%=a100%>&nbsp;&nbsp;<span class="marked">作废</span></font><%}else{out.println(a100);%><span class="marked">现行</span><%}%>
					</td>
					<td>
						<a style="display:block;width:360px;" href="detail/standard_detail.jsp?a001=<%=a001%>" >
							<%=a298%>
							<br />
							<span style="display:block;word-wrap:break-word;color:#08c;"><%=a302%></span>
						</a>
					</td>


					 
					<td><%=pubDate==null?"":pubDate%></td>
					<td><%=applyDate==null?"":applyDate%></td>
					
					<td>
						<a class="btn btn-info"  href="detail/standard_detail.jsp?a001=<%=a001%>"><i class="icon-globe icon-white"></i>详细信息</a>
<!-- 						<a class="btn btn-info" data-toggle="modal" onClick="" ><i class="icon-star icon-white"></i>下  载</a> -->
	 						<a class="btn btn-info" data-toggle="modal" onClick="javascript:AddPush('<%=username%>','<%=a001%>')"><i class="icon-globe icon-white"></i> 跟踪</a>
					</td>
				</tr>
<%	
	}
}
else
{
%>
				<tr>
					<td align="center" colspan="8" bgcolor="#FFFFFF">没有符合条件的记录!</td>
				</tr>
<%
}
%>
			</tbody>
        </table>
		<form name="formSearchfl" id="formSearchfl" method="post" action="<%//=direct2%>">
		<input type="hidden" id="inter_stan_typenum_1" name="en_typenum"  />
		<input type="hidden" id="inter_typenum_1" name="in_stan_typenum" />
		<input type="hidden" id="chin_standard_typenum_1"  name="cn_typenum" />
		<input type="hidden" id="chin_typenum_1" name="chn_standard_typenum" />
		<input type="hidden" id="dbtype_1" name="dbtype" />
		<input type="hidden" id="fl_type" name="fl_type" />
		<input type="hidden" name="location" value="currentChoice" />
		<input type="hidden" name="flag" value="<%//=Second%>" />


<!--         <div class="filterBox"> -->
<!-- 			<a class="filterTitle" data-toggle="collapse" href="#demo">结果筛选</a> -->
<!-- 			<div class="filterBtn collapse" id="demo"> -->
<!-- 				<a id="icsfl" class="" data-toggle="modal" href="#interClass">按国际标准分类</a> -->
<!-- 				<a id="ccsfl" class="" data-toggle="modal" href="#interClass">按中国标准分类</a> -->
<!-- 				<a id="orgfl" class="" data-toggle="modal" href="#interClass2">按品种筛选</a> -->
<!-- 			</div> -->
<!--         </div> -->
<!-- 		</form> -->
<!-- 	</div> -->
	<!--结果列表区结束-->

	<!--翻页区-->
	<%@ include file="pages.jsp"%>
	<!--翻页区结束-->

</div>

<form name="addCar" id="addCar"
	action="/pagesnew/trade/standard_shopingcar_validator.jsp"
	method="post" target="standard_shopingcar">
	<input type="hidden" name="a001" value="" />
</form>
<form name="addPush" action="/pagesnew/search/add_push.jsp"
	method="post" target="win_add_push">
	<input type="hidden" name="a001" value="" />
</form>
<form name="formtableone" id="formtableone"
	action="collection_standard_one.jsp" method="post"
	target="standard_shopingcar">

</form>
<!--主内容区结束-->

<!--弹出层区域-->
<div class="modal hide" id="shopping">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">
		</button>
		<h3>
			操作成功
		</h3>
	</div>
	<div class="modal-body">
		<p>
			您已经将《酒精通用分析方法》放入购物车了。
		</p>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
		<a id="showShoppingCar" href="#" target="_blank"
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
        <a href="#" class="btn" data-dismiss="modal">关闭</a>
        <a id="showShoppingCarUk" href="#" target="_blank" class="btn btn-primary" data-dismiss="modal">去购物车并结算</a>
    </div>
</div>

<div class="modal hide" id="favorites">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal">×</button>
    	<h3>操作成功</h3>
    </div>
    <div class="modal-body">
    	<p></p>
    </div>
    <div class="modal-footer">
    	 <a href="#" class="btn" data-dismiss="modal">继续添加</a>
        <a href="#" class="btn" data-dismiss="modal">关闭</a>
        <a id="showFavorites" href="#" class="btn btn-primary" data-dismiss="modal">查看收藏列表</a>
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
    	<a href="#" class="btn" data-dismiss="modal">继续添加</a>
        <a href="#" class="btn" data-dismiss="modal">关闭</a>
        <!--  -->
        <a  id="showTrack" href="#" target="_parent" class="btn btn-primary" data-dismiss="modal">查看标准跟踪列表</a>
    </div>
</div>

<div class="modal hide" id="interClass"></div>
<div class="modal hide" id="variety"></div>
<div class="modal hide" style="width:340px;" id="interClass2"></div>

<!--弹出层区域结束-->

<%@ include file="/common/foot.jsp"%>

<!--javascript区-->
<script type="text/javascript" src="/pagesnew/js/dojo-1.0.2/dojo/dojo.js" djConfig="isDebug: false, parseOnLoad: true"></script>
<script language="JavaScript" src="../js/search.js"></script>
<script language="JavaScript" src="../js/nv_service.js"></script>

<script type="text/javascript">

var tflag = "1";
var topLink1 = "select_org_en.jsp";
var topLink2 = "";

var topLink3 = "select_org_cn.jsp"

var topLinkFl1 = "select_org_en_fl.jsp";
var topLinkFl2 = "";

var topLinkFl3 = "select_org_cn_fl.jsp"

$(document).ready(function()
{


	$("#icsfl").click(function(){
		htmlobj = $.ajax({url:"select_org_en_fl.jsp",async:false});
		$("#interClass").empty();
		$("#interClass").html(htmlobj.responseText);
		//$("#interClass").show();
	});

	$("#ccsfl").click(function(){
		htmlobj = $.ajax({url:"select_org_cn_fl.jsp",async:false});
		$("#interClass").empty();
		$("#interClass").html(htmlobj.responseText);
		//$("#interClass").show();
	});

	$("#orgfl").click(function(){
		htmlobj = $.ajax({url:"select_org_fl.jsp",async:false});
		$("#interClass").empty();
		$("#interClass").html(htmlobj.responseText);
		//$("#interClass").show();
	});
	
	$("#orgfltop").click(function(){
		htmlobj = $.ajax({url:"select_org_fl.jsp",async:false});
		$("#interClass2").empty();
		$("#interClass2").html(htmlobj.responseText);
		//$("#interClass").show();
	});

	$("#showShoppingCar").click(function(){

	 var istrue=window.open("/pagesnew/trade/standard_shopingcar.jsp");
          if(istrue==null){
             window.location.href="/pagesnew/trade/standard_shopingcar.jsp";
           }
	
	});
	$("#showShoppingCarUk").click(function(){
		window.open("/pagesnew/trade/standard_shopingcar.jsp");
	
	});
	$("#showFavorites").click(function(){
		window.open("/pagesnew/mystandard/standard_restore_list.jsp?type=standard");
	
	});
	
	$("#showTrack").click(function(){
		window.open("${pageContext.request.contextPath }/mystandard/track.htm");
	
	});



	run();//加载页面时启动定时器
	function run() {   
// 	  setInterval(refleshshopcar, "2000");   
	}
	var refleshtimes=0;
	function refleshshopcar() {   
		$.get("/pagesnew/common/reflesh_shopcar_size_top.jsp?reflesh="+refleshtimes++, function(result){
			$("#carsizeinfo").html(result);
		});
	} 
});


function searchOnResult(actionName){
	$("#searchForm").attr("action", actionName);


	$("#searchForm").submit(); 
}

function searchByOrder(actionName){
	actionName = actionName + "&paixu=desc&orderby=literature_id";
	alert(actionName);
	$("#searchForm").attr("action", actionName);
	$("#searchForm").submit(); 
}

var currdaohangid=document.getElementById('menu1');
currdaohangid.className='dropdown active'


function addShopingCar(lname, a001,a302){
	/*
	document.addCar.action = "/pages/nv_trade/standard_shopingcar_validator.jsp";
	document.addCar.method = "post";
	document.addCar.target = "standard_shopingcar";
	document.addCar.a001.value = a001;
	*/

	/*if(!lname || lname=="" || lname=="null"){
		alert("您还没有登陆系统，请先登陆系统！");
		return;
	}*/

	//alert("a001 = " + a001);

	//window.open("","standard_shopingcar","toolbar=0,menubar=0,location=0,status=1,scrollbars=0,resizable=1");
	document.addCar.a001.value = a001;
	document.addCar.submit();

	var htmlobj = $.ajax({url:"/pagesnew/search/select_standard.jsp?b001=" + a001,async:false});
		if( htmlobj.responseText==' '|| htmlobj.responseText=='&nbsp;'){
			htmlobj.responseText=a302;
			alert(",您已经将《" + htmlobj.responseText + "》放入购物车了。");

		}
		 
	$("div#shopping .modal-body p").empty();
	var str = "您已经将《" + htmlobj.responseText + "》放入购物车了。";
	$("div#shopping .modal-body p").html(str);
	$("#shopping").modal('show');

}
	function trim(str){   
	    return str.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'');   
	} 
	function addShopingCarUk(lname,a001,a100){
		var flag = $.ajax({url:"shopingcar_isexist.jsp?a100=" +a100 + "&a="+new Date(),async:false});
		var retStr = trim(flag.responseText);
		if(retStr == "true"){
			document.addCar.a001.value = a001;
			document.addCar.submit();
		
			var htmlobj = $.ajax({url:"select_standard.jsp?b001=" + a001,async:false});
			
				$("div#shopping .modal-body p").empty();
				var str = "您已经将《" + htmlobj.responseText + "》放入购物车了。";
				$("div#shopping .modal-body p").html(str);
				$("#shopping").modal('show');
			
			}else{
				$("div#shoppingUK .modal-body p").empty();
				var str = "该标准已放入购物车，请选择其它标准！";
				$("div#shoppingUK .modal-body p").html(str);
				$("#shoppingUK").modal('show');
		
		}
	
	}


function saveCollectionOneNew(){
	var lname = arguments[0];
	var surl = arguments[1];
	var a001 = arguments[2];
	if(!lname || lname=="" || lname=="null"){
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
	var urlstr = "/pagesnew/search/collection_standard_one.jsp?loginName="+ lname + "&b001="+ a001;
	/*var ajax = new Ajax();
	var ret = ajax.send(urlstr,param,false);
	if(ret=="true"){
		alert("标准收藏完成，请在收藏夹中查看！");
	}*/
	dojo.xhrPost({
		url:urlstr,
		form:"formtableone",
		handleAs:"text",
		load:function(data) {

			var htmlobj = $.ajax({url:"select_standard.jsp?b001=" + a001,async:false});
			var str = "您已经将《" + htmlobj.responseText + "》收藏了";
			$("div#favorites .modal-body p").empty();
			$("div#favorites .modal-body p").html(str);
			$("#favorites").modal('show');

			//window.open("/pagesnew/search/collectionOk.jsp","","toolbar=0,menubar=0,location=0,status=0,width=480,height=360,scrollbars=0,resizable=0,left=100,top=100");
			//alert("标准收藏完成，请在收藏夹中查看！");
		},
		error:function(data) {
			alert(data);
		},
		timeout:20000
	});
}



//加入推送列表
function AddPush(lname, a001){
	if(!lname || lname=="" || lname=="null"){
		alert("您还没有登陆系统，请先登陆系统！");
		return;
	}
	//window.open("","win_add_push","toolbar=0,menubar=0,location=0,status=0,width=480,height=360,scrollbars=0,resizable=0,left=100,top=100");
	//document.addPush.a001.value = a001
	//document.addPush.submit();


	var htmlobj = $.ajax({url:"${pageContext.request.contextPath }/mystandard/tracking.htm?a001=" + a001,async:false});

	$("div#track .modal-body p").empty();
	$("div#track .modal-body p").html(htmlobj.responseText);
	$("#track").modal('show');


}

function submit(q)
{
	window.location.href="${pageContext.request.contextPath}/search/advanced.htm?"+q;
}
//点击排序字段时执行
function sortReuslt(orderby)
{
	var qStr="<%=queryStr%>";
	qStr=setQueryParamValue(qStr,"orderby",orderby);
	submit(qStr);
}
//改变每页大小时跳转
function changePageSize(pageSize,pageIndex)
{
	var qStr="<%=queryStr%>";
	qStr=setQueryParamValue(qStr,"iPageSize",pageSize);
	qStr=setQueryParamValue(qStr,"iPageIndex",pageIndex);
	submit(qStr);
}
//分页跳转
function  page(pageIndex)
{
	//构造查询字符串
	var qStr="<%=queryStr%>";//将jsp字符串转换成js字符串
	qStr=setQueryParamValue(qStr,"iPageIndex",pageIndex);
	submit(qStr);
}
//到第X页
function goTo(pageIndex)
{
	if(isNaN(pageIndex))
		pageIndex=1;
	else
		pageIndex=parseInt(pageIndex);
	if(pageIndex<0)
		pageIndex=1;
	else if(pageIndex><%=TotalPage%>)
		pageIndex=<%=TotalPage%>
	page(pageIndex);
}
//替换URL中查询字符串的参数值的代码
function setQueryParamValue(queryString, key, newValue) 
{  
	var replaced = false; 
	var newParam = key + '=' + newValue;  
	//js支持正向预查但不支持反向预查
	var result = queryString.replace(new RegExp('(^|&)' + key + '=(.*?)(?=$|&)', 'g'), function (s, p1, p2) {  
	  replaced = true;  
	  return p1 + newParam;  
	});  
	return replaced && result || queryString && (queryString + '&' + newParam) || newParam;  
}
</script>
<iframe scrolling="no" name="standard_shopingcar" frameborder="0" src="" border="0" style="display:none"></iframe>
<!--javascript区结束-->
</body>
</html>
