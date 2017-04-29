<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.saas.po.UserInfo"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	UserInfo u=(UserInfo)session.getAttribute("user");
%>  

    <!--
        ===
        This comment should NOT be removed.

        Charisma v2.0.0

        Copyright 2012-2014 Muhammad Usman
        Licensed under the Apache License v2.0
        http://www.apache.org/licenses/LICENSE-2.0

        http://usman.it
        http://twitter.com/halalit_usman
        ===
    -->
    <meta charset="utf-8">
    <title>标准跟踪服务</title>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">

    <link href="css/charisma-app.css" rel="stylesheet">
    <link href='bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='css/jquery.noty.css' rel='stylesheet'>
    <link href='css/noty_theme_default.css' rel='stylesheet'>
    <link href='css/elfinder.min.css' rel='stylesheet'>
    <link href='css/elfinder.theme.css' rel='stylesheet'>
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='css/uploadify.css' rel='stylesheet'>
    <link href='css/animate.min.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="bower_components/jquery/jquery.min.js"></script>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">

</head>
<%@ page import="cn.gov.cnis.cssn.wssort.*"%>
<%
	StandardTracking res1[]=(StandardTracking[])request.getAttribute("rest");
	StandardPush res2[]=(StandardPush[])request.getAttribute("resp");
	int length=res1.length;
	int lengthp=0;
	int num=0;
	if(res2==null)
		;
	else
		lengthp=res2.length;
	System.out.println("standardtrackingt: "+length);
	System.out.println("standardtrackingp: "+lengthp);
%>
<body>
<div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">标准服务</li>
                        <li><a href="${pageContext.request.contextPath }/search/search_base.jsp"><i class="glyphicon glyphicon-lock"></i><span>标准资源检索</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath }/mystandard/track.htm" target="_parent"><i class="glyphicon glyphicon-eye-open" ></i><span>标准资源跟踪</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--/span-->
        <!-- left menu ends -->

        <noscript>
            <div class="alert alert-block col-md-12">
                <h4 class="alert-heading">Warning!</h4>

                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
                    enabled to use this site.</p>
            </div>
        </noscript>

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
                <div>
        <ul class="breadcrumb">
            <li>
                <a href="index.htm" target="_parent">主页</a>
            </li>
            <li>
                <a href="#">标准跟踪</a>
            </li>
        </ul>
    </div>

    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-user"></i> 标准跟踪列表</h2>

        <div class="box-icon">
            <a href="#" class="btn btn-setting btn-round btn-default"><i class="glyphicon glyphicon-cog"></i></a>
            <a href="#" class="btn btn-minimize btn-round btn-default"><i
                    class="glyphicon glyphicon-chevron-up"></i></a>
            <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>
        </div>
    </div>
    <div class="box-content">
    <div class="alert alert-info">已定制<font color="red"><%=length %></font>条 标准跟踪信息</div>
    <table class="table table-striped table-bordered bootstrap-datatable datatable responsive">
    <thead>
    <tr>
        <th>序号</th>
        <th>标准号</th>
        <th>标准名称</th>
         <th>订阅日期</th>
        <th>标准状态</th> 
        <th>操作</th>
                </tr>
    </thead>
    <tbody>
	<%
	 for(int i=0;i<lengthp;i++)
	 {
		 	num++;
		 	String na001=res2[i].getnA001();	
		 	String oa001=res2[i].getoA001();
		 	String nstandnum=res2[i].getnA100();
		 	String ostandnum=res2[i].getoA100();
		 	String nstandname=res2[i].getnA298_A302();
		 	String ostandname=res2[i].getoA298_A302();
		 	String nstatus=res2[i].getnA000();
		 	String ostatus=res2[i].getoA000();
	    	String data=res2[i].getPushDate().toString();
	    	String relation=res2[i].getRelation();
	%>

<tr>
        <td><%=num%></td>
         <td class="center">新：<%=nstandnum%><br>原：<%=ostandnum%></td>
        <td class="center">新：<%=nstandname%><br>原：<%=ostandname%></td>
       
      <td class="center"><%=data%></td>
      <td class="center"><%=relation%></td>
        <td class="center"> 
            <a class="btn btn-primary" href="detail/standard_detail.jsp?a001=<%=na001%>">
                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
              	  查看
            </a>
            <a class="btn btn-success" href="#">
                <i class="glyphicon glyphicon-edit icon-white"></i>
                	确认
            </a>
        </td> 
    </tr>
    <%} %>

    <%
    for(int i=0;i<length;i++)
    {
    	System.out.println("stand:111");
    	num++;
    	String standnum=res1[i].getA100();
    	String standname=res1[i].getA298a302();
    	String status=res1[i].getA000();
    	String data=res1[i].getCreateDate();
    	String a001=res1[i].getA001();
    	System.out.print(standname);
    	
    %>
    <tr>
        <td><%=num%></td>
         <td class="center"><%=standnum%></td>
        <td class="center"><%=standname%></td>
       
      <td class="center"><%=data%></td>
      <td class="center">
            <%

															if (status != null

															&& "D".equals(res1[i].getA000())) {

														out.print("<span class=\"label-warning label label-default\">作废</span>");

															} else {

														out.print("<span class=\"label-success label label-default\">现行</span>");

															}

												%>
        </td>
        <td class="center"> 
            <a class="btn btn-primary" href="detail/standard_detail.jsp?a001=<%=a001%>">
                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
              	  查看
            </a>
        </td> 
    </tr>
    <%} %>
    </tbody>
    </table>
    </div>
    </div>
    </div>
    <!--/span-->

    </div><!--/row-->

   
            </div>
        </div>
    </div>

  
<!--/.fluid-container-->

<!-- external javascript -->

<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='bower_components/moment/min/moment.min.js'></script>
<script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="bower_components/chosen/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script src="bower_components/responsive-tables/responsive-tables.js"></script>
<!-- tour plugin -->
<script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="js/charisma.js"></script>


</body>
</html>
