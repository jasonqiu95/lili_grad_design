<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.axis2.rpc.client.RPCServiceClient" %>
<%@ page import="com.lkscn.common.WebServiceClientConn" %>
<%@ page import="com.lkscn.common.Constant" %>
<%@ page import="javax.xml.namespace.QName" %>
<%@ page import="cn.gov.cnis.cssn.wssort.StandardWrap" %>

<%

String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";

String a001=request.getParameter("a001");
String type=request.getParameter("type");
if(a001.equals("")||type.equals(""))
	return;
RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
QName opAddEntry = WebServiceClientConn.getTheMethod("getAdoptORAdoptedStandard");
Object[] opaddentryArgs = new Object[] { Constant.ORGLOGINNAME,Constant.ORGPASSWD, Constant.UKEYID, Constant.ORGCODE,
		a001, type};
Class[] classes = new Class[] { StandardWrap[].class };
StandardWrap[] wrap = ((StandardWrap[]) (serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0]));
System.out.println("adopt");

%>
<dl>
	<%
	if(type.equalsIgnoreCase("A800"))
	{
	%>
	<dt class="cite01">采用了如下标准</dt>
	<%} else{%>
	<dt class="cite01">被如下标准采用</dt>
	<%
	}
	if(wrap.length>0)
	{
	for (int i = 0; i < wrap.length&&i<5; i++) 
	{
		String a000=wrap[i].getA000();
		String a100=wrap[i].getA100();
		String a298=wrap[i].getA298();
		String a302=wrap[i].getA302();
		String a0011=wrap[i].getA001();
	%>
	<dd>
		<a title="<%=a298%><%=a302%>" href="detail/standard_detail.jsp?a001=<%=a0011%>"   target="_parent"><%=a100%></a>
		<%if(a000.equals("D")){%><span class="marked">作废</span><%}%>
		<p>
			<%=a298.length() > 25 ? a298.substring(0, 25) + "..." : a298%>
			<br />
			<%=a302.length() > 50 ? a302.substring(0, 50) + "..." : a302%>
		</p>
	</dd>
	<%
	}
	}
	%>
</dl>
<base href="<%=basePath%>">
<head>

</head>

<!-- <body> -->
<!-- 	<!--顶部导航-->
<!-- 	<div class="header-top"> -->
<!-- 			<div class="wrap"> -->
<!-- 			  <div class="cssmenu"> -->
<!-- 				<ul> -->
<!-- 					<li class="active"><a href="detail/standard_detail.jsp">我的账户</a></li> | -->
<!-- 					<li></li><li></li> -->
<!-- 					<li><a href="login.html">登录</a></li> -->
<!-- 					 | -->
<!-- 					<li><a href="register.html">退出</a></li> -->
<!-- 					<li></li> -->
<!-- 				</ul> -->
<!-- 			  </div> -->
<!-- 			<div class="clear"></div> -->
<!--  		</div> -->
<!-- 	  </div> -->
<!-- 	<!--头部导航结束-->
<!-- </body> -->
<!-- </html> -->