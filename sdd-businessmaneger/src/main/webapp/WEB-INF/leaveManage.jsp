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
					<div class="t">休假列表</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							id="leaveInfo">
						<tr>
							<td>申请人</td>
							<td>开始时间</td>
							<td>结束时间</td>
							<td>天数</td>
							<td>审批状态</td>
							<td>原因</td>
						</tr>
						<c:forEach items="${allLeave }" var="al">
							<tr>
								<td>${al.membername }</td>
								<td>${al.beginTime }</td>
								<td>${al.endTime }</td>
								<td>${al.day }</td>
								<td id="${al.lid }_approval">${al.approval==0?"未审批":(al.approval==1?"通过":"未通过") }</td>
								<td>${al.reason }</td>
								<c:if test="${al.approval==0 }">
									<td><input id="apply" type="button" value="审核" onclick="applyLeave(${al.lid})"/> </td>
								</c:if>
								<c:if test="${al.approval!=0 }">
									<td><input id="apply" type="button" value="审核" /> </td>
								</c:if>
							</tr>
						</c:forEach>	
						<tr>
							<td><input type="button" value="申请休假" onclick="location.href='leaveEdit.action'"/></td>
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
	
	function applyLeave(lid){
		var tdID=document.getElementById(lid+"_approval");
		if(confirm("确定审核通过吗?")){
			$.ajax({
				data : {"lid":lid,"approval":1},
				dataType : "text",
				type : "post",
				url : "${pageContext.request.contextPath}/user/isApplied.do",
				success : function(rec) {
					if (rec=="0") {
						$(tdID).html("通过");
						$("input[id=apply]").removeAttr("onclick");
					}
				}
			});
		}else{
			$.ajax({
				data : {"lid":lid,"approval":2},
				dataType : "text",
				type : "post",
				url : "${pageContext.request.contextPath}/user/isApplied.do",
				success : function(rec) {
					if (rec=="0") {
						$(tdID).html("未通过");
						$("input[id=apply]").removeAttr("onclick");
					}
				}
			});
		}
	}
</script>
</html>