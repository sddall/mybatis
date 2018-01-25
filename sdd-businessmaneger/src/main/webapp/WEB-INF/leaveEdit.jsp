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
			${sessionUser.username }你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="loginOut.action">注销</a>
		</div>
	</div>
<form id="leaveForm" name="leaveForm">
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
					<div class="t">申请休假</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							id="leaveEdit">
							<tr>
								<td align="right" width="30%">姓名:</td>
								<td align="left"><input type="text"  name="membername" value="${sessionUser.username }"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">开始时间:</td>
								<td align="left"><input type="date" name="beginTime"/> </td>
							</tr>
							<tr>
								<td align="right" width="30%">结束时间:</td>
								<td align="left"><input type="date" name="endTime"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">请假天数:</td>
								<td align="left"><input type="text" name="day"/></td>
							</tr>
							<tr>
								<td align="right" width="30%" valign="top">请假原因</td>
								<td align="left"><textarea name="reason" cols="36px" rows="5px"></textarea></td>
							</tr>
							<tr>
								<td align="right" width="30%">审批人:</td>
								<td align="left"><select name="admin">
										<option value="please">请选择审批人</option>
										<c:forEach items="${admins }" var="ad">
											<option value="${ad.id }">${ad.username }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td align="right" width="30%"><input type="submit" value="提交申请"/></td>
								<td align="left"><input type="button" value="返回" onclick="location.href='leave.action'"/></td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<input type="reset" style="display: none;" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>		
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>
</body>
<script type="text/javascript">

//表单校验
$(function() {
	$("#leaveForm").validate({
						rules : {
							beginTime : "required",
							endTime : "required",
							day:"required"
						},
						messages : {
							beginTime : "请选择开始时间",
							endTime : "请选择结束时间",
							day:"请正确填写天数"
						},
						submitHandler : function() {
							//提交Ajax
							 $.ajax({
										data : $("#leaveForm").serialize(),
										dataType : "text",
										type : "post",
										url : "${pageContext.request.contextPath}/user/leaveApply.do",
										success : function(rec) {
											if(rec=="0"){
												alert("申请成功,请等待审批"),
												$("input[type=reset]").trigger("click");
											}else{
												alert("申请失败,请重新申请");
											}	
										}
									}); 
						}
					});
})

</script>
</html>