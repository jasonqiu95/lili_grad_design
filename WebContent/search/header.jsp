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
	 
%>  
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
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
<div class="ch-container">
    <div class="row">
    <div class="col-sm-2 col-lg-2">
  <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">
                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">标准服务</li>
                        <li><a href="${pageContext.request.contextPath }/search/search_base.jsp"><i class="glyphicon glyphicon-lock"></i><span>标准资源检索</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath }/mystandard/track.htm"><i class="glyphicon glyphicon-eye-open"></i><span>标准资源跟踪</span></a>
                        </li>
                    </ul>
                </div>
            </div>
		</div>
		 <div id="content" class="col-lg-10 col-sm-10">
                <div>
        <ul class="breadcrumb">
            <li>
                <a href="index.htm">主页</a>
            </li>
            <li>
                <a href="#">标准检索</a>
            </li>
        </ul>
     
     </div>
       <!--  内容区 -->
       
       
    <div class="row">
	    <div class="box col-md-12">
		    <div class="box-inner">
		    	<div class="box-header well" data-original-title="">
			     <h2><i class="glyphicon glyphicon-search"></i> 标准检索</h2>
			             <div class="box-icon">
			            <a href="#" class="btn btn-setting btn-round btn-default"><i class="glyphicon glyphicon-cog"></i></a>
			            <a href="#" class="btn btn-minimize btn-round btn-default"><i
			                    class="glyphicon glyphicon-chevron-up"></i></a>
			            <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>
			        </div>
		        
		   	 </div>
		   	 <div class="box-content">
		   	 
		   	 <!--  <div class="well"> -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#simple" data-toggle="tab"><i class="glyphicon glyphicon-search"></i>简单检索</a></li>
                    <li><a href="#highRanking" data-toggle="tab"><i class="glyphicon glyphicon-road"></i>高级检索</a></li>
                    <li><a href="#"><i class="glyphicon glyphicon-pencil"></i>专业检索</a></li>
                </ul>
                <div class="tab-content">
                 
                <div class="tab-pane active" id="simple">
                <br><br><br>
                <form class="form-inline" role="form" action="${pageContext.request.contextPath }/search/base.htm" method="get" name="formSearch1">
                	<div class="input-group col-md-4 col-md-offset-2">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-search blue"></i></span>
                    <input type="text" class="form-control" placeholder="" id="keyword" name="keyword">
                </div>
                 <button type="submit" class="btn btn-primary">搜索</button>
                   <br><br><br>
                 <div class="alert alert-success">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>注意!</strong> 您可以在输入框中输入标准名称或标准号，进行模糊搜索。相关字段用空格分隔。示例："环境"或"GB 24613"或"环境（空格）GB 24613"
                </div>
                </form>
				</div>
				
				 <div class="tab-pane" id="highRanking">
				 <form class="form-horizontal" style="margin-top: 30px;">
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">关键词:</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="keyword_1" name="keyword" placeholder="请输入关键词">
					      <p class="help-block">标准名称中相关字段，示例："环境"或"规范"或"环境（空格）规范"</p>
					    </div> 
					  </div>
					  
					  <div class="form-group">
					    <label for="inputPassword3" class="col-sm-2 control-label">标准号：</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="literature_id" name="literature_id" placeholder="请输入标准号">
					      <p class="help-block">示例："GB 24613-2009"或"24613"</p>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="inputPassword3" class="col-sm-2 control-label">国际标准分类:</label>
 					    <div class="col-sm-5"> 
					      <input type="text" class="form-control" id="literature_id" name="literature_id" placeholder="" readonly>
						   <div class="panel-group" role="tablist">
    <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="collapseListGroupHeading1">
        <h4 class="panel-title">
          <a class="collapsed" role="button" data-toggle="collapse" href="#collapseListGroup1" aria-expanded="false" aria-controls="collapseListGroup1">
            Collapsible list group
          </a>
        </h4>
      </div>
      <div id="collapseListGroup1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading1">
        <ul class="list-group">
          <li class="list-group-item">Bootply</li>
          <li class="list-group-item">One itmus ac facilin</li>
          <li class="list-group-item">Second eros</li>
        </ul>
        <div class="panel-footer">Footer</div>
      </div>
    </div>
  </div>
					      <!-- <p class="help-block">点击选择要查找标准在国际分类中的类别范围</p> -->
					      
					      </div>
					      </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit" class="btn btn-default">Sign in</button>
					    </div>
					  </div>
					</form>
				</div>
				
                </div>
            </div>
		   	 </div>
		    </div>
<!-- 	    </div> -->
    </div>
    
    
	   <!--内容区结束 -->
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