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
<form id="sendMail" enctype="multipart/form-data" name="sendMail">
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
					<div class="t">收件箱</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							id="receiveMail">
						<tr>
							<td>标题</td>
							<td>内容</td>
							<td>是否已读</td>
							<td>时间</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${mails}" var="m">
							<tr id="${m.eid}_tr">
								<td><a href="mailInfo.action?eid=${m.eid}&receiver=${sessionUser.id}" target="_self">${m.title }</a></td>
								<td>${m.contextArea }</td>
								<td>${m.isread==0?'未读':'已读' }</td>
								<td>${m.sendTime }</td>
								<td><input type="button" value="删除" onclick="mailDelete(${m.eid})"/></td>
							</tr>
						</c:forEach>	
						</table>
					</div>
				</div>
			</div>
		</div>		
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>
	<script type="text/javascript">
	function mailDelete(eid){
		var trID=document.getElementById(eid+"_tr");
		var conf = confirm("确定要删除吗？");
		if(conf){
			$.ajax({
				data : {"eid":eid},
				dataType : "text",
				type : "post",
				url : "${pageContext.request.contextPath}/user/mailDelete.do",
				success : function(rec) {
					if (rec=="0") {
						$(trID).remove();
					}
				}
			});
		}
	}
	</script>
</body>
</html>