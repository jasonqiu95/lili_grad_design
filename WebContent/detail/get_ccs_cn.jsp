<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.axis2.rpc.client.RPCServiceClient" %>
<%@ page import="com.lkscn.common.WebServiceClientConn" %>
<%@ page import="com.lkscn.common.Constant" %>
<%@ page import="javax.xml.namespace.QName" %>
<%@ page import="cn.gov.cnis.cssn.wssort.Ccs" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";

String a825 = request.getParameter("a825");
RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
QName opAddEntry = WebServiceClientConn.getTheMethod("getCcsList");
Class[] classes = new Class[] { Ccs[].class };
if(!a825.equals(""))
{
	String[] a825Arr = a825.split(";");
	for (int i = 0 ; i < a825Arr.length ; i++ )
	{
		Object[] opaddentryArgs = new Object[] { Constant.ORGLOGINNAME,Constant.ORGPASSWD, Constant.UKEYID, Constant.ORGCODE,
				a825Arr[i] };
		Ccs[] ccs = ((Ccs[]) (serviceClient.invokeBlocking(opAddEntry,opaddentryArgs, classes)[0]));
	%>
		<%=ccs.length>0?ccs[0].getCc():""%>（<%=a825Arr[i]%>）;
<%
	}
}
%>
<base href="<%=basePath%>">