<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
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

String a001 = request.getParameter("a001");
RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
QName opAddEntry = WebServiceClientConn.getTheMethod("getConcernStandard");
Object[] opaddentryArgs = new Object[] { Constant.ORGLOGINNAME,Constant.ORGPASSWD, Constant.UKEYID, Constant.ORGCODE,
		a001 };
Class[] classes = new Class[] { StandardWrap[].class };
StandardWrap[] wrap = ((StandardWrap[]) (serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0]));
String a000,a100,a298,a302;
System.out.println("get_interested_standard");
for (int i = 0; i < wrap.length&&i<5; i++) 
{
	a000=wrap[i].getA000();
	a100=wrap[i].getA100();
	a298=wrap[i].getA298();
	a302=wrap[i].getA302();
	String a0011=wrap[i].getA001();
%>
	<li>
		<a title="<%=a298%><%=a302%>" href="detail/standard_detail.jsp?a001=<%=a0011%>"  target="_parent"><%=a100%></a>;
		<%="D".equals(a000) ? "作废" : "现行"%>
		<p><%=a298.length()>12 ? a298.substring(0,12)+"..." : a298%></p>
	</li>
<%
}
%>
<base href="<%=basePath%>">
