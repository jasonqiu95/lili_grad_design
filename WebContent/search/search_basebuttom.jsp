<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.saas.po.UserInfo"%>
<%@ page import="com.saas.Interface.UseInterface"%>
<%@ page import="cn.gov.cnis.cssn.wssort.*"%>
<%@ include file="/common/global.jsp" %> 
<%@page import="com.saas.po.TenantInfo"%>

<%
String leftMenuType = "SEARCH_BASE";
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
UserInfo u=(UserInfo)session.getAttribute("user");
String tenantname=null;
TenantInfo t=(TenantInfo)session.getAttribute("admin");
if(session.getAttribute("tenantname")==null)
	 tenantname="";
 else
	 tenantname=(String)session.getAttribute("tenantname");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
	<title>中国标准服务网__资源检索</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asserts/css/bootstrap.min.css" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asserts/css/design.css" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asserts/css/search.css" type="text/css"/>

</head>
 
<body>
<!--主内容区-->
<div class="mainBox">
	<!--面包屑区-->
	<ul class="breadcrumb">
		<li>
			<a href="${pageContext.request.contextPath }/index.htm" target="_parent">首页</a>
			<span class="divider">/</span>
		</li>
		<li><a href="search_base.jsp" target="_parent">资源检索</a> <span class="divider">/</span></li>
		<li><a href="search_base.jsp" target="_parent">标准检索</a> <span class="divider">/</span></li>
		<li class="active">查询条件</li>
	</ul>
	<!--面包屑区结束-->
	<div class="row-fluid">
		<!--左侧菜单区-->
		<%@ include file="search_left.jsp" %>
		<!--左侧菜单区结束-->
  
		<!--右侧内容区-->
		<div class="span9 sidecon">
			<ul class="nav nav-tabs" id="myTab">
				<li class="active"><a href="#simple" data-toggle="tab">简单检索</a></li>
				<li><a href="#highRanking" data-toggle="tab">高级检索</a></li>
				<li><a href="#sort" data-toggle="tab">分类检索</a></li>
			</ul>
			<div class="tab-content">
				<!--简单检索-->
				<div class="tab-pane active" id="simple">
					<form class="form-horizontal" action="${pageContext.request.contextPath }/search/base.htm" method="get" name="formSearch1" target="_parent">
						<fieldset>
							<div class="control-group">
								<div class="controls">
									<input type="text" class="input-xlarge" id="keyword" name="keyword">
									<button type="submit" class="btn btn-primary"><i class="icon-search icon-white"></i> 搜 索</button>
									<p class="help-block">您可以在输入框中输入标准名称或标准号，进行模糊搜索。</p>
									<p class="help-block">相关字段用空格分隔。示例："环境"或"GB 24613"或"环境（空格）GB 24613"</p>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				<!--简单检索结束-->
				<!--高级检索-->
				<div class="tab-pane" id="highRanking">
					<form class="form-horizontal" action="${pageContext.request.contextPath }/search/advanced.htm" method="get" name="formSearch" target="_parent">
					<input type="hidden" id="paixu" name="paixu" value="asc">
					<input type="hidden" id="orderby" name="orderby" value="sort_number">
					<fieldset id="fset">
						<div class="control-group">
							<label class="control-label" for="input01">关键词：</label>
							<div class="controls">
								<input type="text" class="input-xlarge" id="keyword_1" name="keyword">
								<p class="help-block">标准名称中相关字段，示例："环境"或"规范"或"环境（空格）规范"</p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input02">标准号：</label>
							<div class="controls">
								<input type="text" class="input-xlarge" id="literature_id" name="literature_id">
								<p class="help-block">示例："GB 24613-2009"或"24613"</p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input02">国际标准分类：</label>
							<div class="controls">
								<input type="text" class="input-xlarge" id="inter_stan_typenum" name="en_typenum" readonly>
								<input name="in_stan_typenum" type="hidden"  value="" id="inter_typenum">
								<button class="btn" data-toggle="modal" href="#interClass" id="choice_en">选择</button>
								<p class="help-block">点击选择要查找标准在国际分类中的类别范围</p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input02">中国标准分类：</label>
							<div class="controls">
								<input type="text" class="input-xlarge" id="chin_standard_typenum"  name="cn_typenum" readonly>
								<input name="chn_standard_typenum" type="hidden"  value="" id="chin_typenum">
								<button class="btn" data-toggle="modal" href="#interClass" id="choice_cn">选择</button>
								<p class="help-block">点击选择要查找标准在中国标准文献分类中的类别范围</p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input02">采用关系：</label>
							<div class="controls">
								<input type="text" class="input-xlarge" id="relation" name="relation">
								<p class="help-block">示例："IEC 61375-2-2007"</p>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="input02">标准品种：</label>
							<div class="controls">
							<%
								 	boolean flag = false;
									StringBuffer sb = new StringBuffer();
									if(session.getAttribute("DRM_FLAG")!=null && !"".equals((String)session.getAttribute("DRM_FLAG")) && !"null".equals((String)session.getAttribute("DRM_FLAG"))){
										flag = true;
										String a104s = (String)session.getAttribute("DRM_FLAG");
										System.out.println(a104s);
										if (a104s != null && a104s.indexOf(",") > 0) {
											String[] a104 = a104s.split(",");
											sb.append("value=");
											for (int i = 0;i < a104.length; i++) {
												if (i > 0 ) {
													sb.append("+");
												}
												sb.append(a104[i]);
											}
										} else {
											sb.append("value="+a104s);
										}
									} 
								%> 
								<input type="text" class="input-xlarge" id="dbtype" name="dbtype"  readonly>
								 <%//if(!flag){%>
								<button class="btn" data-toggle="modal" href="#interClass" id="choice_org">选择</button>
								<p class="help-block">点击选择标准所属的标准化组织</p>
								<%//}%>
							</div>
						</div>
<%
Calendar cal = Calendar.getInstance();
cal.setTime(new java.util.Date());
int year = cal.get(Calendar.YEAR);
%>
						<div class="control-group">
							<label class="control-label">年代号：</label>
							<div class="controls">
								从
								<select class="w100" name="publYear1" id="publYear1">
									<option value="">请选择</option>
									<%for(int i=year; i>=year-30; i--){%>
									<option value="<%=i%>"><%=i%></option>
									<%}%>
								</select> 年
								至
								<select class="w100" name="publYear2" id="publYear2">
									<option value="">请选择</option>
									<%for(int i=year; i>=year-30; i--){%>
									<option value="<%=i%>"><%=i%></option>
									<%}%>
								</select> 年
								<p class="help-block">示例："GB 24613-2009"中2009是年代号</p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">标准状态：</label>
							<div class="controls">
								<select class="w100" name="bzstatus">
									<option value="all">全部</option>
									<option value="xxk" selected>现行</option>
									<option value="zfk">作废</option>
								</select>
								<p class="help-block">标准状态分为：全部即现行+作废、现行、作废，可根据需要选择</p>
							</div>
						</div>
						<div class="form-actions">
							<button type="button"  onclick="getyear()"  id="busearch1" class="btn btn-primary"><i class="icon-search icon-white"></i> 搜 索</button>
							<button type="reset" class="btn">重 置</button>
						</div>
					</fieldset>
					</form>
				</div>
				<!--高级检索结束-->
				<!--分类检索-->

				<div class="tab-pane" id="sort">
					<form class="form-horizontal" action="<%//=direct3%>" method="post" name="formSearchfl">
					<input type="hidden" id="inter_stan_typenum_1" name="en_typenum">
					<input type="hidden" id="inter_typenum_1" name="in_stan_typenum">
					<input type="hidden" id="chin_standard_typenum_1"  name="cn_typenum">
					<input type="hidden" id="chin_typenum_1" name="chn_standard_typenum">
					<input type="hidden" id="dbtype_1" name="dbtype">
					<input type="hidden" id="fl_type" name="fl_type">
					<fieldset>
						<div class="accordion" id="accordion2">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a id="bzpz_fl" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne" >标准品种</a>
								</div>
								<div id="collapseOne" class="accordion-body collapse">
									<div class="accordion-inner">
										<ul class="sortList">
											<li>中国国家标准
												<a id="orgfl" data-toggle="modal" href="#interClass" mylink="select_org_fl.jsp?domain=D_NATIVE&stype=ST_N_SBTS"><img src="${pageContext.request.contextPath}/asserts/img/folder-btn.png" /></a>
												<a href="${pageContext.request.contextPath }/search/advanced.htm?domain=D_NATIVE&stype=ST_N_SBTS" target="_parent" id="zjfltype" domain="D_NATIVE" stype="ST_N_SBTS"><img src="${pageContext.request.contextPath}/asserts/img/magnifier-btn.png" /></a>
											</li>
											<li>中国行业标准
												<a id="orgfl" data-toggle="modal" href="#interClass" mylink="select_org_fl.jsp?domain=D_NATIVE&stype=ST_N_CSIC"><img src="${pageContext.request.contextPath}/asserts/img/folder-btn.png" /></a>
												<a href="${pageContext.request.contextPath }/search/advanced.htm?domain=D_NATIVE&stype=ST_N_CSIC" target="_parent" domain="D_NATIVE" stype="ST_N_CSIC"><img src="${pageContext.request.contextPath}/asserts/img/magnifier-btn.png" /></a>
											</li>
											<li>中国地方标准
												<a id="orgfl" data-toggle="modal" href="#interClass" mylink="select_org_fl.jsp?domain=D_NATIVE&stype=ST_N_DB"><img src="${pageContext.request.contextPath}/asserts/img/folder-btn.png" /></a>
												<a href="${pageContext.request.contextPath }/search/advanced.htm?domain=D_NATIVE&stype=ST_N_DB" id="zjfltype" target="_parent" domain="D_NATIVE" stype="ST_N_DB"><img src="${pageContext.request.contextPath}/asserts/img/magnifier-btn.png" /></a>
											</li>
											<li>国外国家标准
												<a id="orgfl" data-toggle="modal" href="#interClass" mylink="select_org_fl.jsp?domain=D_FOREIGN&stype=ST_F_NATIONAL"><img src="${pageContext.request.contextPath}/asserts/img/folder-btn.png" /></a>
												<a href="${pageContext.request.contextPath }/search/advanced.htm?domain=D_FOREIGN&stype=ST_F_NATIONAL" target="_parent" domain="D_FOREIGN" stype="ST_F_NATIONAL"><img src="${pageContext.request.contextPath}/asserts/img/magnifier-btn.png" /></a>
											</li>
											<li>国外学协会标准
												<a id="orgfl" data-toggle="modal" href="#interClass" mylink="select_org_fl.jsp?domain=D_FOREIGN&stype=ST_F_INSTITUTE"><img src="${pageContext.request.contextPath}/asserts/img/folder-btn.png" /></a>
												<a href="${pageContext.request.contextPath }/search/advanced.htm?domain=D_FOREIGN&stype=ST_F_INSTITUTE" target="_parent" id="zjfltype" domain="D_FOREIGN" stype="ST_F_INSTITUTE"><img src="${pageContext.request.contextPath}/asserts/img/magnifier-btn.png" /></a>
											</li>
											<li>国际标准
												<a id="orgfl"  data-toggle="modal" href="#interClass" mylink="select_org_fl.jsp?domain=D_FOREIGN&stype=ST_F_INTER"><img src="${pageContext.request.contextPath}/asserts/img/folder-btn.png" /></a>
												<a href="${pageContext.request.contextPath }/search/advanced.htm?domain=D_FOREIGN&stype=ST_F_INTER" target="_parent" id="zjfltype" domain="D_FOREIGN" stype="ST_F_INTER"><img src="${pageContext.request.contextPath}/asserts/img/magnifier-btn.png" /></a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">国际标准分类</a>
								</div>
								<div id="collapseTwo" class="accordion-body collapse in">
									<div class="accordion-inner">
										<%@ include file="incl_basefl_en.jsp" %>
										<%-- <jsp:include page="incl_basefl_en.jsp"/> --%>
									</div>
								</div>
							</div>
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">中国标准分类</a>
								</div>
								<div id="collapseThree" class="accordion-body collapse">
									<div class="accordion-inner">
										<%@ include file="incl_basefl_cn.jsp" %>
 										<%-- <jsp:include page="/search/incl_basefl_cn.jsp"/> --%>
									</div>
								</div>
							</div>
						</div>
					</fieldset>
					</form>
				</div>
				<!--分类检索结束-->
			</div>
			<form class="form-horizontal" action="<%//=direct4%>" method="post" name="formSearchfl2">
				<input type="hidden" id="fl_type" name="fl_type">
				<input type="hidden" id="domain" name="domain">
				<input type="hidden" id="stype" name="stype">
				<input type="hidden" id="grflagA" name="grflagA">
			</form>
			<!--提示区2-->
			<div class="alert">
				<button class="close" data-dismiss="alert">×</button>
				如果您查找的是美国CFR联盟法规、欧盟Eur-Lex法规、国内技术法规、日本技术法规，请点击 <a href="search_rule.jsp">技术法规数据库</a>
			</div>
			<!--提示区2结束-->
		</div>
		<!--右侧内容区结束-->
	</div>  
</div>
<!--主内容区结束-->


<!--弹出层区域-->
<div class="modal hide" id="interClass"></div>


<div class="modal hide" id="favorites">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal">×</button>
    	<h3>验证检索条件</h3>
    </div>
    <div class="modal-body">
    	<p>专家检索条件不能执行，请重新设置。</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">关闭</a>
    </div>
</div>
<div class="modal hide" id="yearerror">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal">×</button>
    	<h3>高级检索</h3>
    </div>
    <div class="modal-body">
    	<p> 年代号的起始年 应该比终止年小 请您重新选择</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">关闭</a>
    </div>
</div>


<div class="modal hide" id="issueUnit">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal">×</button>
    	<!--h3>发布单位</h3-->
		<h5>
			<a href="#">全部</a> &nbsp; &nbsp; 
			<a href="#">国内</a> &nbsp; 
			<a href="#">国内-国家</a> &nbsp; 
			<a href="#">国内-地方</a> &nbsp; 
			<a href="#">国内-行业</a> &nbsp; &nbsp; <!--br/>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;-->
			<a href="#">国外</a> &nbsp; 
			<a href="#">国外-国际</a> &nbsp; 
			<a href="#">国外-国家</a> &nbsp; 
			<a href="#">国外-学协会</a>
		</h5>
    </div>
    <div class="modal-body">
    	<ul class="sortList">
              <li><input type="checkbox" id="fb01" /> <label for="fb01">A  综合局</label></li>
              <li><input type="checkbox" id="fb02" /> <label for="fb02">B  农业局、林业局</label></li>
              <li><input type="checkbox" id="fb03" /> <label for="fb03">C  卫生局</label></li>
              <li><input type="checkbox" id="fb04" /> <label for="fb04">D  矿业局</label></li>
              <li><input type="checkbox" id="fb05" /> <label for="fb05">E  石油局</label></li>
              <li><input type="checkbox" id="fb06" /> <label for="fb06">F  能源核技术研究院</label></li>
              <li><input type="checkbox" id="fb07" /> <label for="fb07">G  化工局</label></li>
        </ul>
    </div>
    <div class="modal-footer">
        <div class="allBox"><input type="checkbox" id="all03" /> <label for="all03">全选</label></div>
        <a href="#" class="btn btn-primary" data-dismiss="modal">确定</a>
    </div>
</div>
<!--弹出层区域结束-->
<%@ include file="/common/foot.jsp"%>

<script type="text/javascript"> 
function getyear(){
var year1=document.getElementById('publYear1').value;
var year2=document.getElementById('publYear2').value;
 
 
if(year1!=""&&year2!=""){
	if(year1>year2){
			$("#yearerror").modal({show:true});
		return;
		 
	}
} 
	 document.formSearch.submit();
 

}



var tflag = "1";
var topLink1 = "select_org_en.jsp";
var topLink2 = "";

var topLink3 = "select_org_cn.jsp"


var topLinkFl1 = "select_org_en_fl.jsp";
var topLinkFl2 = "";

var topLinkFl3 = "select_org_cn_fl.jsp"


$(document).ready(function(){


    $("#rolling").Scroll({line:1,speed:500,timer:1000});

	$("#focusSearch").focus(function(){
		$(this).addClass("focus");
	});
	$("#focusSearch").blur(function(){
		$(this).removeClass("focus");
	});	
	$("#focusSearch").placeholder();


	$("#choice_en").click(function(){
		htmlobj = $.ajax({url:"select_org_en.jsp",async:false});
		$("#interClass").empty();
		$("#interClass").html(htmlobj.responseText);
		//$("#interClass").show();
	});

	$("#choice_cn").click(function(){
		htmlobj = $.ajax({url:"select_org_cn.jsp",async:false});
		$("#interClass").empty();
		$("#interClass").html(htmlobj.responseText);
		//$("#interClass").show();
	});


	$("#choice_org").click(function(){
		htmlobj = $.ajax({url:"select_org.jsp",async:false});
		$("#interClass").empty();
		$("#interClass").html(htmlobj.responseText);
		//$("#interClass").show();
	});



	$("fieldset#fset input").keypress(function(event){
		if(event.keyCode==13){
			//alert("回车");
			$("#choice_cn").attr("disabled",true);
			$("#choice_en").attr("disabled",true);
			$("#choice_org").attr("disabled",true);

			//$("#literature_id").focus();

			//$("#choice_cn").disabled = false;
			//$("#choice_en").disabled = false;
			//$("#choice_org").disabled = false;
		} 

		
		//$("#interClass").show();
	});


	$("a[id^=orgfl]").each(function(){
		$(this).click(function(e){

			var str = $(this).attr("mylink");

			htmlobj = $.ajax({url:str,async:false});

			$("#interClass").html(htmlobj.responseText);
			
			
			if($("#interClass").hasClass("modal hide")){
				$("#interClass").removeClass("modal hide");
				$("#interClass").addClass("modal");
			}

			if($("#interClass").hasClass("modal")){
				$("#interClass").css("display", "block");
			}
		});
	});


	$("a[id^=enorgfl]").each(function(){
		$(this).click(function(e){

			var str = $(this).attr("mylink");
			var flag = $(this).attr("flag");
			topLinkFl2 = str;

			htmlobj = $.ajax({url:str,async:false});


			$("#interClass").html(htmlobj.responseText);
			
			
			if($("#interClass").hasClass("modal hide")){
				$("#interClass").removeClass("modal hide");
				$("#interClass").addClass("modal");
			}
			if($("#interClass").hasClass("modal")){
				$("#interClass").css("display", "block");
			}
			
		});
	});

	$("a[id^=cnorgfl]").each(function(){
		$(this).click(function(e){

			var str = $(this).attr("mylink");
			var flag = $(this).attr("flag");
			topLinkFl2 = str;

			htmlobj = $.ajax({url:str,async:false});

			$("#interClass").html(htmlobj.responseText);
			
			if($("#interClass").hasClass("modal hide")){
				$("#interClass").removeClass("modal hide");
				$("#interClass").addClass("modal");
			}
			if($("#interClass").hasClass("modal")){
				$("#interClass").css("display", "block");
			}
		});
	});

	$("a[id^=zjfltype]").each(function(){
		$(this).click(function(e){
//alert("aaaaaaaaa");
			var domain = $(this).attr("domain");
			var stype = $(this).attr("stype");

//alert(domain);
//alert(stype);

			document.formSearchfl2.fl_type.value = "1";
			document.formSearchfl2.domain.value = domain;
			document.formSearchfl2.stype.value = stype;
			
			document.formSearchfl2.submit();
		});
	});


	$("a[id^=zjflsearch]").each(function(){
		$(this).click(function(e){
//alert("aaaaaaaaa");
			var grflagA = $(this).attr("grflagA");
			var fl_type = $(this).attr("fl_type");

//alert(fl_type);

			document.formSearchfl2.fl_type.value = fl_type;
			document.formSearchfl2.grflagA.value = grflagA;
			
			document.formSearchfl2.submit();
		});
	});


		$("#accordion1").find("input[id^=ckbox_]").each(function(e){
			$(this).click(function(e){

				var val = $(this).val();
				
				var valName = $(this).attr("valueName");

				if($(this).attr("checked") == "checked"){
				
					//显示选中的种类
					var content =  '<div class="alert alert-info" id="' + val + '">' + valName + "</div>";
					//<button class="close" data-dismiss="alert">×</button>
					//newdiv = document.createElement(content);
					
					$("#choice_show").append(content);

					//设置hidden的值
					var cval = $("#choiced_bz").val();
					val = cval + val + ";";
					$("#choiced_bz").val(val);
				}else{
					//调整隐藏的hidden值
					var cval = $("#choiced_bz").val();
					cval = cval.replace(val + ";", "");
					$("#choiced_bz").val(cval)
					
					//删除显示块
					$("#" + val).remove();
				}
			});

		});

/*

	//alert($("button.close").size());
	$("button.close").each(function(e){
		$(this).click(function(e){
			
			var id = $(this).attr("id");

			//$("#div_condition_show p").find("span[id=span_andor_"+sortnum + "]").size()>0

			alert($("#accordion1").find("input[value^=" + id + "]").size());
		
		});
	});
*/	





	var cloneSortNum = 4;
	var conditionShow ;
	var condition;
	$("i.icon-plus-sign").each(function(){
		$(this).click(function(e){
			/*
			if(cloneSortNum > 9){
				alert("条件过多，超过限额！");
				return;
			}
			*/
			var obj;
			
			if($(this).parents(".control-group").attr("id") == "pannel_1"){
				obj = $("#pannel_none").clone(true);
				obj.attr("style", "display:block");
			}else{
				obj = $(this).parents(".control-group").clone(true);
			}

			

			$(obj).find("select[id^=select_andor_]").last().attr("id","select_andor_" + cloneSortNum);
			$(obj).find("select[id^=select_andor_]").last().attr("name","select_andor_" + cloneSortNum);

			$(obj).find("select[id^=select_field_]").last().attr("id","select_field_" + cloneSortNum);
			$(obj).find("select[id^=select_field_]").last().attr("name","select_field_" + cloneSortNum);

			$(obj).find("input[id^=left_bracket_]").last().attr("id","left_bracket_" + cloneSortNum);
			$(obj).find("input[id^=h_left_bracket_]").last().attr("id","h_left_bracket_" + cloneSortNum);
			$(obj).find("input[id^=h_left_bracket_]").last().attr("name","h_left_bracket_" + cloneSortNum);
			$(obj).find("input[id^=h_left_bracket_]").last().val("0");

			$(obj).find("input[id^=right_bracket_]").last().attr("id","right_bracket_" + cloneSortNum);
			$(obj).find("input[id^=h_right_bracket_]").last().attr("id","h_right_bracket_" + cloneSortNum);
			$(obj).find("input[id^=h_right_bracket_]").last().attr("name","h_right_bracket_" + cloneSortNum);
			$(obj).find("input[id^=h_right_bracket_]").last().val("0");

			$(obj).find("input[id^=input_keyword_]").last().attr("id","input_keyword_" + cloneSortNum);
			$(obj).find("input[id^=input_keyword_]").last().attr("name","input_keyword_" + cloneSortNum);

			$(obj).find("select[id^=select_jqmh_]").last().attr("id","select_jqmh_" + cloneSortNum);
			$(obj).find("select[id^=select_jqmh_]").last().attr("name","select_jqmh_" + cloneSortNum);

			$(obj).attr({"id":"pannel_" + cloneSortNum});

			$("#searchCondition").append(obj);

			$("#cloneSortNum").val(cloneSortNum);

			cloneSortNum++;

			//alert(obj.attr("id"));
		});

	});

	$("i.icon-minus-sign").each(function(){
		$(this).click(function(e){
			var id = $(this).parents(".control-group").attr("id");

			var sortnum = id.substring(id.lastIndexOf("_") +1, id.length);

			$(this).parents(".control-group").remove();

			$("#div_condition_show p").find("span[id$=_"+sortnum + "]").each(function(){
				$(this).remove();
			});
		});

	});





	//选择字段 生成的span id = span_field_i
	//判断是否有，如果有，则更新
	//如没有，查找是否有"("，有，加入到"("后面，
	//如果没有"("，判断是否有 keyword，如果有，加到前面，
	//如没有，判断是否有 "与/或"，有加到后面，
	//没有，判断是否有同级的，有加到最前，没有，直接加

	$("select[id^=select_field_]").each(function(){
		$(this).click(function(e){

			//得到选择的字段的value和text
			var temp = $(this).find('option:selected').text();
			var temp1 =  $(this).val();
			//alert(temp + "   " +  temp1);

			//取得排序号
			var id = $(this).attr("id");
			var sortnum = id.substring(id.lastIndexOf("_") +1, id.length);
			
			//取得生成的span
			var obj = $("#span_field_" + sortnum );
			
			updateFieldSpan(temp, sortnum, obj);
		});

	});


	//输入查询条件   生成的span id = span_keyword_i
	$("input[id^=input_keyword_]").each(function(){
		$(this).blur(function(e){
			
			//得到输入字段的值
			var temp =  $(this).val();

			if(temp == ""){
				return;
			}else{

				var id = $(this).attr("id");
				var sortnum = id.substring(id.lastIndexOf("_") +1, id.length);
				var obj = $("#span_keyword_" + sortnum );

				if(obj.length > 0){
					$(obj).text(temp);
				}else{
					var str = "<span id='span_keyword_" + sortnum + "'>" + temp + "</span>";
					
					if($("#div_condition_show p").find("span[id=span_field_"+sortnum + "]")>0){
						$("#span_field_"+sortnum).after(str)
					}else{
						var field = $("#select_field_"+sortnum).find('option:selected').text();
						
						updateAndorSpan($("#select_andor_" + sortnum).find('option:selected').text(), sortnum, $("#span_andor_"+sortnum));
						updateFieldSpan(field, sortnum, $("#span_field_"+sortnum));


						$("#span_field_"+sortnum).after(str);

						updateJqmhSpan($("#select_jqmh_" + sortnum).find('option:selected').text(), sortnum, $("#span_jqmh_"+sortnum));
					}
				}
			}

			var browser = navigator.userAgent;
			if (browser.indexOf('MSIE') != -1){  
				if('professionalSearch' == document.activeElement.id )  
				{  
					document.specForm.submit();
					return false;
				}  
			}else if(browser.indexOf('Firefox') != -1){
				if('professionalSearch' == e.originalEvent.explicitOriginalTarget.id){
					document.specForm.submit();
					return false;
				}
			}else{
				if($("#professionalSearch").is(":active")){
					document.specForm.submit();
					return false;
				}
			} 
		});

	});


	$("input[id^=input_keyword_]").each(function(){
		$(this).keypress(function(e){
			var keycode = e.which;  
			//取得排序号
			var id = $(this).attr("id");
			var sortnum = id.substring(id.lastIndexOf("_") +1, id.length);

			if (keycode == 13) {
				$("#select_jqmh_"+sortnum).focus();
  			}  

		});
	});
	
	
	
	$("select[id^=select_andor_]").each(function(){
		$(this).click(function(e){

			//得到选择的字段的value和text
			var temp = $(this).find('option:selected').text();
			var temp1 =  $(this).val();

			//取得排序号
			var id = $(this).attr("id");
			var sortnum = id.substring(id.lastIndexOf("_") +1, id.length);
			
			//取得生成的span
			var obj = $("#span_andor_" + sortnum );

			updateAndorSpan(temp, sortnum, obj);
		});

	});


	$("select[id^=select_jqmh_]").each(function(){
		$(this).click(function(e){

			//得到选择的字段的value和text
			var temp = $(this).find('option:selected').text();
			var temp1 =  $(this).val();

			//取得排序号
			var id = $(this).attr("id");
			var sortnum = id.substring(id.lastIndexOf("_") +1, id.length);

			//取得生成的span
			var obj = $("#span_jqmh_" + sortnum );

			updateJqmhSpan(temp, sortnum, obj);
		});

	});

	$("input[id^=left_bracket_]").each(function(){
		$(this).click(function(e){

			//得到选择的字段的value和text
			var temp = $(this).find('option:selected').text();
			var temp1 =  $(this).val();

			//取得排序号
			var id = $(this).attr("id");
			var sortnum = id.substring(id.lastIndexOf("_") +1, id.length);
			
			//取得生成的span
			var obj = $("#span_left_bracket_" + sortnum );

			updateLeftBracketSpan(sortnum, obj);
		});

	});

	$("input[id^=right_bracket_]").each(function(){
		$(this).click(function(e){

			//得到选择的字段的value和text
			var temp = $(this).find('option:selected').text();
			var temp1 =  $(this).val();

			//取得排序号
			var id = $(this).attr("id");
			var sortnum = id.substring(id.lastIndexOf("_") +1, id.length);
			
			//取得生成的span
			var obj = $("#span_right_bracket_" + sortnum );

			updateRightBracketSpan(sortnum, obj);
		});

	});

function updateRightBracketSpan(sortnum, obj){

	if(obj.length > 0){
		$(obj).remove();
		$("#h_right_bracket_"+sortnum).val("0");
	}else{
		var str = "<span id='span_right_bracket_" + sortnum + "'>&nbsp;&nbsp;）</span>";

		if($("#div_condition_show p").find("span[id=span_jqmh_"+sortnum + "]").size()>0){
			$("#div_condition_show p").find("span[id=span_jqmh_"+sortnum + "]").after(str);
		}else if($("#div_condition_show p").find("span[id$=_"+sortnum + "]").size()>0){
			$("#div_condition_show p").find("span[id$=_"+sortnum + "]").last().after(str);
		}else{
			$("#div_condition_show p").append(str);
		}
		$("#h_right_bracket_"+sortnum).val("1");

	}
//alert($("#h_right_bracket_"+sortnum).val());
}


function updateLeftBracketSpan(sortnum, obj){

	if(obj.length > 0){
		$(obj).remove();
		$("#h_left_bracket_"+sortnum).val("0");
	}else{
		var str = "<span id='span_left_bracket_" + sortnum + "'>（&nbsp;&nbsp;</span>";

		if($("#div_condition_show p").find("span[id=span_andor_"+sortnum + "]").size()>0){
			$("#div_condition_show p").find("span[id=span_andor_"+sortnum + "]").after(str);
		}else if($("#div_condition_show p").find("span[id$=_"+sortnum + "]").size()>0){
			$("#div_condition_show p").find("span[id$=_"+sortnum + "]").first().before(str);
		}else{
			$("#div_condition_show p").append(str);
		}
		$("#h_left_bracket_"+sortnum).val("1");

	}
//alert($("#h_left_bracket_"+sortnum).val());
}


function updateAndorSpan(txt, sortnum, obj){

	var len = $("#div_condition_show p span").size();

	if(sortnum != "1"){
		if(obj.length > 0){
			$(obj).text(txt + " ");
		}else{
			var str = "<span id='span_andor_" + sortnum + "'> " + txt + "&nbsp;&nbsp;</span>";
			if(len > 0){
				if($("#div_condition_show p").find("span[id$=_"+sortnum + "]").size() > 0){

					$("#div_condition_show p").find("span[id$=_"+sortnum + "]").first().before(str);
				}else{

					$("#div_condition_show p").append(str);
				}
			}
		}
	}
}

function updateJqmhSpan(txt, sortnum, obj){

	if(obj.length > 0){
		$(obj).text(" + " + txt);
	}else{
		var str = "<span id='span_jqmh_" + sortnum + "'> + " + txt + "” </span>";

		if($("#div_condition_show p").find("span[id=span_keyword_"+sortnum + "]").size()>0){
			$("#div_condition_show p").find("span[id=span_keyword_"+sortnum + "]").after(str);
		
		}else if($("#div_condition_show p").find("span[id=span_right_bracket_"+sortnum + "]").size()>0){
			$("#div_condition_show p").find("span[id=span_right_bracket_"+sortnum + "]").before(str);

		}else if($("#div_condition_show p").find("span[id$=_"+sortnum + "]").size() > 0){
			$("#div_condition_show p").find("span[id$=_"+sortnum + "]").last().after(str);
		}else if(sortnum == "1"){
			$("#div_condition_show p").find("span").first().before(str);
		}else{
			$("#div_condition_show p").append(str);
		}
	}

}


function updateFieldSpan(txt, sortnum, obj){


	//判断生成的span是否存在
	if(obj.length > 0){

		//如果存在，修改
		$(obj).text(txt + "：");
		
	
	}else{
		
		var str = "<span id='span_field_" + sortnum + "'>“" + txt + "：</span>";

		//判断是否是第一个
		if(sortnum != "1"){
			//查找是否有"(", 如果有，将选择的字段文本加到 "("连接词后面
			if($("#div_condition_show p").find("span[id=span_left_bracket_"+sortnum + "]").size()>0){

				$("#div_condition_show p").find("span[id=span_left_bracket_"+sortnum + "]").after(str);

				//如果没有"("，判断是否有 keyword，如果有，加到前面，
			}else if($("#div_condition_show p").find("span[id=span_keyword_"+sortnum + "]").size()>0){

					$("#div_condition_show p").find("span[id=span_keyword_"+sortnum + "]").before(str);

			//如果没有"keyword"，判断是否有 "与/或"，如果有，有加到后面，
			}else if($("#div_condition_show p").find("span[id=span_andor_"+sortnum + "]").size()>0){

				$("#div_condition_show p").find("span[id=span_andor_"+sortnum + "]").after(str);

				//没有，查找是否有同级别的span，有就加载到最前面，没有就直接加上
			}else if($("#div_condition_show p").find("span[id$=_"+sortnum + "]").size() > 0){

				$("#div_condition_show p").find("span[id$=_"+sortnum + "]").first().before(str);

			}else{
					$("#div_condition_show p").append(str);
			}
		}else{
			var len = $("#div_condition_show p span").size();

			if(len > 0){
				//$("#div_condition_show p span").eq(0).before(str);
				
				var nid = $("#div_condition_show p span").eq(0).attr("id");
				var snum = nid.substring(nid.lastIndexOf("_") +1, nid.length);

				if($("#span_andor_"+snum).size()<=0){
					var s = $("#select_andor_"+snum).find('option:selected').text();

					var t = "<span id='span_andor_" + snum + "'> " + s + "&nbsp;&nbsp;</span>";

					$("#div_condition_show p").find("span[id$=_"+snum + "]").first().before(t);
				}
				$("#div_condition_show p span").eq(0).before(str);
				
			}else{
				$("#div_condition_show p").append(str);
			}
		}
	}
}








});



var currdaohangid=document.getElementById('menu1');
currdaohangid.className='dropdown active'

</script>

<!--javascript区结束-->
</body>
</html>