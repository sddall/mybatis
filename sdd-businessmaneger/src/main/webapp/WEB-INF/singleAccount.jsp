<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/messages_zh.js"></script>

</head>

<body>
	<div class="top">
		<div class="global-width">
			<img src="${pageContext.request.contextPath}/images/logo.gif"
				class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			<div id="nickName" style="float: left">${sessionUser.username }你好！欢迎访问办公管理系统！</div>
			<div style="float: right">
				<a href="#" onclick="location.href='loginOut.action'">注销</a>
			</div>
		</div>
	</div>
	<form id="myForm" name="myForm" method="post">
		<input type="hidden" name="id" value="${sessionUser.id }" /> <input
			type="hidden" name="isadmin" value="${sessionUser.isadmin }"
			id="isadmin" />
		<div class="main">
			<div class="global-width">


				<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="nav" id="nav">
		<div class="t"></div>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理
			</dt>
			<dd>
				<a href="forward.action" target="_self">个人信息</a>
			</dd>
		</dl>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				邮件管理</dt>
			<dd>
				<a href="mailWrite.action" target="_self">写邮件</a>
			</dd>
			<dd>
				<a href="mailReceive.action?receiver=${sessionUser.id }" target="_self">收邮件</a>
			</dd>
			<dd>
				<a href="mailGarage.action?receiver=${sessionUser.id }" target="_self">垃圾邮件</a>
			</dd>
		</dl>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				考勤管理</dt>
			<dd>
				<a href="leave.action" target="_self">休假</a>
			</dd>
		</dl>

		<dl>

			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				权限管理</dt>
			<dd>
				<a href="singleAccountData.action" target="_self">个人账户</a>
			</dd>
			<dd>
				<a href="allAccountData.action" target="_self">管理账户</a>
			</dd>

		</dl>
	</div>
</body>
				</html>

				<div class="action">
					<div class="t">个人账户</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							id="editor">
							<tr>
								<td align="right" width="30%">昵称：</td>
								<td align="left"><input type="text" name="username"
									value="${sessionUser.username }" id="username" readonly="readonly"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">密码:</td>
								<td align="left"><input type="password" name="password"
									value="${sessionUser.password }" id="password" readonly="readonly"/></td>
							</tr>
							<tr>
								<td align="right" > <input type="button"
									id="edit" value="编辑信息" onclick="editUser()" /></td>
								<td align="left" > <input type="button"
									id="back" value="返回" onclick="location.href='singleAccountData.action'" /></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
	<script>
	$().ready(function() {
		$("#myForm").validate({
			rules : {
				username : "required",
				password :{
					required:true,
					minlength:6
				}
		
			},
			messages : {
				username : "请填写姓名",
				phone : "请输入有效的密码"
			}
			})
	})
		
	function setit(){
				$.ajax({
					data : $("#myForm").serialize(),
					dataType : "text",
					type : "post",
					url : "${pageContext.request.contextPath}/user/singleAcount.do",
					complete: function(){
						$(":text").attr("readonly","readonly");
						$(":password").attr("readonly","readonly");
						$("#edit").attr("value","编辑信息");
						$("#edit").attr("onclick","editUser()")
						
					},
					success : function(rec) {
						if (rec=="0") {
							alert("修改成功");
							$("#nickName").html($("#username").val()+"你好！欢迎访问办公管理系统！");
						} else {
							alert("修改失败");
						}
					}
				});
	}

	function editUser(){
		$(":text").removeAttr("readonly");
		$(":password").removeAttr("readonly");
		$("#edit").attr("onclick","setit()");
		$("#edit").attr("value","保存数据");
	}
</script>
</html>