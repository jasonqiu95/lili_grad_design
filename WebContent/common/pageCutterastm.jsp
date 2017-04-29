<%@ page contentType="text/html;charset=utf-8"%>
<script language="JavaScript" type="text/javascript">
  	  function check_number(obj){
		  var re = /^[1-9]\d*$/;
	      if (!re.test(obj.value)){
		   	  obj.value="";
		      obj.focus();
		      return false;
	      }
  	  }
  	  function check_event_code(obj){
  	  		if(event.keyCode==13){
  	  			if(obj.value==""){
			   	  obj.value="1";
			      obj.focus();
			      return false;  	  			
  	  			}
  	  		}
  	  }
  	  
  	  function check_value(obj){
  			if(obj.value==""){
		   	  obj.value="1";
		      obj.focus();
		      return false;  	  			
  			}
  	  }
  </script>
<%!public String turn(String str) {

		//下面的代码将字符串以正确方式显示（包括回车，换行，空格）

		while (str.indexOf("\n") != -1) {

			str = str.substring(0, str.indexOf("\n")) + "<br>"
					+ str.substring(str.indexOf("\n") + 1);

		}

		while (str.indexOf(" ") != -1) {

			str = str.substring(0, str.indexOf(" ")) + "&nbsp;"
					+ str.substring(str.indexOf(" ") + 1);

		}

		return str;

	}

	private String pageCutter(String pageUrl, int iPageIndex, int iTotalPage)
	{
		StringBuffer sb = new StringBuffer();
//		如果总页数大于等于1 动态生成一个div
		if(iTotalPage>=1){
		sb.append("<div class='pageBox'><div class='pagination pagination-centered'>");
		if (iTotalPage > 1) {//总页码 大于1 时 进行以下操作
			int iNextPage = 0;
			int iPreviousPage = 0;
		   sb.append("<ul>");
			int startCount = 0;//循环开始位置
			int endCount = 0;//循环结束位置
			//当前页码大于1的时候对 上一页 的操作处理
			if(iPageIndex>1){
				sb.append("<li>");
			  sb.append("<a class='ajax-paqination' href=\'");
                  sb.append(pageUrl.concat(String.valueOf(iPageIndex-1)));
                  sb.append("\'>");
                  sb.append("<<上一页</a>"); 
      			sb.append("</li>");
			}else{//当前页码等于或者小于1的时候 上一页 不加连接
				sb.append("<li");
				sb.append(" class='active' >");
				  sb.append("<a class='ajax-paqination' href=javascript:;>");
                  sb.append("<<上一页</a>"); 
      			sb.append("</li>");
			}

			if(iTotalPage<=5){//总页数小于等于5的时候 进行以下操作
				startCount=1;
				endCount=iTotalPage;
				for(int t=startCount;t<=endCount;t++){
					sb.append("<li");
					if(t==iPageIndex){sb.append(" class='active'");}
					sb.append(">");
					sb.append("<a class='ajax-paqination' href=\'").append(pageUrl.concat(String.valueOf(t))).append("\'>").append(t).append("</a>");
					sb.append("</li>");
				}
				
			}
			//*******************************************
			else{//总页数大于5的时候进行以下操作
				
				if(iPageIndex<4){					
					startCount=1;
					endCount=5;
				}else if(iPageIndex>iTotalPage-4||iPageIndex==iTotalPage){
					startCount=iTotalPage-4;
					endCount=iTotalPage;
				}else{
					startCount=iPageIndex-2;
					endCount=startCount+4;
				} 

				if(iPageIndex>4){
					sb.append("<li>");
					sb.append("<a class='ajax-paqination' href=\'").append(pageUrl.concat(String.valueOf(1))).append("\'>").append(1).append("</a>");
					if(iTotalPage>6){
					sb.append("</li>");
					sb.append("<li><a class='' href='javascript:;'>...</a></li>");												
					}					
				}else if(iPageIndex==4){
					System.out.println("iPageIndex==4");
					sb.append("<li>");
					sb.append("<a class='ajax-paqination' href=\'").append(pageUrl.concat(String.valueOf(1))).append("\'>").append(1).append("</a>");					
					sb.append("</li>");
				}
				//根据判断条件循环输出页码
				for(int t=startCount;t<=endCount;t++){
					sb.append("<li");
					if(t==iPageIndex){sb.append(" class='active'");}
					sb.append(">");
					sb.append("<a class='ajax-paqination' href=\'").append(pageUrl.concat(String.valueOf(t))).append("\'>").append(t).append("</a>");
					sb.append("</li>");
				}
				
				if(iTotalPage>6&iPageIndex<=iTotalPage-4){
					sb.append("<li><a class='' href=javascript:;>...</a></li>");
					sb.append("<li");
					if(iTotalPage==iPageIndex){	sb.append(" class='active'");}
					sb.append(">");
					sb.append("<a class='ajax-paqination' href=\'").append(pageUrl.concat(String.valueOf(iTotalPage))).append("\'>").append(iTotalPage).append("</a>");															
					sb.append("</li>");					
				}else if(iPageIndex<iTotalPage-3){
					sb.append("<li>");
					sb.append("<a class='ajax-paqination' href=\'").append(pageUrl.concat(String.valueOf(iTotalPage))).append("\'>").append(iTotalPage).append("</a>");															
					sb.append("</li>");					
				}

			}
			//下一页 的操作
			if(iPageIndex<iTotalPage){
				sb.append("<li>");
				sb.append("<a class='ajax-paqination' href=\'");
                sb.append(pageUrl.concat(String.valueOf(iPageIndex+1)));
                sb.append("\'>");
                sb.append("下一页>></a>");
				sb.append("</li>");					
			}else{
				sb.append("<li class='active'>");
				sb.append("<a class='ajax-paqination' href=javascript:;>");
                sb.append("下一页>></a>");
				sb.append("</li>");	
			}
			sb.append("</ul>");
		}else if(iTotalPage==1){//总页码为1时 静态显示 上一页  1 下一页 不加任何连接
			sb.append("<ul>");
		  sb.append("<li class='active'><a class='' href='javascript:;'>上一页</a></li>");
		  sb.append("<li class='active'><a class='' href='javascript:;'>1</a></li>");
		  sb.append("<li class='active'><a class='' href='javascript:;'>下一页</a></li>");	
		  sb.append("</ul>");
		}
		sb.append("</div></div>");
		}
		
		
		
		
		return sb.toString();

	
	}%>

