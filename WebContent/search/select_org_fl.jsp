<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.estarcom.xbean.*"%>
<%@ page import="com.estarcom.cnis.cssn.salesystem.*"%>
<%@ page import="com.estarcom.cnis.cssn.search.search.*"%>
<%@ page
	import="com.estarcom.cnis.cssn.salesystem.trssearch.StandardSearch"%>

<html>
	<head>
		<link href="css/css_kzjz.css" rel="stylesheet" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<title>国家标准文献服务绿色通道</title>


		</style>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
	</head>
	  <% 
        response.setHeader("Pragma", "No-cache"); 
        response.setHeader("Cache-Control", "No-cache"); 
        response.setDateHeader("Expires", 0); 
    %> 
	<%
		String search_trs = "";
		search_trs = request.getParameter("search_trs");
		System.out.println("search_trs:"+search_trs);
		if (search_trs == null || search_trs.equals(""))
			search_trs = "";
		else
			search_trs = new String(search_trs.trim()
			.getBytes("ISO-8859-1"), "GBK");
		StandardSearch standsearch = null;
		standsearch = (StandardSearch) session
				.getAttribute("StandardSearch");
		if ((StandardSearch) session.getAttribute("StandardSearch_mile") != null) {
			standsearch = (StandardSearch) session
			.getAttribute("StandardSearch_mile");
			//System.out.println("1二次查询条件"+standsearch);
		} else {
			standsearch = (StandardSearch) session
			.getAttribute("StandardSearch");
			//System.out.println("2初始查询条件"+standsearch);
		}
		// request.getSession().setAttribute("StandardSearch_mile", standsearch);//保存最初检索条件

		SearchCommand sc = null;
		if ((SearchCommand) session.getAttribute("SearchCommand_mile") != null) {
			sc = (SearchCommand) session.getAttribute("SearchCommand_mile");
			//System.out.println("1二次查询条件");
		} else {
			//System.out.println("2初始查询条件");
			sc = (SearchCommand) session.getAttribute("SearchCommand");
		}
		request.getSession().setAttribute("SearchCommand_mile", sc);//保存最初检索条件

		String zfk = null;
		zfk = request.getParameter("zfk");
		//System.out.println("====zfk===="+zfk);
		//if(zfk==null||zfk.equals(""))zfk = "";
		String type = "";
		String direct = "";
		String direct_type = request.getParameter("direct_type");
		if (direct_type == null || direct_type.equals(""))
			direct_type = "";
		type = request.getParameter("type");
		if (type == null || type.equals(""))
			type = "";


		String search_condition = null;
		String direct1 = JspHelp.getURL("nvsearch","search_base","SevSimpleSearch");
		Hashtable hash = null;
		Hashtable hash_Old = null;//System.out.println("------Hashtable---"+(String)session.getAttribute("Second")+"---");
		if ((String) session.getAttribute("Second") != null) {
			//System.out.println("------Hashtable---1---");
			hash = (Hashtable) session.getAttribute("hash");
		} else {
			//System.out.println("------Hashtable---2---");
			hash = (Hashtable) session.getAttribute("hash_Old");
		}
		hash_Old = (Hashtable) session.getAttribute("hash_Old");
		System.out.println("hash_Old ------------------------------ " + hash_Old);
	%>
	<body>

		<form id="form1" name="formchSearch" METHOD="POST"
			ACTION="<%=direct1%>"
			onSubmit="return submit_check(document.formchSearch.check_a102,document.formchSearch.check3)"
			style="margin:0px;padding:0px;">
			
		<div class="modal-header" style="height:20px;">
			<label></label>
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>品种筛选</h3>
		</div>
<div style="max-height:240px; overflow-y: auto;">
			<table width="300" cellpadding="0" cellspacing="0" class="h12l24a"
				id="targetTable" style="margin-left:20px;">
				<!-- table width="98%" align="center" cellpadding="0" cellspacing="0" bgcolor="#C6E1F5" class="h12l24a" id="targetTable"  style="border:1px solid #cccccc;padding:3px" -->

				<%
						try {
						NvElecEntityHelp hfo = new NvElecEntityHelp();
						NvElecEntityHelp rfo = new NvElecEntityHelp();
						ResultSet Rfo = null;
						ResultSet RInfo = null;

						String a102_new = null;
						String orgcode = null;
						String Description = null;
						String con_num = null;

						Set keys = hash.keySet();
						Iterator ki = keys.iterator();
						int hash_i = 0;
						while (ki.hasNext()) {
							hash_i++;
							String keyName = ki.next().toString();

							a102_new = keyName;
							con_num = (String) hash.get(keyName);

							Rfo = rfo.findA104ByBIssuer(a102_new);
							if (Rfo != null) {
						while (Rfo.next()) {
							orgcode = Rfo.getObject("ORGCODE") == null ? ""
							: Rfo.getString("ORGCODE");
							Description = Rfo.getObject("DESCRIPTION") == null ? ""
							: Rfo.getString("DESCRIPTION");
				%>
				<tr onum="<%=con_num%>">

					<td valign="top" class="h12l24a">
						<input id="ckbox" type="checkbox" name="check_a102"
							value="<%=a102_new%>"
							<%  if((String)session.getAttribute("Second3")!=null){
					        String keyName_second = null;
						  	Set keys_second = hash_Old.keySet();
							Iterator ki_second = keys_second.iterator();
							while (ki_second.hasNext()) {
								keyName_second = ki_second.next().toString();
							
						  if(keyName_second.equals(a102_new)){
						  %>
							checked="checked" <% 
						  }
						 }
						}
					    %>>
					</td>
					<td valign="middle">
						<%=orgcode%>
					</td>

					<td  valign="middle">
						<%=Description%>
					</td>
					<td valign="middle">
						<%=con_num%>条
					</td>
				</tr>
				<%
							}
							}
						}
					} catch (Exception e) {
						e.printStackTrace();

					}
				%>
				<input type="hidden" name="radiobutton" value="0">
				<input type="hidden" name="PageSize" value="10">
				<input type="hidden" name="show" value="10">
				<input type="hidden" name="paixu" value="asc">
				<input type="hidden" name="orderby" value="sort_number">
				<input type="hidden" name="direct_type" value="<%=direct_type%>">
				<input type="hidden" name="type" value="<%=type%>">
				<input type="hidden" name="temp_where" value="<%=search_trs%>">
				<input type="hidden" name="pi" value="1">
				
				

			</table>
</div>			
		<div class="modal-footer">
			<a href="#" class="btn btn-primary" data-dismiss="modal" onClick="select_it(this.form)">确定</a>
		</div>
		</form>
		<%
		standsearch = null;
		%>

<script style="text/javascript">
	var obj1 = null ;
	function select_it(form){
	     
		obj1 = document.getElementById("dbtype_1");
	    
	     
		var v="";
		var total = 0;
		var max = document.form1.ckbox.length;
		if (max > 0){
			for (var i = 0;  i < max; i++) {
				if (eval("document.form1.ckbox[" + i + "].checked") == true) {
					v = v + "'" + eval("document.form1.ckbox[" + i + "].value") + "' + ";
					total += 1;
				}
			}
		}else{
			if (document.form1.ckbox.checked == true){
				v = v + "'" + document.form1.ckbox.value + "'";
			}
		}
		var sub = v.substring(v.length-3, v.length);
		if (sub == " + "){
			v = v.substring(0, v.length-3);
		}
	
		
		obj1.value = v;
		//window.document.getElementById('a104').value = v;
		//window.close();
		if(document.getElementById("fl_type")){
			document.getElementById("fl_type").value = "3";
			if(v != ""){
				document.formSearchfl.submit();
			}
		}
		document.getElementById("interClass").style.display = "none";
		document.getElementById("interClass").className  = "modal hide";
	
	
	}	
</script>
	</body>
</html>
