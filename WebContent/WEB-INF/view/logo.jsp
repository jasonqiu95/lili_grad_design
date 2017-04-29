<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="com.saas.po.UserInfo"%>
<%@page import="com.estarcom.cnis.cssn.common.User"%>
<%@page import="com.saas.po.TenantInfo"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String tenantname=null;
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
            <a class="navbar-brand" href="index.htm"> <!-- <img alt="Charisma Logo" src="img/logo20.png" class="hidden-xs"/> -->
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
                    <li><a href="logining.htm?from=change">更改用户</a></li>
                    <li class="divider"></li>
                    <li><a href="unlogin.htm">注销</a></li>
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
 	<div class="container-fluid">
 	<div class="row-fluid">
	 <div class="header-bottom">
	    <div class="wrap">
			<div class="header-bottom-left">
				<div class="logo">
					<a href="index.jsp"><img height="70" width="400"  src="images/logo.png" alt=""/></a>
				</div>
				<div class="menu"></div>
			</div>
	   <div class="header-bottom-right" >
         <form  action="${pageContext.request.contextPath }/search/base.htm" method="get" name="formSearch1" >
         
         <div class="search" > 
				<input style="width: 300px;height: 35px;" type="text"  class="input-xlarge" id="keyword" name="keyword" value="搜索" onFocus="this.value = '文献';" onBlur="if (this.value == ' ') {this.value = '文献';}">
				
				<input type="submit" value="Subscribe" id="submit" name="submit" >
				<div id="response"> </div>
		 </div>
		 </form>
		 		
	  <div class="tag-list">
	    <ul class="icon1 sub-icon1 profile_img">
			<li><a class="active-icon c1" > </a>
				<ul class="sub-icon1 list">
					<li><h1>欢迎使用文献检索服务</h1><a href="#"></a></li>
					<li><p>这里您可以检索与下载到您需要的文献资料。<a href=""></a></p></li>
				</ul>
			</li>
		</ul>
	    <ul class="last"><li><a href="${pageContext.request.contextPath }/search/search_base.jsp">更多检索服务</a></li></ul>
	    <ul class="last"><li><a href="${pageContext.request.contextPath }/mystandard/track.htm">标准跟踪</a></li></ul>
	  </div>
    </div>
     <div class="clear"></div>
     </div>
	</div>
	</div>

<div class="mens">    
  <div class="main">
     <div class="wrap">
	   <div class="cont span_2_of_3">
	  	  <h2 class="head">企业图标选择</h2>
	  	  <div class="top-box">
			  <div class="clear">
			    <div class="mens-toolbar">
			      <div class="pager">
			        <div class="limiter visible-desktop">请选择</div>
			        <ul class="dc_pagination dc_paginationA dc_paginationA06">
			          <li></li>
		            </ul>
			        <div class="clear"></div>
		          </div>
			      <div class="clear"></div>
		        </div>
			  </div>
		  </div>
		 <div class="top-box1">
		   <div class="clear"></div>
		 </div>
		 <div class="section group">
		   <div class="mens-toolbar">
		     <div class="clear"><span class="col col-4">
       <form action="${pageContext.request.contextPath }/logoupload.htm" method="post" id="myform" name="myform" enctype="multipart/form-data">
          <table class="insert-tab" width="100%">
            <tbody>

            <tr>
              <th>请选择文件名为logo.png的文件：</th>
              <td><input name="file" type="file"><input type="submit"  value="上传图片"/></td>
            </tr>
            </tbody>
            </table>
        </form>
  </a></td></div>
	       </div>
		   <p>&nbsp;</p>
		   <p>&nbsp;</p>
		   <p>&nbsp;</p>
		   <div class="clear"></div>
	     </div>			 							 			    		    
	   </div>
			<div class="rsidebar span_1_of_left">
				<h5 class="m_1">图标上传说明</h5>
			  <ul class="kids">
				<li><a href="#">文献资源说明</a></li>
                    	<li><a href="#">服务方式说明</a></li>
						
						<li class="last"><a href="#">资费说明</a></li>
					</ul>
			  <section  class="sky-form"></section>
       </div>
			  <div class="clear"></div>
	</div>
		   </div>
		</div>
		  <div class="footer">
		<div class="footer-top">
			<div class="wrap">
			  <div class="section group example">
				<div class="col_1_of_2 span_1_of_2">
					<ul class="f-list">
					  <li><img src="images/2.png"><span class="f-text">您可以在这里文献检索与下载</span><div class="clear"></div></li>
					</ul>
				</div>
				<div class="col_1_of_2 span_1_of_2">
					<ul class="f-list">
					  <li><img src="images/3.png"><span class="f-text">联系方式：010-58811302／58811336</span><div class="clear"></div></li>
					</ul>
				</div>
				<div class="clear"></div>
		      </div>
			</div>
		</div>
        <div class="footer-middle">
			<div class="wrap">
			 <div class="section group example">
			  <div class="col_1_of_f_1 span_1_of_f_1">
				 <div class="section group example">
				   <div class="col_1_of_f_2 span_1_of_f_2">
				     <h3>专题浏览</h3>
				     <ul class="f-list1">
  					   <li><a href="http://www.cssn.net.cn/pagesnew/topic/topic_main.jsp?gpid=1488A852-1827-451F-8AE5-8282EE4C864C">腐蚀与防护专题</a></li>
				       <li><a href="http://www.cssn.net.cn/pagesnew/topic/topic_main.jsp?gpid=00000000-0000-0000-0000-000000061006">医疗器械专题 </a></li>
				       <li><a href="http://www.cssn.net.cn/pagesnew/topic/topic_main.jsp?gpid=00000000-0000-0000-0000-000000081000">十大消费品</a></li>
				       <li><a href="http://www.cssn.net.cn/pagesnew/topic/topic_main.jsp?gpid=00000000-0000-0000-0000-000000071007">测试方法-食品</a></li>
				       <li><a href="http://www.cssn.net.cn/pagesnew/topic/topic_main.jsp?gpid=00000000-0000-0000-0000-000000061006">测试方法-环境 </a></li>
				       <li><a href="http://www.cssn.net.cn/t_ztfw/index_1.html">更多>></a></li>
			         </ul>
			       </div>
				   <div class="col_1_of_f_2 span_1_of_f_2">
				     <h3>馆藏资源</h3>
				     <ul class="f-list1">

				       <li><a href="http://www.cssn.net.cn/t_gczx/jsfg/">技术法规 </a></li>
				       <li><a href="http://www.cssn.net.cn/t_gczx/zz/">专著文献</a></li>
				       <li><a href="http://www.cssn.net.cn/t_gczx/qk/">期刊文献</a></li>
				       <li><a href="http://www.cssn.net.cn/t_gczx/yd/">药 &nbsp &nbsp&nbsp   &nbsp&nbsp典</a></li>
				       <li><a href="http://www.cssn.net.cn/t_gczx/sjkzy/">数据库资源</a></li>
                       <li><a href="http://www.cssn.net.cn/t_gczx/zggc/">珍贵馆藏</a></li>
			         </ul>
			       </div>
				   <div class="clear"></div>
		      </div>
 			 </div>
			 <div class="col_1_of_f_1 span_1_of_f_1">
			   <div class="section group example">
			     <div class="col_1_of_f_2 span_1_of_f_2">
			       <h3>标准服务</h3>
			       <ul class="f-list1">
			         <li><a href="http://www.cssn.net.cn/t_bzfw/bzcxfw/">标准查新服务 </a></li>
			         <li><a href="http://www.cssn.net.cn/t_bzfw/wtjsfw/">委托检索服务</a></li>
			         <li><a href="http://www.cssn.net.cn/t_bzfw/bzfyfw/">标准翻译服务</a></li>
			         <li><a href="http://www.cssn.net.cn/t_bzfw/bzgzfw/">标准跟踪服务 </a></li>
                     <li><a href="http://www.cssn.net.cn/t_bzfw/sjkgxfw/">数据共享服务</a></li>
                     <li><a href="http://www.cssn.net.cn/t_bzfw/bzyxxqr/">标准有效性确认服务 </a></li>
		           </ul>
		         </div>
			     <div class="col_1_of_f_2 span_1_of_f_2">
			       <h3>我们的联系方式</h3>
			       <div class="company_address">
			         <p>地址：北京市海淀区知春路4号</p>
			         <!--							   		<p>22-56-2-9 Sit Amet, Lorem,</p>
							   		<p>中国</p>-->
			         <p>电话:(00)6 44 222 664</p>
			         <p>传真: (000) 000 00 00 0</p>
			         <p>邮箱: <span>mail[at]leoshop.com</span></p>
                     <p>邮编：100088</p>
		           </div>
			       <div class="social-media">
			         <ul>
			           <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="Google"><a href="#" target="_blank"> </a></span></li>
			           <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Linked in"><a href="#" target="_blank"> </a></span></li>
			           <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Rss"><a href="#" target="_blank"> </a></span></li>
			           <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Facebook"><a href="#" target="_blank"> </a></span></li>
		             </ul>
		           </div>
		         </div>
			     <div class="clear"></div>
		    </div>
		   </div>
		  <div class="clear"></div>
		    </div>
		</div>
		<div class="footer-bottom">
			<div class="wrap">
				<div class="copy">
<!-- 			        <p>中国标准化研究院 版权所有 京ICP备10046988号-2</p> -->
		        </div>
				<div class="f-list2">
				<ul>
					<li class="active"><a href="about.html">关于我们</a></li> |
					<li><a href="delivery.html">投诉与建议 </a></li> |
					<li><a href="delivery.html">条款和条件 </a></li> |
					<li><a href="contact.html">联系我们</a></li> 
				</ul>
				</div>
				<div class="clear"></div>
		      </div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>