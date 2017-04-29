<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="com.estarcom.cnis.cssn.search.search.PrtQuery" %>
<%@ page import="com.estarcom.xbean.common.InfoType" %>
<%@ page import="com.saas.Interface.UseInterface"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="/common/global.jsp" %> 
<%@ page import="cn.gov.cnis.cssn.wssort.*"%>
<!-- 新添加的模块 -->
<!--
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="../css/design.css" type="text/css"/>
<link rel="stylesheet" href="../css/search.css" type="text/css"/>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.scroll.js"></script>
-->
<script type="text/javascript">


function select_one_it(str,cn){
 var v2="";
 var v3 = "";
 var obj2 = null ;
 var objcn  = null;
  obj2 = document.getElementById("chin_standard_typenum");
  objcn = document.getElementById("chin_typenum");
  //v2 = v2+ " " + str+ " ";
  v2 = v2+ "" + str+ "";
  //obj2.value = v2;
  objcn.value = v2;
  v3 = v3+ "" + eval("document.form1.cn_name" + cn + ".value") + "";
  //objcn.value = v3;
  obj2.value = v3;
  //window.close();
  document.getElementById("interClass").style.display = "none";
  document.getElementById("interClass").className  = "modal hide";
  

/*
  	if(document.getElementById("fl_type")){
		document.getElementById("fl_type").value = "1";
		document.formSearchfl.submit();
	}
*/
}


var obj1 = null ;
var objcn  = null;
function select_it(form){

	obj1 = document.getElementById("chin_standard_typenum");
    objcn = document.getElementById("chin_typenum");

	var v="";
    var cn="";

	var total = 0;

	var max = document.form1.ckbox.length;
    var h =-1;
	for (var i = 0;  i < max; i++) {
		h++;
		if (eval("document.form1.ckbox[" + i + "].checked") == true) {
			v = v + "" + eval("document.form1.ckbox[" + i + "].value") + " ";
			cn = cn + "" + eval("document.form1.cn_name" + h + ".value") + " ";

			total += 1;

		}

	}

	//var sub = v.substring(v.length-3, v.length);

	//if (sub == " + "){

	//	v = v.substring(0, v.length-3);

	//}

//	obj1.value = v;
//	objcn.value = cn;
	objcn.value = v.substring(0, v.length-1);
	obj1.value = cn;

//alert("v = " + v);
	//window.close();
	document.getElementById("interClass").style.display = "none";
	document.getElementById("interClass").className  = "modal hide";

/*
	if(document.getElementById("fl_type")){
		document.getElementById("fl_type").value = "1";
		if(total > 0){
			document.formSearchfl.submit();
		}
	}

*/
}	



function select_all(form){

	var v="";

	var total = 0;

	if(form.ckbox != null){
		var max = form.ckbox.length;

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

}	

function clear_all(form){

	var v="";

	var total = 0;

	var max = form.ckbox.length;

	for (var i = 0;  i < max; i++) {

		document.form1.ckbox[i].checked = false;

	}

}	



//-->
   
   
//-->
</script>
<%
	int level = 0;
	String ccscode=null;
	String ccsptr= null;
  
  UseInterface get = new UseInterface();
  Ccs[] rs=null;
  	ccsptr = request.getParameter("ccsptr");
  	ccscode=request.getParameter("ccscode");
	level =Integer.parseInt(request.getParameter("level")==null?"0":request.getParameter("level"));
	if(ccsptr==null)
	{
		ccsptr="全部";
	level=1;
	}
   level++;
  	System.out.println("ccsptr:"+ccsptr); 
  	try{

		if(level==2)
	  		rs=get.getCcsList("");
		else
			rs=get.getCcsList(ccscode);
   }catch(Exception e){

   //	System.out.println(e);

 }

  int length=rs.length;
  
%>
<!-- 新添加的模块 -->
<%//
//ResultSet rs = null;
//InfoTypeHelp help = new InfoTypeHelp();

//rs = help.findBccsByDomainAndSubType(1, 1000, grflagA, grflagB, grflagC);

%>

<form name="form1" method="post">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal">×</button>
    	<h3>按中国标准分类</h3>
    </div>
	<div class="modal-body">
    	<h2><%=ccsptr %></h2>
    </div>
	<div class="modal-body">
		<ul class="sortList">

<%

if (rs != null){
	String icode=null;
	String name = null;
	String cn=null;
	int i = 0;
	while(i<length){

		icode = rs[i].getId().toString();
		name = rs[i].getPrt()==null?"":rs[i].getPrt();
		cn =rs[i].getCn()==null?"":rs[i].getCn();
	%>
	  <li>
	    <input type='checkbox' id="ckbox" name="ckbox" value="<%=name%>">
		<input id="cn_name<%=i%>" type="hidden" name="cn_name<%=i%>" value="<%=name%>"/>
		<label for="int01">
		<a  onclick="select_one_it('<%=cn%>','<%=i%>');">
		<%=name%>
		</a>
		<%if(level!=4){
		 %>
		 <a id="orgfl_<%=i%>" href="#interClass"  flag="2" mylink="select_org_cn.jsp?level=<%= level%>&ccscode=<%=cn%>&ccsptr=<%=java.net.URLEncoder.encode(name, "UTF-8")%>">
		<img src="${pageContext.request.contextPath}/asserts/img/folder-btn.png" title="点击进入下一级" border="0">
		</a>
		<% }%>
		</label>
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
			<input type="checkbox" id="checkall" name="checkall" onclick="select_all(this.form);"/><label for="all01">全选</label></div>
			
			<% if(level!=2){%>
			<a class="btn btn-primary" id="orgTitle" href="#interClass" mylink="">返回上一级</a>
			<%}%> 
			<a href="#" class="btn btn-primary" data-dismiss="modal" onclick="select_it(this.form)">确定</a>
    </div>
	</form>

<%
rs = null;
%>


<script type="text/javascript">

$(document).ready(function(){
	$("#rolling").Scroll({line:1,speed:500,timer:1000});

	//if($("#orgfl_0").length > 0){
		$("a[id^=orgfl_]").each(function(){
				$(this).click(function(e){
					var str = $(this).attr("mylink");
					var flag = $(this).attr("flag");
					//alert("flag = " + flag);
					if(flag == "2"){
						topLink2 = str;
					}
					tflag = flag;
					//alert(str);
					htmlobj = $.ajax({url:str,async:false});
					$("#interClass").empty();
					$("#interClass").html(htmlobj.responseText);
				
				});
			});
	//}

	$("#orgTitle").click(function(e){
		var str;
		//alert("topLink2 = " + topLink2);
		if(tflag == "3"){
			str = topLink2;
			tflag = "0";
		}else{
			str = topLink3;
		}
		htmlobj = $.ajax({url:str,async:false});
		$("#interClass").empty();
		$("#interClass").html(htmlobj.responseText);
	
	});

	$(".close").click(function(e){
		document.getElementById("interClass").style.display = "none";
  		document.getElementById("interClass").className  = "modal hide";
	});

});
</script>