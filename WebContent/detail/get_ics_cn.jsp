<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.axis2.rpc.client.RPCServiceClient" %>
<%@ page import="com.lkscn.common.WebServiceClientConn" %>
<%@ page import="com.lkscn.common.Constant" %>
<%@ page import="javax.xml.namespace.QName" %>
<%@ page import="cn.gov.cnis.cssn.wssort.Ics" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";

String a826 = request.getParameter("a826");
RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
QName opAddEntry = WebServiceClientConn.getTheMethod("getIcsList");
Class[] classes = new Class[] { Ics[].class };
if(!a826.equals(""))
{
	String[] a826Arr = a826.split(";");
	for (int i = 0 ; i < a826Arr.length ; i++ )
	{
		Object[] opaddentryArgs = new Object[] { Constant.ORGLOGINNAME,Constant.ORGPASSWD, Constant.UKEYID, Constant.ORGCODE,
				a826Arr[i] };
		Ics[] ics = (Ics[]) (serviceClient.invokeBlocking(opAddEntry,opaddentryArgs, classes)[0]);
%>
		<%=ics.length>0?ics[0].getcName():""%>（<%=a826Arr[i]%>）;
<%
	}
}
%>
<base href="<%=basePath%>">