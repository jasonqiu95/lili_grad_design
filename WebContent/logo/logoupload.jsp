<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>  
<html>
<head>
<base href="<%=basePath%>">
  <meta charset="UTF-8">
  <title>后台管理</title>
  <link rel="stylesheet" type="text/css" href="css/common.css"/>
  <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>

<div class="container clearfix">

  <!--/sidebar-->
  <div class="main-wrap">

    <img img height="50" width="50" src="logo/logo.png"/>

    <div class="result-wrap">
      <div class="result-content">
        <form action="${pageContext.request.contextPath }/logoupload.htm" method="post" id="myform" name="myform" enctype="multipart/form-data">
          <table class="insert-tab" width="100%">
            <tbody>

            <tr>
              <th><i class="require-red">*</i>缩略图：</th>
              <td><input name="file" type="file"><input type="submit"  value="上传图片"/></td>
            </tr>

            <tr>
              <th></th>
              <td>
                <input class="btn btn-primary btn6 mr10"  name="file" type="file" value="提交" type="submit">
                <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
              </td>
            </tr>
            </tbody></table>
        </form>
      </div>
    </div>
  </div>
  <!--/main-->
</div>
</body>
</html>