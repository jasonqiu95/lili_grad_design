<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.saas.po.UserInfo"%>
<%@ page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page import="com.estarcom.cnis.cssn.customersystem.user.Operator" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	UserInfo u=(UserInfo)session.getAttribute("user");
%>  
<base href="<%=basePath%>">
<%
	UserInfo user=(UserInfo)session.getAttribute("user");
	if(user==null)
	{
		String url = "login.htm";
		ModelAndView mav = new ModelAndView(url);
	}
%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.Date"%>

<%@ page import="com.estarcom.cnis.cssn.customersystem.user.Operator"%>

<%@ page import="com.estarcom.cnis.cssn.salesystem.trade.TradeHelp"%>

<%@ page

	import="com.estarcom.cnis.cssn.customersystem.infopush.service.PushHelp"%>

<%@ page

	import="com.estarcom.cnis.cssn.customersystem.infopush.service.PushDelegate"%>

<%@ page import="com.estarcom.xbean.JspHelp"%>

<%@ page import="com.estarcom.xbean.JspParameter"%>

<%@ page import="com.estarcom.xbean.sql.CachedRowSet"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.saas.Interface.UseInterface"%>
<%@ page import="cn.gov.cnis.cssn.wssort.*"%>

<%@ page

	import="com.estarcom.cnis.cssn.customersystem.ImportDataResultBean"%>

<%@ page import="com.estarcom.cnis.cssn.customersystem.NVCustomerQuery"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>

		<meta http-equiv="X-UA-Compatible" content="IE=IE9" />

		

		<title>欢迎来到中国标准服务馆__用户中心__标准跟踪__定制标准跟踪</title>

		<link rel="stylesheet" href="asserts/css/bootstrap.min.css"

			type="text/css" />

		<link rel="stylesheet" href="asserts/css/design.css" type="text/css" />

		<link rel="stylesheet" href="asserts/css/standard.css"

			type="text/css" />

			<link rel="stylesheet" href="asserts/css/search.css" type="text/css"/>

	</head>



	<body>
		<%





			String menu = request.getParameter("menu") == null ? "" : request

					.getParameter("menu");

System.out.println("#### menu=" + menu);

			String direct1 = JspHelp.getURL("nvsearch", "search_base",

					"SevSimpleSearch");



			String warning = request.getParameter("warning") == null ? "0"

					: request.getParameter("warning").toString();

			String errshow = request.getParameter("errshow") == null ? "0"

					: request.getParameter("errshow").toString();

			String tab = request.getParameter("tab") == null ? "0" : request

					.getParameter("tab").toString();

			String sortcolumn = request.getParameter("sortcolumn") == null ? "subscribeDate"

					: request.getParameter("sortcolumn").toString();
			Operator operator = new Operator();
			operator.setLoginName("541726449@qq.com");
			String loginName = operator.getLoginName() == null ? "" : operator.getLoginName().toString();
			UseInterface get = new UseInterface();
			StandardTracking res1[]=get.getUserStandardTracking(loginName);
			
			int totalLimit=0;

			int itemCount=0;
			
			int index = 0;

			JspParameter mJspParam = null;

			String PageURL = null;

			int iPreviousPage;

			int iNextPage;

			int iPageIndex = 1;

			int iPageSize = 10;



			if (iPageSize <= 0)

				iPageSize = 10;

			if (request.getParameter("pi") != null) {

				iPageIndex = Integer.parseInt(request.getParameter("pi"));

			}



/* 			ResultSet rs = help.find_subscribe_item(loginName, sortcolumn,

					iPageIndex, iPageSize); */

/* 			int iTotalPage = JspHelp.getTotalPage(iPageSize,

					((CachedRowSet) rs).size()); */
			
			int size = res1.length;
			int iTotalPage = size;
			if (iPageIndex > iTotalPage)

				iPageIndex = iTotalPage;

			if (iPageIndex < 0)

				iPageIndex = 1;

			index = size - (iPageIndex - 1) * iPageSize;

			if (index > iPageSize)

				index = iPageSize;

		%>

		<!--主内容区-->
		<div class="page-header">
 	 <h1>Example page header <small>Subtext for header</small></h1>
		</div>

		<div class="mainBox">

			<!--面包屑区-->

			<ul class="breadcrumb">

					<a>尊敬的<%=u.getAccount()%>用户,欢迎您使用文献服务</a><li><a href="unlogin1.htm"> 注销</a></li>
<!-- 					<span class="divider">/</span>
 -->

				<li class="active">

					定制标准跟踪

				</li>

			</ul>

			<!--面包屑区结束-->

			<div class="row-fluid">

				<!--左侧菜单区-->

				<%@ include file="mystandard_left.jsp"%>

				<!--左侧菜单区结束-->



				<!--右侧内容区-->

				<div class="span9 sidecon">

					<ul class="nav nav-tabs" id="myTab">

						<li class="active">

							<a href="#Inventory" data-toggle="tab">按标准清单定制</a>

						</li>

						<li>

							<a href="#buyHistory" data-toggle="tab">按购买历史定制</a>

						</li>

					</ul>

					<div class="tab-content">

						<!--按标准清单定制-->

						<div class="tab-pane active" id="Inventory">

							<div class="row-fluid mt10">

								<div class="span6">

									<div class="input-append">

										<form name="serFrm" action="<%=direct1%>" method="post"

											name="formSearch1">

											<input class="span8" id="keyword" name="keyword" size="46"

												type="text" placeholder="您可以通过检索添加跟踪标准">

											&nbsp;&nbsp;


											<button class="btn btn-primary" type="submit">

												搜索

											</button>

										</form>

									</div>

								</div>

								<div class="fleft">

									<div class="dropdown">

										<a class="btn" data-toggle="dropdown">批量导入清单条目 <span

											class="caret"></span>

										</a>

										<ul class="dropdown-menu" id="dropdown-menu">

											<li>

												<a data-toggle="modal" href="#multiCriteria">输入多条标准号</a>

											</li>

											<li>

												<a data-toggle="modal" href="#Import">导入txt文件</a>

											</li>

											<li>

												<a data-toggle="modal" href="#processingFailed">处理导入失败列表</a>

											</li>

										</ul>

									</div>

								</div>

							</div>

							<%

										ImportDataResultBean bean = (ImportDataResultBean) request

										.getSession().getAttribute("err");

								ArrayList errlist = bean != null ? bean.getErrors() : null;

								ArrayList notOnly = bean != null ? bean.getNotOnly() : null;

								ArrayList existent = bean != null ? bean.getExistent() : null;

								ArrayList repeat = bean != null ? bean.getRepeat() : null;

								String imcon = bean != null ? bean.getItemCon() : null;

								String con = bean != null ? bean.getCon() : null;

								String other = bean != null ? bean.getOtherError() : null;

							%>

							<div class="info_table hide" id="failList">

								<div class="infooperatetableTop">

									<%

									if (errlist != null && errlist.size() > 0) {

									%>

									您有

									<span class="tred03"><%=errlist.size()%>

									</span>条 导入失败的标准号

									<a href="javascript:void(0)"

										onClick="return sel_chk_all('err_id');return false"

										class="btn">全选</a>

									<a href="javascript:void(0)" onClick="del_errlist();"

										class="btn">删除</a>

									<%

									}

									%>

									<span class="tred03">&nbsp;</span><a

										href="standardTracking.jsp?menu=dzbzgz" class="backBt">返回标准跟踪列表页</a>

									<a href="nv_customer_import_txt_submit.jsp" class="btn">确认提交</a>

								</div>

								<table class="table">

									<thead>

										<tr>

											<th style="width:26px">

												选择

											</th>

											<th>

												原标准号

											</th>

											<th style="width:126px">

												操作
											</th>

										</tr>

									</thead>

									<tbody>

										<form name="errReimportFrm"

											action="nv_customer_import_txt_save.jsp" method="post">

											<input name="old_stan" value="" type="hidden">

											<input name="new_stan" value="" type="hidden">

											

										</form>

										<form name="errDelFrm" action="nv_customer_import_txt_del.jsp"

											method="post">

											<%

													if (errlist != null && errlist.size() > 0) {

													for (int i = 0; i < errlist.size(); i++) {

											%>

										

										<tr>

											<td>

												<input name="err_id" id="err_id_<%=i%>"

													value="<%=errlist.get(i).toString()%>" type="checkbox" />

											</td>

											<td>

												<input type="text" id="err_stan_<%=i%>"

													name="err_stan_<%=i%>"

													value="<%=errlist.get(i).toString()%>">

											</td>

											<td>

												<a href="javascript:void(0)"

													onClick="err_reimport('<%=errlist.get(i).toString()%>','err_stan_<%=i%>');">重试</a>

												&nbsp;

												<a href="javascript:void(0)"

													onClick="del_errlist('err_id_<%=i%>');">删除</a> &nbsp;

												<a

													href="<%=direct1%>&keyword=<%=errlist.get(i).toString()%>"

													target="_blank">重新检索</a> &nbsp;

											</td>

										</tr>

										<%

											}

											}

										%>

										</form>

									</tbody>

								</table>

							</div>

							<div class="info_table" id="bzList">

								<div class="infotableTop">

								<p>

									已定制

									<span class="tred03"><%=size%>

									</span> 条 标准跟踪信息


									<a href="javascript:void(0)"

										onClick="return sel_chk_all('item_id');return false"

										class="btn">全选</a>

<%--									<a href="javascript:void(0)" onClick="del_item();" class="btn">删除</a>--%>

									<button class="btn" data-toggle="modal" href="#interClass2" id="choice_en5" onclick="show2()">修改</button>

									<%if(size>totalLimit){%>

									　　　　　　　　　　　　　　　　　　　　<a  class="btn btn-success" href="/pagesnew/mystandard/push_01.jsp">生成订单</a>

									<%}%>

								</div>



								<table class="table">

									<thead>

										<tr>

											<th style="width:50px">

												序号

											</th>

											<th style="width:26px">

												选择

											</th>

											<th style="width:126px">

												标准号

											</th>

											<th>

												标准名称

											</th>

											<th style="width:60px">

												标准状态

											</th>

											<th style="width:70px">

												订阅日期

											</th>
											<th style="width:70px">

												订制状态

											</th>

										</tr>

									</thead>

									<tbody>

										<form name="delFrm" action="/pagesnew/mystandard/delPushItem.do" method="post">
											<input name="del_type" value="" type="hidden">
											<% java.text.SimpleDateFormat format = new java.text.SimpleDateFormat( "yyyy-MM-dd");
												String now = format.format(new Date());
												boolean flag = false;

												if (res1 != null) {

													int i = 0;

													while (i<size) {



/* /													flag = now.equals(rs.getString("SUBSCRIBEDATE").substring(

														0, 10)); */
														flag=true;

														int biao=(iPageIndex - 1) * iPageSize + (i+1);

											%>

											<%
												String a001 = res1[i].getA001();

											
											%>

										

										<tr>

											<td>

												<%=(iPageIndex - 1) * iPageSize + i+1%>

											</td>

											<td>

												<input name="item_id" onclick="javascript:document.getElementById('id').value=<%=res1[i].getId()%>;document.getElementById('old_a100').value='<%=res1[i].getA100()%>';" id="item_id_<%=res1[i].getId()%>"

													value="<%=res1[i].getId()%>" type="checkbox" />

											</td>

											<td>

												<a

													href="/detail/standard_detail.jsp?a001=<%=a001%>"

													<%if(flag){%> class="newcoll" <%}%> target="_blank"><%=res1[i].getA100()%>

												</a>

											</td>

											<td>
												<%
												String A298a302=res1[i].getA298a302();
												%>								
												<%=A298a302 == null ? "" : A298a302%>

											</td>

											<td>

												<%

															if (res1[i].getA000() != null

															&& "D".equals(res1[i].getA000())) {

														out.print("作废");

															} else {

														out.print("现行");

															}

												%>

											</td>

											<td>
																		
												<%=res1[i].getCreateDate()%>

											</td>
											
											<td>
											
												<% 
												if(res1[i].getStatus().equals("NEW") ||res1[i].getStatus() == null || "".equals(res1[i].getStatus())){ 
													out.print("免费");
												 } else if (res1[i].getStatus().equals("PAY")){
													out.print("已付费");
												 } else if (res1[i].getStatus().equals("UNPAY")){
													out.print("未付费");
												 }
												  %>
											</td>

										</tr>

										<%

												flag = false;
												i = i + 1;
												}

											}

										%>

										</form>

									</tbody>

								</table>

							</div>

							<!--翻页区-->

<%-- 							<div class="pageBox"> 

								<!--div class="pagination pagination-centered"-->

								<%

										if (iTotalPage > 1) {

										mJspParam = new JspParameter(new String[] { "sortcolumn",

										"menu", "pi" }, new String[] { sortcolumn, menu, "" });

										PageURL = JspHelp.getPageURL("nv_mystandard",

										"standardTracking", mJspParam, false);

										out.println(pageCutter(PageURL, iPageIndex, iTotalPage));

									} else {

								%>

								<div class="pagination pagination-centered">

									<ul>

										<li class="active">

											<a class="" href="javascript:;">&laquo;上一页</a>

										</li>

										<li class="active">

											<a class="" href="javascript:;">1</a>

										</li>

										<li class="active">

											<a class="" href="javascript:;">下一页&raquo;</a>

										</li>



									</ul>

								</div>

								<%

								}

								%>

								<!--/div-->

							</div> --%>

							<!--翻页区结束-->

						</div>

						<!--按标准清单定制结束-->
	
					</div>

				</div>

				<!--右侧内容区结束-->

			</div>

		</div>

		<!--主内容区结束-->

		<%@ include file="/common/foot.jsp"%>



		<!--弹出层区域-->

		<div class="modal hide" id="multiCriteria">

			<div class="modal-header">

				<button type="button" class="close" data-dismiss="modal">

					×

				</button>

				<h3>

					批量导入清单条目

				</h3>

			</div>

			<div id="waring_alert" class="alert">

				<a class="close" data-dismiss="alert">&times;</a>

				<strong>警告!</strong> &nbsp;&nbsp;请输入内容.

			</div>

			<form name="importTextForm" method="post"

				action="nv_customer_import_txt_save.jsp">

				<div class="modal-body">

					<p>

						请输入需要跟踪的标准号，一行请列出一条标准。

					</p>

					<textarea class="input-xlarge" id="stan_text" name="stan_text"

						rows="10"></textarea>

				</div>

				<div class="modal-footer">

					<button class="btn btn-primary" data-dismiss="modal"

						onclick="import_text_submit();">

						导入

					</button>

					<button class="btn" type="reset">

						重置

					</button>

				</div>

			</form>

		</div>



		<div class="modal hide" id="Import">

			<div class="modal-header">

				<button type="button" class="close" data-dismiss="modal">

					×

				</button>

				<h3>

					批量导入清单条目

				</h3>

			</div>

			<div class="modal-body">

				<p>

					请导入文件

				</p>

				<form name="importForm" method="post"

					action="nv_customer_import_txt_save.jsp"

					enctype="multipart/form-data">

					<input class="input-file" id="filename" name="filename" type="file">

					<button class="btn btn-primary" data-dismiss="modal"

						onclick="import_submit();">

						导入

					</button>

				</form>

				<div class="exampleBox">

					导入文件只支持TXT格式的文件。文件内标准号排列方式为每行一条，区分大小写。例如：

					<fieldset>

						<legend>

							Sample.txt

						</legend>

						ISO 11398-2012

						<br />

						ISO/IEC 29178-2012

						<br />

						ISO/IEC 18023-3-AMD-1-2012

						<br />

						ISO 16534-2012

						<br />

						ISO 630-4-2012

						<br />

					</fieldset>

				</div>



			</div>

		</div>



		<%

					if (other != null && !other.equalsIgnoreCase("")

					&& !other.equalsIgnoreCase("null")) {

		%>

		<%=other%>

		<%

		}

		%>

		<div class="modal hide" id="processingFailed">

			<div class="modal-header">

				<button type="button" class="close" data-dismiss="modal">

					×

				</button>

				<h3>

					信息提示

				</h3>

			</div>

			<div class="modal-body">

				<%

				if (request.getSession().getAttribute("err") == null) {

				%>

				<p>

					请选择导入清单条目功能！

					<br />

				</p>

				<%

				}

				%>

				<%

				if (errlist != null && errlist.size() > 0) {

				%>

				<p>

					您尚有

					<span class="tred03"><%=errlist.size()%>

					</span>条标准导入不成功，是否继续导入已成功的标准列表。

					<br />

					<%

					for (int j = 0; j < errlist.size(); j++) {

					%>

					<%=errlist.get(j).toString()%>

					<br />

					<%

					}

					%>

				</p>

				<p>

					<a href="#" class="DealtBt" data-dismiss="modal">立即处理</a>

					（您将立即进入导入失败列表，进行检索，删除，重试等操作。）

				</p>

				<%

				}

				%>

				<p>

					<%

					if (con != null && !"".equals(con) && !"0".equals(con)) {

					%>

					可以成功导入

					<span class="tred03"><%=con%>

					</span>条标准。

					<br />

					<%

					}

					%>

					<%

					if (notOnly != null && notOnly.size() > 0) {

					%>

					有

					<span class="tred03"><%=notOnly.size()%>

					</span>条标准重复。

					<br />

					<%

					}

					%>

					<%

					if (existent != null && existent.size() > 0) {

					%>

					有

					<span class="tred03"><%=existent.size()%> </span>条标准已经存在，请查看定制列表。

					<br />

					<%

					}

					%>

					<%

					if (repeat != null && repeat.size() > 0) {

					%>

					有

					<span class="tred03"><%=repeat.size()%> </span>条标准在清单中已经存在。

					<br />

					<%

					}

					%>

				</p>

			</div>

			<div class="modal-footer">

				<%

				if (con != null && !"".equals(con) && !"0".equals(con)) {

				%>

				<a href="nv_customer_import_txt_submit.jsp" class="btn btn-primary">是，继续</a>

				<a href="nv_customer_import_txt_del.jsp?remov=1" class="btn">否，取消本次操作</a>

				<%

				}

				%>

			</div>

		</div>

<!--modal hide-->

	<div class="modal hide" id="orderList" style="display: none; background:#D5D5D5;" >

		<div class="modal-header">

	    	<button type="button" class="close" data-dismiss="modal">×</button>

	    	

<!--jsp:include page="push_01.jsp" flush="true" /-->

    	</div>

    	

	<!--javascript区-->

    </div>

    <!--弹出层区域-->

<div class="modal hide" id="interClass">

			<div class="modal-header">

				<button type="button" class="close" onclick="javascript:document.getElementById('interClass').style.display='none';" data-dismiss="modal">

					×

				</button>

				<h3>

					推送条目修改

				</h3>

			</div>

			<form name="pushTextForm" method="post"

				action="ajax_load_pushitem.jsp">

				<div class="modal-body">

					<p>

						请输入需要跟踪的标准号<span style="color:red">(一行)</span>

					</p>

					

					<input type="text" id="push_text" name="push_text" />

					<input type="hidden" id="id" name="id" />

					<input type="hidden" id="old_a100" name="old_a100" />

					<div id="infoShow"></div>

				</div>

				<div class="modal-footer">

					<a onclick="upd_item()" class="btn btn-primary">验证</a>

					<button class="btn" type="reset">

						重置

					</button>

					

				</div>

			</form>

		</div>

	<!-- 弹出层结束 -->

		<!--javascript区-->

		<script type="text/javascript">

$(document).ready(function(){

        $("#rolling").Scroll({line:1,speed:500,timer:1000});

		$("#keyword").placeholder();

		$(".navbt").click(

			function(){

				$(this).toggleClass("dropup");

				});

		$(".DealtBt").click(

			function(){

				$("#failList").show();

				$("#bzList").hide();

				$(".pageBox").hide();

				});

		$(".backBt").click(

			function(){

				$("#failList").hide();

				$("#bzList").show();

				});

		$(".acctoggle").click(function(){

			var atext=$(this).text();

			if(atext=="展开"){

				$(this).text("关闭");}

			else{

				$(this).text("展开");}

			});

		$("#focusSearch").focus(function(){

		$(this).addClass("focus");

		});

		$("#focusSearch").blur(function(){

			$(this).removeClass("focus");

		});	

		$("#focusSearch").placeholder();	

		$("#waring_alert").alert('close');

		<%if("1".equals(tab)){%>

			$("ul#myTab li:eq(1) a").click();

		<%}%>

		<%if("1".equals(warning)){%>

			$("ul#dropdown-menu li:eq(2) a").click();

		<%}%>

		<%if("1".equals(errshow)){%>

			$("#failList").show();

			$("#bzList").hide();

			$(".pageBox").hide();

		<%}%>

		$(".navbt").click();				

});

var currleftlistid=document.getElementById('<%=menu%>');

    currleftlistid.className='nav-hear active';

</script>

		<script type="text/javascript">

	var djConfig = {isDebug: true};

	//djConfig.debugAtAllCosts = true;

</script>

		<script type="text/javascript" src="asserts/js/dojo/dojo.js"></script>

		<script language="JavaScript" type="text/javascript">

	dojo.require("dojo.widget.TitlePane");

	dojo.hostenv.writeIncludes();

	

	function MM_openBrWindow(theURL,winName,features) { //v2.0

		var popup = window.open(theURL, winName, features);

	}	

	

	function del_item(){	

		if(check_if_select()){

			if(confirm("确认删除吗")){

				delFrm.del_type.value="Item";

				delFrm.submit();

			}

		}

	}	

	/**

	*修改推送记录

	*/

	function upd_item(){

	

		

		var push_text = document.getElementById('push_text');

		if(push_text.value == ''){

			document.getElementById('infoShow').innerHTML = "<span style='color:red'>请输入标准号!!!</span>";

			document.getElementById('push_text').focus();

			return;

		}else{

		var a100 = push_text.value;

		var id = document.getElementById('id').value;

		var old_a100 = document.getElementById('old_a100').value;

		

			ajaxLoadCode(push_text.value,id,old_a100);

		}

	}	

	

	/**

*异步加载工作站信息 供修改功能使用

*/

function ajaxLoadCode(a100,id,old_a100){

	$.ajax({

				type : 'get',

				url:'ajax_load_pushitem.jsp?a100='+a100,

				contentType: "application/json;charset=utf-8",

				dataType : 'json',

				async : false,

					success :function(msg){

							if(msg == ''){

								$('#infoShow').html('请输入正确的标准号!!!');

							}else{

							    //是否更改本条标准

							    if(confirm("查询到相关记录 是否替换 " + old_a100 + " 该条推送标准 ？"))

									{

									window.location = "/pagesnew/mystandard/update_push_item.jsp?a100=" + a100 + "&id=" + id;

									return true;

									}else{

									return false;

									}

							 }   

							

					},error: function(XMLHttpRequest, textStatus, errorThrown) {

	                        //alert(XMLHttpRequest.responseText);

	                        //alert('编辑错误 请联系管理员!');

	                        $('#infoShow').html('<span style="color:red">请输入正确的标准号!!!</span>');

	                        document.getElementById('push_text').focus();

						

	                    }	

			})

	}

	

	//至少选择一条记录

	function check_if_select(str){

		var n = 0;

		for(var i=0;i<delFrm.elements.length;i++){

			if(delFrm.elements[i].name=="item_id"){

					n = n + 1;

			}

		}

		if(n == 0){

			return false;

		}

		else if(n == 1){

				if(delFrm.item_id.checked == false){	

						alert("请至少选择一条记录.");

						return false;

				}

		}

		else{

			var num = 0;

			for(var ii=0;ii<delFrm.item_id.length;ii++){

					if(delFrm.item_id[ii].checked == true){		

							num = num + 1;		

					}

			}

			if(num == 0){

					alert("请至少选择一条记录.");

					return false;					

			}	

		}

		return true;

	}

	//批量添加订单条目

function importItemToOrder(){

	var orderId = arguments[0];

	var orderContentUrl = arguments[1];

	var ret = window.showModalDialog("itemImportFrame.jsp",null,"dialogHeight:380px;dialogWidth:500px;");

	document.location.reload();

}

</script>

		<script language="JavaScript" type="text/javascript">

	function update_push_status(push_status){

		if(his_check_if_select()){

			if(confirm("确认修改吗?")){

				updateFrm.push_status.value = push_status;

				updateFrm.submit();

			}

		}

	}	

	

	//全选

	function sel_chk_all(){

		var schk = arguments[0];		

		//var chks = document.getElementsByTagName("item_id");

		var chks = document.getElementsByName(schk);



		if(chks.length>0){

			for(var i=0;i<chks.length;i++){

				var chk = chks[i];

				if(chk.name!=schk){

					continue;

				}

				if(chk.checked){

					chk.checked = false;

				}else{

					chk.checked = true;

				}

			}

		}

	}



	//至少选择一条记录	

	function his_check_if_select(str){

		var n = 0;

		for(var i=0;i<updateFrm.elements.length;i++){

			if(updateFrm.elements[i].name=="lite_id"){

					n = n + 1;

			}

		}

		if(n == 0){

			return false;

		}

		else if(n == 1){

				if(updateFrm.lite_id.checked == false){	

						alert("请至少选择一条记录.");

						return false;

				}

		}

		else{

			var num = 0;

			for(var ii=0;ii<updateFrm.lite_id.length;ii++){

					if(updateFrm.lite_id[ii].checked == true){		

							num = num + 1;		

					}

			}

			if(num == 0){

					alert("请至少选择一条记录.");

					return false;					

			}	

		}

		return true;

	}

	

	//处理导入错误列表删除

	function del_errlist(){

		var errId = arguments[0];

		if(errId==null || errId==""){

			if(check_err_select()){

				if(confirm("确认删除吗?")){

					errDelFrm.submit();

				}

			}

		}else{

			var chk = document.getElementById(errId);

			chk.checked = true;

			if(confirm("确认删除吗？")){

				errDelFrm.submit();

				return true;

			}else{

				return false;

			}			

		}

	}	

	//至少选择一条记录

	function check_err_select(str){

		var n = 0;

		for(var i=0;i<errDelFrm.elements.length;i++){

			if(errDelFrm.elements[i].name=="err_id"){

					n = n + 1;

			}

		}

		if(n == 0){

			return false;

		}

		else if(n == 1){

				if(errDelFrm.err_id.checked == false){	

						alert("请至少选择一条记录.");

						return false;

				}

		}

		else{

			var num = 0;

			for(var ii=0;ii<errDelFrm.err_id.length;ii++){

					if(errDelFrm.err_id[ii].checked == true){		

							num = num + 1;		

					}

			}

			if(num == 0){

					alert("请至少选择一条记录.");

					return false;					

			}	

		}

		return true;

	}

	//重试

	function err_reimport(){

		var old_stan = arguments[0];

		var err_stid = arguments[1];

		errReimportFrm.old_stan.value=old_stan;

		errReimportFrm.new_stan.value = document.getElementById(err_stid).value;

		errReimportFrm.submit();

	}

</script>

		<script language="JavaScript" type="text/javascript">

	function import_text_submit(){

		var stan = importTextForm.stan_text.value;

		if(stan==""){

			alert("请输入内容！");

			//$("#waring_alert").alert();

			//$("#multiCriteria").modal('show');

			return false;			

		}else{

			importTextForm.submit();

		}

	}

	



	

	function import_submit(){

		var filen = importForm.filename.value;

		var str = filen.split(".");

		var extname = str[str.length - 1];

		if(extname.toLowerCase()!="txt"){

			//alert("不支持的文件!");

			$(".alert").alert();

			return false;

		}

		importForm.submit();

	}

	function show1(){

		$("#orderList").show(1000);	

	}

	 function show2(){

	 var items = document.getElementsByName("item_id");

	 var n =0;

	 for(var i = 0; i < items.length; i++){

	 	if(items[i].checked == true){

	 		n++ ;

	 	}

	 }

		if(n == 0){

			alert('请选择一项记录!');

			return false;

		}else if(n > 1){

			alert('请勿同时选择多项记录进行更改!');

			return false;

		}

		$("#interClass").show(500);	

			

	}

	

</script>

			

		<!--javascript区结束-->
		<%@ include file="/common/pageCutterastm.jsp"%>
	</body>

</html>

