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

String a825 = request.getParameter("a825");
if(a825==null ||a825.equals("") || a825.equals("null"))
{
	return;
}

RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
QName opAddEntry = WebServiceClientConn.getTheMethod("getCcsOrIcsStandard");
Object[] opaddentryArgs = new Object[] { Constant.ORGLOGINNAME,Constant.ORGPASSWD, Constant.UKEYID, Constant.ORGCODE,
		"CCS", a825 };
Class[] classes = new Class[] { StandardWrap[].class };
StandardWrap[] wrap = ((StandardWrap[]) (serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0]));
String a001,a000,a100,a298,a302;
System.out.println("get_identical_ccs");
System.out.println(wrap.length);
for (int i = 0; i < wrap.length&&i<5; i++) 
{
	a001=wrap[i].getA001();
	a000=wrap[i].getA000();
	a100=wrap[i].getA100();
	a298=wrap[i].getA298();
	a302=wrap[i].getA302();
	
%>
<li>
	<a title="<%=a298%><%=a302%>" href="detail/standard_detail.jsp?a001=<%=a001%>"  target="_parent"><%=a100%></a>
	<p>
	<%if(a298!=null&&!a298.equals("")){%><%=a298.length()>12 ? a298.substring(0,12):a298%><%}
	else{%><%=a302%><%}%>
	</p>
</li>
<%
}
%>
<%
if(wrap.length>5)
{
%>
<a target="_blank" href="get_identical_css_show.jsp?a825=<%=a825%>"></a>
<%
}
%>
<base href="<%=basePath%>">