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
			<input type="hidden" name="writer" value="${sessionUser.username }" />
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
				<a href="mailReceive.action?receiver=${sessionUser.id }"
					target="_self">收邮件</a>
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
					<div class="t">写邮件</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							id="writerMail">
							<tr>
								<td align="right" width="30%">收件人</td>
								<td align="left"><select name="receiver">
										<option value="please">请选择收件人</option>
										<c:forEach items="${menberList }" var="ml">
											<option value="${ml.id }">${ml.username }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td align="right" width="30%">邮件标题</td>
								<td align="left"><input type="text" name="title" id="title" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">邮件内容</td>
								<td align="left"><textarea cols="36px" rows="5px"
										name="contextArea" id="contextArea"></textarea></td>
							</tr>
							<tr>
								<td align="right" width="30%">附件</td>
								<td align="left"><input type="file" name="otherFile"
									id="otherFile" /></td>
							</tr>
							<tr>
								<td align="center"><input type="submit" id="sendMail"
									value="确认发送" /></td>
								<td align="center">
								<td align="center" colspan="2"><input type="reset"
									style="display: none;" /></td>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>
	<script type="text/javascript">
		$(function(){
			jQuery.validator.addMethod("checkSize", function(value, element){
				if(element.files.length!=0){
					var fileSize=element.files[0].size;
					var maxSize = 9*1024*1024;
					if(fileSize > maxSize){
					    return false;
					}else{
					    return true;
					}
				}else{
					return true;
				}
			});

			$("#sendMail").validate({
				rules : {
					title : "required",
					otherFile : {
						checkSize : true
						}
					},
					messages : {
						title : "标题不能为空",
						otherFile : "附件大小不能大于9M"
					},
					submitHandler : function() {
						//提交Ajax
						$.ajax({
							data : new FormData($('#sendMail')[0]),
							dataType : "text",
							processData : false,
							contentType : false,
							type : "post",
							url : "${pageContext.request.contextPath}/user/sendMail.do",
							success : function(rec) {
								if (rec == 0) {
									alert("发送成功"),
									$("input[type=reset]").trigger("click");
								} else {
									alert("发送失败")
								}	
							}
						});
					}
				});
					
		})
	</script>
</body>
</html>