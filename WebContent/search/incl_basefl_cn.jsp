<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%-- <%@ include file="/common/global.jsp" %>  --%>
<%@ page import="com.saas.Interface.UseInterface"%>
<%@ page import="cn.gov.cnis.cssn.wssort.*"%>


<%
int level1 = 0;
String ccscode=null;
String ccsptr= null;
UseInterface get1 = new UseInterface();
Ccs[] rs1=null;
	ccsptr = request.getParameter("ccsptr");
	ccscode=request.getParameter("ccscode");
	level1 =Integer.parseInt(request.getParameter("level")==null?"0":request.getParameter("level"));

	if(ccsptr==null)
	{
		ccsptr="全部";
	level1=1;
	}
	level1++;
 	try{

		if(level1==2)
	  		rs1=get1.getCcsList("");
		else
			rs1=get1.getCcsList(ccscode);
   }catch(Exception e){

   //	System.out.println(e);
		
 }
 	int length=rs1.length;

%>


			<ul class="sortList">
<%
		
if (rs1 != null){
	String icode2=null;
	String name2 = null;
	String cn=null;
	int i3 = 0;
	while(i3<length){
		icode2 = rs1[i3].getId().toString();
		name2 = rs1[i3].getPrt()==null?"":rs1[i3].getPrt();
		cn =rs1[i3].getCn()==null?"":rs1[i3].getCn();
		System.out.println("name2:"+name2);
%>
				<li>
					<%=name2%>
						<%if(level1!=4){
					%>
						<a id="cnorgfl_<%=i3%>" href="#"  flag="2" mylink="select_org_cn_fl.jsp?level=<%= level1%>&ccscode=<%=cn%>&ccsptr=<%=java.net.URLEncoder.encode(name2, "UTF-8")%>">
						<img src="${pageContext.request.contextPath}/asserts/img/folder-btn.png" title="点击进入下一级" border="0"></a>
						&nbsp;&nbsp;
						<a  href="${pageContext.request.contextPath }/search/advanced.htm?cn_typenum=<%= cn%>" target="_parent" id="zjflsearch"><img src="${pageContext.request.contextPath}/asserts/img/magnifier-btn.png" /></a>
		 
					<%		
							}
					%>
		
				</li>

			
<%
		i3++;
	}
}
%>
			</ul>

<%

rs1 = null;
%>


