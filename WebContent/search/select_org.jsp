<%@page contentType="text/html;charset=utf-8"%>

<%@ page import="com.estarcom.cnis.cssn.salesystem.trssearch.BIssuerHelp" %>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.saas.Interface.UseInterface"%>
<%@ page import="cn.gov.cnis.cssn.wssort.*"%>
<%
String idomain = request.getParameter("domain");
String isubType = request.getParameter("stype");
String domain_sub;
if(isubType==null)
	domain_sub=idomain;
else
	domain_sub=idomain+"-"+isubType;
UseInterface get = new UseInterface();
StandardSort[] rs=get.getStandardSortList(domain_sub);
int length=rs.length;
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>
<!--
<link href="../../css/yq.css"  type="text/css"  rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="../css/design.css" type="text/css"/>
<link rel="stylesheet" href="../css/search.css" type="text/css"/>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.scroll.js"></script>
-->



<SCRIPT LANGUAGE="JavaScript">

var obj1 = null ;
function select_it(form){
     
	obj1 = document.getElementById("dbtype");
    
     
	var v="";
	var total = 0;
	var max = document.form1.ckbox.length;
	if (max > 0){
		for (var i = 0;  i < max; i++) {
			if (eval("document.form1.ckbox[" + i + "].checked") == true) {
				v = v + eval("document.form1.ckbox[" + i + "].value") + " + ";
				total += 1;
			}
		}
	}else{
		if (document.form1.ckbox.checked == true){
			v = v  + document.form1.ckbox.value ;
		}
	}
	var sub = v.substring(v.length-3, v.length);
	if (sub == " + "){
		v = v.substring(0, v.length-3);
	}

	
	obj1.value = v;
	//window.close();
	document.getElementById("interClass").className  = "modal hide";

/*
	if(document.getElementById("fl_type")){
		document.getElementById("fl_type").value = "3";
		if(v != ""){
			document.formSearchfl.submit();
		}
	}
*/

}	

function select_all(form){
	var v="";
	var total = 0;
	var max = document.form1.ckbox.length;
	if(form.checkall.checked){
			for (var i = 0;  i < max; i++) {

				document.form1.ckbox[i].checked = true;

			}
		}else{
			for (var i = 0;  i < max; i++) {

				document.form1.ckbox[i].checked = false;

			}
		}
}	

//-->
</SCRIPT>


<form name="form2" method="post" action="select_org.jsp">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">×</button>
	<h5>
		<a id="select_org" href="#interClass" mylink="select_org.jsp">全部</a> &nbsp; &nbsp; 
		<a id="select_org" href="#interClass" mylink="select_org.jsp?domain=D_NATIVE">国内</a> &nbsp; 
		<a id="select_org" href="#interClass" mylink="select_org.jsp?domain=D_NATIVE&stype=ST_N_SBTS">国内-国家</a> &nbsp; 
		<a id="select_org" href="#interClass" mylink="select_org.jsp?domain=D_NATIVE&stype=ST_N_DB">国内-地方</a> &nbsp; 
		<a id="select_org" href="#interClass" mylink="select_org.jsp?domain=D_NATIVE&stype=ST_N_CSIC">国内-行业</a> &nbsp; &nbsp; <!--br/>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;-->
		<a id="select_org" href="#interClass" mylink="select_org.jsp?domain=D_FOREIGN">国外</a> &nbsp; 
		<a id="select_org" href="#interClass" mylink="select_org.jsp?domain=D_FOREIGN&stype=ST_F_INTER">国外-国际</a> &nbsp; 
		<a id="select_org" href="#interClass" mylink="select_org.jsp?domain=D_FOREIGN&stype=ST_F_NATIONAL">国外-国家</a> &nbsp; 
		<a id="select_org" href="#interClass" mylink="select_org.jsp?domain=D_FOREIGN&stype=ST_F_INSTITUTE">国外-学协会</a>
	</h5>
</div>
</form>

<form name="form1" method="post">
<div class="modal-body">
	<ul class="sortList">
<%
if (rs != null){
	  String icode=null;
	  String name = null;
	  String domain = null;
	  String subType = null;
	  String secrecy = null;
	  String showcode=null;
	  int i = 0;
	while(i<length){

		icode = rs[i].getId();
		System.out.println("idcode:"+icode+"len:"+length);
		name = rs[i].getDescription()==null?"":rs[i].getDescription();
		domain = rs[i].getDomain()==null?"":rs[i].getDomain();
		subType = rs[i].getSubType()==null?"": rs[i].getSubType();
/* 		secrecy =rs[i].get==null?"":rs.getObject("SECRECY").toString();
		showcode = rs.getObject("ORGCODE")==null?"":rs.getObject("ORGCODE").toString(); */
%>
		<li>
			<input type='checkbox' name="ckbox" value="<%=icode%>">&nbsp;<label for="fb01"><%=name%>&nbsp;<%=icode%></label>
		</li>
<%
		i++;
	}
}


%>
	</ul>
</div>
<div class="modal-footer">
	 <div class="allBox">
		<input type="checkbox" id="all" name="checkall" onclick="select_all(this.form);"/><label for="all01">全选</label>
	</div>
	<a href="#" class="btn btn-primary" data-dismiss="modal" onClick="select_it(this.form)">确定</a>
</div>
</form>
<%
rs = null;
%>

<script type="text/javascript">

$(document).ready(function(){
	$("#rolling").Scroll({line:1,speed:500,timer:1000});

	$("a[id=select_org]").each(function(){
		$(this).click(function(e){
			var str = $(this).attr("mylink");
			htmlobj = $.ajax({url:str,async:false});
			$("#interClass").empty();
			$("#interClass").html(htmlobj.responseText);
		});
	});


});
</script>