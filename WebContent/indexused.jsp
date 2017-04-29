<%@page import="com.saas.po.UserInfo"%>
<%@page import="com.estarcom.cnis.cssn.common.User"%>
<%@page import="com.saas.po.UserInfo"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	UserInfo u=(UserInfo)session.getAttribute("user");
%>  
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>文献中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery1.min.js"></script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery1.min.js"></script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!--start slider -->
    <link rel="stylesheet" href="css/fwslider.css" media="all">
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <script src="js/fwslider.js"></script>
<!--end slider -->
<script src="js/jquery.easydropdown.js"></script>

<script type="text/javascript" src="js/jquery1.min.js"></script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!--start slider -->
    <link rel="stylesheet" href="css/fwslider.css" media="all">
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <script src="js/fwslider.js"></script>
<!--end slider -->
<script src="js/jquery.easydropdown.js"></script>

</head>
<body>
       <div class="header-top">
			<div class="wrap">
			  <div class="cssmenu">
				<ul>
<!-- 					 | -->
					<c:choose> 
						  <c:when test="${user==null }"><li><a href="logining.htm">管理员登录</a></li></c:when>
	           		 	  <c:when test="${user.account=='admin'}">平台管理员欢迎您使用文献服务<li><a href="returnlogo.htm"> 图标管理</a></li>|<li><a href="unlogin.htm"> 注销</a></li></c:when> 
	           		     <c:when test="${user.account!='admin'}">尊敬的<%=u.getAccount()%>用户,欢迎您使用文献服务<li><a href="unlogin.htm"> 注销</a></li></c:when>
	           		      <c:otherwise>注销</c:otherwise> 
 				    </c:choose> 

<%-- 					 <c:if test="${account!=null  }"<c:set var="user"/>欢迎您  ${user.account  }</c:if>></div>  --%>
<!-- 					<li><a href="login/login.html">退出</a></li> -->
					<li></li>
				</ul>
			  </div>
			<div class="clear"></div>
 		</div>
	  </div>
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
		<!--<ul class="icon1 sub-icon1 profile_img">
			<li><a class="active-icon c2" href="#"> </a>
				<ul class="sub-icon1 list">
					<li><h3>No Products</h3><a href=""></a></li>
					<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
				</ul>-->
<!-- 			</li>
		</ul> -->
	    <ul class="last"><li><a href="${pageContext.request.contextPath }/search/more.htm">更多检索服务</a></li></ul>
	    <ul class="last"><li><a href="${pageContext.request.contextPath }/mystandard/track.htm">标准跟踪</a></li></ul>
	  </div>
    </div>
     <div class="clear"></div>
     </div>
	</div>
  <!-- start slider -->
    <div id="fwslider">
        <div class="slider_container">
            <div class="slide"> 
                <!-- Slide image -->
                    <img height="350" width="100"  src="images/banner.jpg" alt=""/>
                <!-- /Slide image -->
                <!-- Texts container -->
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">欢迎来到标准文献检索中心22</h4>
                        <!-- /Text title -->
                        
                        <!-- Text description -->
<!--                        <p class="description">标准文献</p>-->
                        <!-- /Text description -->
                    </div>
                </div>
                 <!-- /Texts container -->
            </div>
            <!-- /Duplicate to create more slides -->
            <!--/slide -->
        </div>
        <div class="timers"></div>
        <div class="slidePrev"><span></span></div>
        <div class="slideNext"><span></span></div>
    </div>
    <!--/slider -->
<div class="main">
	<div class="wrap">
		<div class="section group">
		  <div class="clear"></div>
	</div>
	</div>
</div>    
    
       <div class="login">
          <div class="wrap">
<div class="section group">
	   <div class="labout span_1_of_about">
					 <h3><strong>标准文献</strong></h3>
					  <div class="testimonials ">
						<div class="testi-item">
						<blockquote class="testi-item_blockquote">
							<a href="#">国家标准馆是我国唯一的国家级标准文献、图书、情报的馆藏、研究和服务机构，隶属中国标准化研究院，是国家标准化管理委员会的基础信息支撑机构。国家标准馆是国家标准文献中心，是中国图书馆学会专业图书馆分会理事单位和国家科技图书文献中心（NSTL）的成员单位，是我国历史最久、资源最全、服务最广、影响最大的权威性标准文献服务机构。</a>
							<div class="clear"></div>
						</blockquote>
							<small class="testi-meta"><span class="user">如需更多服务请访问：</span><span class="info"></span><br>
							<a href="http://www.cssn.net.cn/">www.cssn.net.cn/</a></small></div>
					   </div>
					   <div class="testimonials "></div>
				    </div>
				    <div class="cont span_2_of_about">
				       <h3>企业标准服务中心</h3>
					   	<p>　　为加强科技创新基础能力建设，推动我国科技资源的整合共享与高效利用，改变我国科技基础条件建设多头管理、分散投入的状况，减少科技资源低水平重复和浪费，打破科技资源条块分割、部门封闭、信息滞留和数据垄断的格局，&ldquo;十一五&rdquo;以来，国家有关部门贯彻&ldquo;整合、共享、完善、提高&rdquo;的方针，组织开展了国家科技基础条件平台（以下简称&ldquo;科技平台&rdquo;）建设工作。</p>
					   	<p>　　科技平台是充分利用现代信息技术等手段，创新机制，有效整合科技资源，为全社会的科学研究、技术创新和社会民生提供共享服务的网络化、社会化的组织体系。科技平台作为提高科技创新能力的重要基础，已成为国家创新体系的重要组成部分、政府管理和优化配置科技资源的重要载体、开展科学研究和技术创新活动的物质保障，是提升科技公共服务水平的重要措施和有力抓手。</p>
				        <h5 class="m_6">服务文献种类</h5>	
				     <div class="section group">
						<div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog3">  <span class="rollover"></span><img src="images/a-img.jpg" title="continue" alt=""/></a>
		                     <div id="small-dialog3" class="mfp-hide">
							   <div class="pop_up2">
							   	 <h2>文献服务</h2>
								 <p>国家标准馆成立于1963年，馆藏资源有一个世纪以来国内外各类标准文献110万余件，包括齐全的中国国家标准和66个行业标准，60多个国家、70多个国际和区域性标准化组织、450多个专业协（学）会的成套标准，160多种国内外标准化期刊及标准化专著。</p>
								 <p>国家标准馆自2005年开始进行的&ldquo;标准文献共享网络建设&rdquo;，在整合全国已有标准文献资源的基础上，形成了规模庞大标准文献题录数据库、全文数据库和专业数据库。目前标准文献题录数据库量已达130万余条，是我国迄今为止最全的标准文献信息库。为方便国内外用户，服务社会，国家标准馆与30多个国家及国际标准化机构建立了长期、稳定的标准文献信息交换关系，并且与众多的国内外标准出版发行机构建立了良好的合作机制，从事国内外及国际标准的代理服务。</p>
								</div>
							 </div>
							 <h4 class="m_7"><a href="#">国内文献</a></h4>
							 <p>国家标准馆收藏了全部的中国标准，包括全套的国家标准、行业标准和地方标准。并且实现了持续快速的更新，保证了您使用标准的有效性。更积累了全套作废的中国标准，帮助您回溯历史的标准。国家标准馆自2005年开始进行的“标准文献共享网络建设”，在整合全国已有标准文献资源的基础上，形成了规模庞大标准文献题录数据库、全文数据库和专业数据库。目前标准文献题录数据库量已达130万余条，是我国迄今为止最全的标准文献信息库。</p>
					     </div>
						<div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog3">  <span class="rollover"></span><img src="images/a-img1.jpg" title="continue" alt=""/></a>
		                    <h4 class="m_7"><a href="#">国际文献服务</a></h4>
							 <p>国家标准馆收录了诸如国际标准化组织（ISO）、欧盟标准化协会（CEN)等13个国际性权威标准化组织共计14万余标准文献，帮助企业科学化、制度化地管理生产经营活动，帮助企业更好的开拓国际市场，了解各行业的世界发展先进水平。更积累了全套作废的国际标准，帮助您回溯历史的标准。</p>
					     </div>
						<div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog3">  <span class="rollover"></span><img src="images/a-img2.jpg" title="continue" alt=""/></a>
		                    <h4 class="m_7"><a href="#">外国文献服务</a></h4>
							 <p>国家标准馆与30多个国家及国际标准化机构建立了长期、稳定的标准文献信息交换关系，并且与众多的国内外标准出版发行机构建立了良好的合作机制，从事国内外及国际标准的代理服务。馆藏60多个国家，共计60余种行业的行业标准文献及标准化专著，帮助您更全面、详细地了解外国标准。并且实现了持续快速的更新，保证了您使用标准的有效性。</p>
					     </div>
				        <div class="clear"></div> 
							
		   </div>
		   <!-- Add fancyBox main JS and CSS files -->
		<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
		<link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
		<script>
			$(document).ready(function() {
				$('.popup-with-zoom-anim').magnificPopup({
					type: 'inline',
					fixedContentPos: false,
					fixedBgPos: true,
					overflowY: 'auto',
					closeBtnInside: true,
					preloader: false,
					midClick: true,
					removalDelay: 300,
					mainClass: 'my-mfp-zoom-in'
			});
		});
		</script>
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
					  <li><img src="images/3.png"><span class="f-text">联系方式：010-644222664</span><div class="clear"></div></li>
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
  					   <li><a href="http://www.cssn.net.cn/pagesnew/topic/topic_main.jsp?gpid=00000000-0000-0000-0000-000000071007">测试方法-食品</a></li>
				       <li><a href="http://www.cssn.net.cn/pagesnew/topic/topic_main.jsp?gpid=00000000-0000-0000-0000-000000061006">测试方法-环境 </a></li>
				       <li><a href="http://124.205.49.20:81/KLS/">知识链接系统</a></li>
				       <li><a href="http://www.ncrm.org.cn/bwbz">食品与环境安全专题 </a></li>
				       <li><a href="http://www.cssn.net.cn/pagesnew/search/search_mandatory.jsp">强制性国家标准 </a></li>
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
</body>
</html>