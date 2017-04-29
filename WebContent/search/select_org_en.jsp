<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="/common/global.jsp" %> 
<%@ page import="com.saas.Interface.UseInterface"%>
<%@ page import="cn.gov.cnis.cssn.wssort.*"%>
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 

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
  obj2 = document.getElementById("inter_stan_typenum");
  objcn = document.getElementById("inter_typenum");
  //v2 = v2+ " " + str+ " ";
  v2 = v2+ "" + str+ "";
  //obj2.value = v2;
  objcn.value = v2;
  
  var o = eval("document.form1.en_name" + cn);
  //alert("o = " + o);

  v3 = v3+ "" + eval("document.form1.en_name" + cn + ".value") + "";
  //objcn.value = v3;
  obj2.value = v3;
  //window.close();


  document.getElementById("interClass").style.display = "none";
  document.getElementById("interClass").className  = "modal hide";
  

/*
	if(document.getElementById("fl_type")){
		document.getElementById("fl_type").value = "2";
		document.formSearchfl.submit();
	}
*/
}

var obj1 = null ;
var objcn  = null;
function select_it(form){

	obj1 = document.getElementById("inter_stan_typenum");
    objcn = document.getElementById("inter_typenum");
	var v="";
    var en="";
	var total = 0;

	var max = document.form1.ckbox.length;
    var h =-1;
	for (var i = 0;  i < max; i++) {
h++;
		if (eval("document.form1.ckbox[" + i + "].checked") == true) {

			v = v + "" + eval("document.form1.ckbox[" + i + "].value") + " ";
            en = en + "" + eval("document.form1.en_name" + h + ".value") + " ";
			total += 1;

		}

	}
	//var sub = v.substring(v.length-3, v.length);

	//if (sub == " "){

	//	v = v.substring(0, v.length-3);

	//}

	//obj1.value = v;
    //objcn.value = en;
    objcn.value = v.substring(0, v.length-1);
    obj1.value = en;

	document.getElementById("interClass").style.display = "none";
	document.getElementById("interClass").className  = "modal hide";

/*
	if(document.getElementById("fl_type")){
		document.getElementById("fl_type").value = "2";
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
	int length=rs.length;
%>

	<form name="form1" method="post">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal">×</button>
    	<h3>按国际标准分类</h3>
    </div>
	<div class="modal-body">
    	<h2><%=icsptr%></h2>
    </div>
    <div class="modal-body">
    	<ul class="sortList">
<%
//vvv 
if (rs != null){
	String icode=null;
	String name = null;
	String code=null;
	String prt=null;
	int i = 0;

	while(i<length){
		icode = rs[i].getId().toString();
		code =rs[i].getIcsn()==null?"":encodeDBToPage(rs[i].getIcsn());
		name = rs[i].getcName()==null?"":encodeDBToPage(rs[i].getcName());
		prt= rs[i].getPrt()==null?"":encodeDBToPage(rs[i].getPrt());

%>

            <li>
				<input type="checkbox" id="ckbox" name="ckbox" value="<%=code%>"/>
				<label for="int01">
					 <a   onclick="select_one_it('<%=code%>','<%=i%>');"><%=code%>&nbsp;&nbsp;<%=name%></a>
					<%
						if(level!=4)
						{
					%>
					<a id="orgfl_<%=i%>" href="#interClass"  flag="2" mylink="select_org_en.jsp?level=<%= level%>&icscode=<%=code%>&icsptr=<%=java.net.URLEncoder.encode(prt, "UTF-8")%>">
						<img src="${pageContext.request.contextPath}/asserts/img/folder-btn.png" title="点击进入下一级" border="0">
					</a>
					<% }%>

				</label>
				<input id="en_name<%=i%>" type="hidden" name="en_name<%=i%>" value="<%=prt%>"/>
			
			
			</li>
<%
		i++;
	}
}

%>
        </ul>
    </div>
    <div class="modal-footer">
        <div class="allBox"><input type="checkbox" id="checkall" name="checkall" onclick="select_all(this.form);"/><label for="all01">全选</label></div>
		<%if(level!=2){%>
		<a class="btn btn-primary" id="orgTitle" href="#interClass" mylink="">返回上一级</a>
		<%}%> 
        <a href="#" class="btn btn-primary" data-dismiss="modal" onclick="select_it(this.form)">确定</a>
    </div>
	</form>
<%
if(rs != null)
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
			str = topLink1;
		}
		htmlobj = $.ajax({url:str,async:false});
		$("#interClass").empty();
		$("#interClass").html(htmlobj.responseText);
	
	});

});
</script>