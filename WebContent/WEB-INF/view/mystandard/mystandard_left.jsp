<%@page contentType="text/html;charset=utf-8"%>
<%@ page language="java" %>
 <%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.estarcom.cnis.cssn.customersystem.user.Operator"%>
<%@ page import="com.estarcom.cnis.cssn.customersystem.user.query.AccountQuery"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.estarcom.cnis.cssn.salesystem.trade.TradeHelp"%>
<%	
 
	Operator operator1 = null;
	String login_name = null;
	String account_login_name = null;
	if(request.getSession().getAttribute("operator")!=null){
		operator1 = (Operator) request.getSession().getAttribute("operator"); //得到登录用户
	}
	String status = "";
	if( request.getParameter("status") !=null){
	 status =  request.getParameter("status");
	}

	//AccountQuery AQuery = new AccountQuery();
	Double accountblance =0.00;
	String accountrole = null;
	ResultSet rsa = null;
	//accountblance = operator1.getAccountBlance();
//	accountrole = operator1.getAccountRole();
	DecimalFormat strformat = new DecimalFormat("0.00");
	if(operator1!=null){
	//	rsa = AQuery.getAccountBlance(operator1.getAccountId().toString());
		login_name = operator1.getLoginName() == null ? "" : operator1.getLoginName();
		account_login_name = operator1.getAccountloginName() == null ? "" : operator1.getAccountloginName();
	}
	
	if (rsa != null && rsa.next()) {
		accountblance = rsa.getDouble("ACCOUNT_BLANCE");
		accountrole = rsa.getString("ACCOUNT_ROLE");
	}
	
	java.sql.ResultSet rsts = null;
	//TradeHelp tradehelps = new TradeHelp();
	//rsts = tradehelps.getUserPushCount(login_name);
	String a102= "0";
	String ics="0";
	if (rsts != null && rsts.next()) {
	 a102=rsts.getObject("A102_LIMIT") == null ? "0" : rsts.getObject("A102_LIMIT").toString();
	 ics=rsts.getObject("ICS_LIMIT") == null ? "0" : rsts.getObject("ICS_LIMIT").toString();
	 }
	 int zong=Integer.parseInt(a102)+Integer.parseInt(ics);
	 
	 System.out.println(zong);
		  
		 %>
		 
			 
		 
	
    <div class="span3 sidebar">
      <ul class="nav nav-list">
        <li class="divider"></li>
		<li class="nav-header">资源检索</li>
        <li id="ddll"><a href="/search/search_base.jsp">简单检索</a></li>
        <li id="cxtj"><a href="/pagesnew/mystandard/my_standard_search_list.jsp?menu=cxtj">查询统计</a></li>
		<li id="ygwx"><a href="/pagesnew/mystandard/my_buy_standard_list.jsp?menu=ygwx">已购文献</a></li>
                
		<li class="divider"></li>
		<li  class="nav-header">标准跟踪</li>
            <li id="dzbzgz"><a href="/mystandard/userCenter_standardTracking.jsp?menu=dzbzgz">定制标准跟踪</a></li>
            <li id="jsyxsz"><a href="/pagesnew/mystandard/info_push_add_email.jsp?menu=jsyxsz">接收邮箱设置</a></li>
          </ul>
    </div>
   


