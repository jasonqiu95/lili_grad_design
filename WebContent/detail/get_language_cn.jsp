<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%

String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";

String a300 = request.getParameter("a300");

Map<String,String> map = new HashMap<String,String>();
map.put("en","英语");
map.put("zh","汉语");
map.put("ru","俄语");
map.put("de","德语");
map.put("ja","日语");
map.put("fr","法语");
map.put("zz","其他");
map.put("bg","保加利亚语");
map.put("pl","波兰语");
map.put("ko","朝鲜语");
map.put("da","丹麦语");
map.put("nl","荷兰语");
map.put("cs","捷克语");
map.put("ro","罗马尼亚语");
map.put("no","挪威语");
map.put("pt","葡萄牙语");
map.put("sla","斯拉夫语");
map.put("th","泰语");
map.put("es","西班牙语");
map.put("0000","多种语言");
map.put("en;fr","双语(英,法)");
map.put("en;fr;ru","多语(英,法,俄)");
map.put("it","意大利语");
map.put("zh;ja","双语(中,日)");
map.put("en;de","双语(英,德)");
map.put("en;ja","双语(英,日)");
map.put("sv","瑞典语");
map.put("bs","波斯尼亚语");
map.put("sl","斯里兰卡语");
map.put("hu","匈牙利语");
map.put("tr","土耳其语");
map.put("uk","乌克兰语");
map.put("vi","越南语");
map.put("ar","阿拉伯语");
map.put("en;fr;de","多语(英,法,德)");
map.put("en;fr;ru;de","多语(英,法,俄,德)");
map.put("en;ru","双语(英,俄)");

map.put("EN","英语");
map.put("EN-FR","双语(英,法)");
map.put("BILINGUAL","双语(英,法)");
map.put("EN-FR-RU","三语(英,法,俄)");
map.put("EN_D","双语(英,法)");
map.put("FR","法语");
map.put("RU","俄语");
map.put("TRILINGUAL","三语(英,法,俄)");
%>
<%=map.get(a300)==null?a300:map.get(a300) %>
<base href="<%=basePath%>">