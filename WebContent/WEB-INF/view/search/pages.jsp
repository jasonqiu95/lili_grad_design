<!-- 显示页码，显示效果类似：
 首页 上一页 1 2 3 4 5 … 12 下一页  尾页 共116条 每页10条 到第_页-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 下面的变量声明用作测试 -->
<%! int TotalPage=6,PageIndex=1,RecordCount=59;String iPageSize = "10";%>
<%
if (TotalPage > 1)
{
%>
	<div class="pageBox">
		<div class="pagination pagination-centered">
<%
	int startPi = 0;
	int endPi = 0;
	if(TotalPage > 6)
	{

		if(PageIndex < 4)
		{
			startPi = 1;
			endPi = 5;
		}
		else if(PageIndex >= TotalPage - 2)
		{
			startPi = TotalPage - 4;
			endPi = TotalPage;
		}
		else
		{
			startPi = PageIndex - 2;
			endPi = PageIndex + 2;
		}
	}
	else
	{
		startPi = 1;
		endPi = TotalPage;
	}

%>
			<ul>
				<li>
					<%if (PageIndex > 1) {%>
					<a class="ajax-paqination" onclick="page(1)" href="javascript:void(0)">&laquo;首页</a>
					<%} else {%>
					<a style="color:gray">&laquo;首页</a>
					<%}%>
					
					<%if (PageIndex > 1) {%>
					<a class="ajax-paqination" onclick="page(<%=PageIndex - 1%>)" href="javascript:void(0)">&laquo;上一页</a>
					<%} else {%>
					<a style="color:gray">&laquo;上一页</a>
					<%}%>
				</li>
				
				<%for (int t = startPi; t <= endPi; t++) {%>
				<li <%if(t==PageIndex){%> class="active" <%}%>>
					<a class="ajax-paqination" onclick="page(<%=t%>)"
						href="javascript:void(0)"><%=t%>
					</a>
				</li>
				<%}%>
				
				<%if(TotalPage > 7 && TotalPage > (PageIndex + 2)) {%>
				<li>
					<a class="" href="javascript:void(0);">...</a>
				</li>
				<li <%if(TotalPage==PageIndex){%> class="active" <%}%>>
					<a class="ajax-paqination" onclick="page(<%=TotalPage%>)"
						href="javascript:void(0)"><%=TotalPage%>
					</a>
				</li>
				<%}%>
				
				<li>
					<%
					if (PageIndex < TotalPage) {
						if(PageIndex==0){
							PageIndex =1;
						}
					%>
					<a class="ajax-paqination" onclick="page(<%=PageIndex + 1%>)"
						href="javascript:void(0)">下一页&raquo;</a>
					<a class="ajax-paqination" onclick="page(<%=TotalPage%>)"
						href="javascript:void(0)">尾页&raquo;</a>
					<%} else {%>
					<a style="color:gray">下一页&raquo;</a>
					<a style="color:gray">尾页&raquo;</a>
					<%}%>
				</li>
				<li><a>共<%=RecordCount%>条</a></li>
				<li>
					<span style="line-height:30px;color:#0088CC;">每页&nbsp;&nbsp;
						<select style="width:50px;height:25px;line-height:25px;margin-top:2px" 
								onchange="changePageSize(this.value);">
							<option value="10" <%if(iPageSize.equals("10")) {%>selected="selected"<%} %>>10</option>
							<option value="20" <%if(iPageSize.equals("20")) {%>selected="selected"<%} %>>20</option>
							<option value="30" <%if(iPageSize.equals("30")) {%>selected="selected"<%} %>>30</option>
						</select>
					</span>
				</li>
<!-- 				<li> -->
<!-- 					<a>到第&nbsp;<input id="dijiye" type="text" style="margin:0;width:28px;"/>&nbsp;页&nbsp;&nbsp; -->
<!-- 						<button type="button" onclick="goTo($('#dijiye').val());" style="background:#EAEAEA;border:none;">确定</button> -->
<!-- 					</a> -->
<!-- 				</li> -->
				
			</ul>
		</div>
	</div>
<%
}
%>
