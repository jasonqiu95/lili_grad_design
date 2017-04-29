<%@page import="com.saas.po.UserInfo"%>
<%@page import="com.estarcom.cnis.cssn.common.User"%>
<%@page import="com.saas.po.TenantInfo"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    String tenantname=null;
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	UserInfo u=(UserInfo)session.getAttribute("user");
	TenantInfo t=(TenantInfo)session.getAttribute("admin");
	if(session.getAttribute("tenantname")==null)
		 tenantname="";
	 else
		 tenantname=(String)session.getAttribute("tenantname");
	String a001=request.getParameter("a001");
	 
%>  
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title><%=tenantname %>文献中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
 <script src="asserts/js/jquery.min.js"></script>
<script src="asserts/js/bootstrap.min.js"></script>
		<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
		<link href="css/magnific-popup.css" rel="stylesheet" type="text/css">


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
<body>
 <!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
            <!-- <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button> -->
            <a class="navbar-brand" href="index.htm"><!--  <img alt="Charisma Logo" src="img/logo20.png" class="hidden-xs"/> -->
                <span><%=tenantname%>标准服务中心</span></a>
          <ul class="collapse navbar-collapse nav navbar-nav top-menu">
                <li>
                    <form class="navbar-search pull-left" action="${pageContext.request.contextPath }/search/base.htm">
                        <input placeholder="标准资源检索" class="search-query form-control col-md-10" name="keyword" id="keyword"
                               type="text">
                    </form>
                </li>
            </ul>

            <!-- user dropdown starts -->
             <% if(u!=null||t!=null)
             {
                %>
            <div class="btn-group pull-right">
                <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					<% if(u!=null){%>
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> 尊敬的<%=u.getAccount() %>用户您好</span>
                    <% }
					else
					{
                    %>
                     <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> 尊敬的管理员您好</span>
                     <%} %>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                <% if(u!=null){%>
                    <li><a href="logining.htm?from=change">更改用户</a></li>
                    <li class="divider"></li>
                    <li><a href="unlogin.htm">注销</a></li>
                     <% }
		            	else
						{
		                %>
		                 <li><a href="logo.htm">上传logo</a></li>
                    <li class="divider"></li>
                    <li><a href="unloginadmin.htm">管理员注销</a></li>
                    <%} %>
                </ul>
            </div>
             <%;}else{ %>
                   <div class="btn-group pull-right">
                <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">

                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs">请登录</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="logining.htm?from=admin">管理员登录</a></li>
                    <li class="divider"></li>
                    <li><a href="logining.htm?from=login">普通用户登录</a></li>
                </ul>
            </div>
                    <%;} %>
            <!-- user dropdown ends -->
            

        	</div>
    </div>
    <!-- topbar ends -->
    
<iframe src="detail/standard_detailbuttom.jsp?a001=<%=a001 %>"  height="1200" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
 <script type="text/javascript" charset="utf-8">
      function autoHeight(){ 
        var ifr = document.getElementById('auto'); 
        ifr.height = ( ifr.contentDocument && ifr.contentDocument.body.offsetHeight ) ||
                     ( ifr.contentWindow.document.body.scrollHeight ); 
      }
    </script>
</body>
</html>