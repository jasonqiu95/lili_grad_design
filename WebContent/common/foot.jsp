<!-- 计数器 -->
<%@ page import="java.io.*" %> 
<%! int number=9800000; 
File file=new File("countNumber.txt") ; 
synchronized void countPeople()//计算访问次数的同步方法 
{ if(!file.exists()) 
{ number++; 
try { file.createNewFile(); 
// FileInputStream 、FileOutputStream 以字节为单位的输入/出类 
FileOutputStream out=new FileOutputStream(file); 
DataOutputStream dataOut=new DataOutputStream(out); 
dataOut.writeInt(number); 
out.close(); 
dataOut.close(); 
} 
catch(IOException ee){} 
} 
/* DataInputStream和DataOutputStream可提供一些对Java基本数据类型像int、double和boolean等的读写方法。 
什么时候用？ 
有时只是要存储一个对象的成员数据，而不是整个对象 
的信息，成员数据的类型又是Java的基本数据类型，这 
样就可以使用DataInputStream、DataOutputStream来方便的写入或读出数据。 */ 

else{ 
try{ 
FileInputStream in=new FileInputStream(file); 
DataInputStream dataIn=new DataInputStream(in); 
number=dataIn.readInt(); 
number++; 
in.close(); 
dataIn.close(); 

FileOutputStream out=new FileOutputStream(file); 
DataOutputStream dataOut=new DataOutputStream(out); 
dataOut.writeInt(number); 
out.close(); 
dataOut.close(); 
} 
catch(IOException ee){} 
} 
} 
%> 
<% 
//实现同一用户多次访问计数器只加一次 
String stra=(String)session.getAttribute("count"); 
if(stra==null) 
{ countPeople(); 
String personCount=String.valueOf(number ); 
session.setAttribute("count",personCount); 
} 
%> 

<div style="text-align:center;margin: 0px auto;  margin-top:10px;   color: #373938;" >
<h5 style=" font-weight: normal;  "> 欢迎使用 </h5>
  <h5 style=" font-weight: normal; padding: 10px; "> 访问次数：<%=(String)session.getAttribute("count")%> </h5> 
</div>
<!--javascript区-->

<script type="text/javascript" src="${pageContext.request.contextPath}/asserts/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asserts/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asserts/js/jquery.scroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asserts/js/jquery.placeholder.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asserts/js/bootstrap-tooltip.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asserts/js/bootstrap-popover.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asserts/js/application.js"></script>
 
<!--script type="text/javascript" src="../js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="../js/bootstrap-tab.js"></script>
<script type="text/javascript" src="../js/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="../js/jquery.banner.js"></script>
<script type="text/javascript" src="../js/ie6.min.js"></script-->
 
<script type="text/javascript">
//字符串转ascii
this.StringToAscII = function(){
	if(arguments.length < 2)return;
	var str = arguments[0];
	var splitstr = arguments[1];
	var ascstr = "";
	for(i=0;i<str.length;i++){
		if(ascstr==""){
			ascstr = str.charCodeAt(i);
		}else{
			ascstr += splitstr + str.charCodeAt(i);
		}
	}
	return ascstr;
}
function websech_submit(){
	var fs = document.websearch.focusSearch.value;

	if(fs != "" && fs != "站内检索..."){
		document.websearch.showSearch.value = StringToAscII(fs,'X');//转化
	}
	document.websearch.submit();
}
</script>

