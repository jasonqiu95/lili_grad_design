<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="com.estarcom.xflow.config.SystemManager" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.saas.Interface.UseInterface"%>
<%@ page import="cn.gov.cnis.cssn.wssort.*"%>

<%
  
  	int level = 0;
	String icscode=null;
	String icsptr= null;
	icscode = request.getParameter("icscode");
	level =Integer.parseInt(request.getParameter("level")==null?"0":request.getParameter("level"));
	icsptr = request.getParameter("icsptr");
	if(icsptr==null)
		{
		icsptr="全部";
		level=1;
		}
	level++;
  UseInterface get = new UseInterface();
  Ics[] rs=null;
  try{

          
		rs=get.getIcsList(icscode);

   
	
   }catch(Exception e){

   //	System.out.println(e);

 }
	int lengthe=rs.length;
%>


    		<ul class="sortList">
<%
if (rs != null){
	String icode=null;
	String name1 = null;
	String code1=null;
	String prt=null;
	int i2 = 0;

	while(i2<lengthe){
		icode = rs[i2].getId().toString();
		code1 =rs[i2].getIcsn()==null?"":rs[i2].getIcsn();
		name1 = rs[i2].getcName()==null?"":rs[i2].getcName();
		prt= rs[i2].getPrt()==null?"":rs[i2].getPrt();

%>


					<li><%=code1%>&nbsp;&nbsp;<%=name1%>
					<%
						if(level!=4)
						{
					%>
						<a id="enorgfl_<%=i2%>" href="#interClass"  flag="2" mylink="select_org_en_fl.jsp?level=<%= level%>&icscode=<%=code1%>&icsptr=<%=java.net.URLEncoder.encode(prt, "UTF-8")%>">
							<img src="${pageContext.request.contextPath}/asserts/img/folder-btn.png" />
						</a>
						&nbsp;&nbsp;
						<a  href="${pageContext.request.contextPath }/search/advanced.htm?en_typenum=<%=java.net.URLEncoder.encode(prt, "UTF-8")%>"  id="zjflsearch" target="_parent"><img src="${pageContext.request.contextPath}/asserts/img/magnifier-btn.png" /></a>
					<%
							}
					%>

			
					</li>
<%
			i2++;
	}
}
%>
        </ul>

<%

rs = null;
%>

