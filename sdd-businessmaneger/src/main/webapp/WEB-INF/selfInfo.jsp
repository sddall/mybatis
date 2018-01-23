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
<script>
/* 	$(function(){
		$("#myForm").validate({
		rules : {
			username : "required",
			phone :{
				required:true,
				number:true,
				rangelength:[11,11]
			}
	
		},
		messages : {
			username : "昵称不能为空",
			phone : "电话号码格式不正确",
		}, 
	}) */
	function setit() {
				$.ajax({
					data : $("#myForm").serialize(),
					dataType : "text",
					type : "post",
					url : "${pageContext.request.contextPath}/user/edit.do",
					complete: function(){
						$(":text").attr("readonly","readonly");
						$(":button").attr("value","编辑信息");
						$(":button").attr("onclick","editUser()")
						
					},
					success : function(rec) {
						if (rec=="0") {
							alert("修改成功");
							$("#nickName").html($("#username").val()+"你好！欢迎访问办公管理系统！");
						} else {
							location.href = "${pageContext.request.contextPath}/user/toEdit.do"
						}
					}
				});
	}
	function editUser(){
		$(":text").removeAttr("readonly");
		$(":button").attr("onclick","setit()");
		$(":button").attr("value","提交");
	}
</script>
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
				<a href="mailReceive.action" target="_self">收邮件</a>
			</dd>
			<dd>
				<a href="mailGarage.action" target="_self">垃圾邮件</a>
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
				<a href="userInfo!singleAccountData.action" target="_self">个人账户</a>
			</dd>

		</dl>
	</div>
</body>
				</html>

				<div class="action">
					<div class="t">个人信息</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							id="editor">
							<tr>
								<td align="right" width="30%">昵称：</td>
								<td align="left"><input type="text" name="username"
									value="${sessionUser.username }" id="username" readonly="readonly"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">年龄：</td>
								<td align="left"><input type="text" name="age"
									value="${sessionUser.age}" id="age" readonly="readonly"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">性别：</td>
								<td align="left" id="gender"><select name="gender">
										<option value="1"
											<c:if test="${'1' eq sessionUser.gender }">selected</c:if>>男</option>
										<option value="0"
											<c:if test="${'0' eq sessionUser.gender }">selected</c:if>>女</option>
								</select></td>
							</tr>
							<tr>
								<td align="right" width="30%">手机：</td>
								<td align="left"><input type="text" name="phone"
									value="${sessionUser.phone }" id="phone" readonly="readonly"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">地址：</td>
								<td align="left"><input type="text" name="address"
									value="${sessionUser.address }" id="address" readonly="readonly"/></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><br /> <input type="button"
									id="edit" value="编辑信息" onclick="editUser()" /></td>
							</tr>

						</table>

					</div>
				</div>
			</div>
		</div>
	</form>
<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
</html>