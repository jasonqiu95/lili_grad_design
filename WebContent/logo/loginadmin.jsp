<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.estarcom.cnis.cssn.common.User,java.util.Calendar,java.util.GregorianCalendar" %>
 <%
	String path = request.getContextPath();
    String tenantname="";
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String para=request.getParameter("from");
	if(para==null)
		para="default";
	tenantname=(String)session.getAttribute("tenantname");
%>  

<!DOCTYPE html>
<html>
<head>
    <title>用户登录,管理员注册</title>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="asserts/css/bootstrapValidator.css"/>

    <script type="text/javascript" src="asserts/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="asserts/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="asserts/js/bootstrapValidator.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <section>
                <div class="col-lg-8 col-lg-offset-2 col-sm-8 col-sm-offset-2">
                    <div class="page-header">
                        <h2>欢迎使用文献检索中心</h2>
                    </div>
                    <ul  id="myTab" class="nav nav-tabs">
                        <li class="active"><a href="#info-tab" data-toggle="tab">管理员登录界面 <i class="fa"></i></a></li>
                        <li><a href="#address-tab" data-toggle="tab">注册 <i class="fa"></i></a></li>
                    </ul>

                    
                        <div class="tab-content">
                            <div class="tab-pane active" id="info-tab">
                            	 <% if(!para.contains("wronglogin"))
		                        	{
		                        	   if(!para.contains("registersuccess"))
		                        	   {
		                        	%>
			                     <div class="alert alert-info" role="alert" style="margin-top: 30px;">
			                     <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								 请输入您的管理员用户名和密码
								</div>
								<%
		                        	}
		                           	else
		                           	{
									%>
								<div class="alert alert-success alert-dismissible" role="alert" style="margin-top: 30px;">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								注册成功，<strong>请登录！</strong>
								</div>
									<%
		                        	}
		                        	}
		                           	else
		                           	{
									%>
								<div class="alert alert-danger alert-dismissible" role="alert" style="margin-top: 30px;">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								错误的用户名或密码，<strong>请重试！</strong>
								</div>
								<%} %>
								<form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/loginadmin.htm?from=<%=para%>" style="margin-top: 30px;">
			                        <div class="form-group">
			                            <label class="col-lg-3 control-label">用户名</label>
			                            <div class="col-lg-5">
			                                <input type="text" class="form-control" placeholder="请输入您的用户名 " name="username" />
			                            </div>
			                        </div>
									<div class="form-group">
						            	<label class="col-lg-3 control-label">密码</label>
						            		<div class="col-lg-5">
                        						<input type="password" class="form-control" name="password" />
                  							</div>
               						</div>
			                        <div class="form-group">
			                            <div class="col-lg-9 col-lg-offset-3">
			                                <button type="submit" class="btn btn-primary">登录</button>
			                            </div>
			                        </div>
		                 	   </form>
                            </div>

                            <div class="tab-pane" id="address-tab">
                            <% if(!para.contains("wrongrname"))
		                        {
		                        	%>
		                           <div class="alert alert-info" role="alert" style="margin-top: 30px;">
					                   <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										 请按照要求输入以下信息
								  </div>
								  <%
		                        }
                            	else
                            	{
								  %>
								  <div class="alert alert-danger" role="alert" style="margin-top: 30px;">
					                   <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										用户名已存在
								  </div>
								  <%} %>
	                            <form id="defaultForm1" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/register.htm?from=register" style="margin-top: 30px;">
	                            		<div class="form-group">
									     <label class="col-lg-3 col-sm-3 control-label">单位</label>
									    <div class="col-lg-5 col-sm-5">
									      <p class="form-control-static"><span class="label label-info"><%= tenantname%></span></p>
									    </div>
									    </div>
				                        <div class="form-group">
				                            <label class="col-lg-3  col-sm-3 control-label">用户名</label>
				                            <div class="col-lg-5 col-sm-5">
				                                <input type="text" class="form-control" name="username" />
				                            </div>
				                        </div>
				                        <div class="form-group">
				                            <label class="col-lg-3  col-sm-3 control-label">真实姓名</label>
				                            <div class="col-lg-5 col-sm-5">
				                                <input type="text" class="form-control" name="realname" />
				                            </div>
				                        </div>
				                        <div class="form-group">
				                            <label class="col-lg-3  col-sm-3 control-label">电子邮件</label>
				                            <div class="col-lg-5 col-sm-5">
				                                <input type="text" class="form-control" name="email" />
				                            </div>
				                        </div>
										<div class="form-group">
			                                <label class="col-lg-3 col-sm-3 control-label">密码</label>
			                                <div class="col-lg-5 col-sm-5">
			                                    <input type="password" class="form-control" name="password" />
			                                </div>
			                            </div>
			
			                            <div class="form-group">
			                                <label class="col-lg-3 col-sm-3 control-label">确认密码</label>
			                                <div class="col-lg-5 col-sm-5">
			                                    <input type="password" class="form-control" name="confirmPassword" />
			                                </div>
			                            </div>
				                        <div class="form-group">
				                            <div class="col-lg-9 col-lg-offset-3 col-sm-9 col-sm-offset-3">
				                                <button type="submit" class="btn btn-primary">注册</button>
				                            </div>
				                        </div>
			                 	   </form>
                            
                            </div>
                               
                               
                            </div>
                        </div>
                      

            </section>
        </div>
    </div>

<script type="text/javascript">
$(function () {
	var page="<%=para%>";
	if(page=="wrongrname")
		
    	$('#myTab li:eq(1) a').tab('show');
	else
		;
 });
$(document).ready(function() {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    }
                }
            },
	        password: {
	            validators: {
	                notEmpty: {
	                    message: 'The password is required and cannot be empty'
	                }

	            }
	        }
        }
    });
    $('#defaultForm1').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    different: {
                        field: 'password',
                        message: 'The username and password cannot be the same as each other'
                    }
                }
	            },
	            email: {
	                validators: {
	                    notEmpty: {
	                        message: 'The email address is required and can\'t be empty'
	                    },
	                    emailAddress: {
	                        message: 'The input is not a valid email address'
	                    }
	                }
	            },
	            password: {
	                validators: {
	                    notEmpty: {
	                        message: 'The password is required and can\'t be empty'
	                    },
	                    identical: {
	                        field: 'confirmPassword',
	                        message: 'The password and its confirm are not the same'
	                    }
	                }
	            },
	            confirmPassword: {
	                validators: {
	                    notEmpty: {
	                        message: 'The confirm password is required and can\'t be empty'
	                    },
	                    identical: {
	                        field: 'password',
	                        message: 'The password and its confirm are not the same'
	                    }
	                }
	            },
	        }
    });
});
</script>
</body>
</html>