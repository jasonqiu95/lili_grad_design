<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="com.estarcom.cnis.cssn.customersystem.user.Operator"%>
<%@ page import="com.estarcom.cnis.cssn.customersystem.infopush.service.PushDelegate"%>
<%@ page import="com.estarcom.cnis.cssn.salesystem.trade.TradeHelp"%>
<%@ page import="com.estarcom.cnis.cssn.customersystem.NVCustomerQuery"%>
<%

boolean b=(boolean)request.getAttribute("boo");
		if(b==true)
			out.print("<div align=center>添加成功！<br>");
		else
			out.print("<div align=center>添加失败！</div>");
%> 

