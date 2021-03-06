<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="ic"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>小璨小璨,跟我走不迷路~~</title>
<link rel="stylesheet" type="text/css" href="/css/index-register.css" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<script src="/js/jquery-1.8.2.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/ui.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/index-register.js" type="text/javascript"
	charset="utf-8"></script>
<script src="/js/index.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/getXMLHttpRequest.js" type="text/javascript"></script>
<script src="/js/sendEmailAndUserCode.js" type="text/javascript"></script>
</head>
<%
	//销毁session
	// 如果没有session 强制销毁session 就会报异常  IllegalStateException
	//session.invalidate();   
	//生成随机口令
	String token = UUID.randomUUID().toString();
	//保存在session
	session.setAttribute("TOKEN_IN_SESSION", token);
%>
<body>
	<form class="box" id="form" action="/user/register" method="post">
		<h2>注册 小璨小璨</h2>
		<input type="hidden" name="token" value="<%=token%>">
		<input type="text" id="username"
			reg="[A-Za-z0-9_\-\u4e00-\u9fa5]{4,6}"
			tip="请设置你的用户名 不少于4位且不大于6位 由数字和英文字母和中文的组合组成" name="username"
			placeholder="请设置你的用户名 不少于4位且不大于6位" onblur="checkUsername();" /> <input
			type="password" id="password1" reg="^[a-zA-Z0-9]{6,16}$"
			tip="请设置你的密码 不少于6位且不大于16位 由数字和英文字母组成" name="password1"
			placeholder="设置你的密码 不少于6位且不大于16位" onblur="checkPassword1();" /> <input
			type="password" id="password2" reg="^[a-zA-Z0-9]{6,16}$"
			tip="请设置你的密码 不少于6位且不大于16位 由数字和英文字母组成" name="password2"
			placeholder="确认密码" onblur="checkPassword2();" /> <input type="email"
			id="email"
			reg="[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?"
			tip="请输入正确的邮箱 如 icanci@163.com" name="email" placeholder="邮箱"
			onblur="checkEmail();" /> <a href="javaScript:checkUserEmailCode();"><input
			type="button" value="发送验证码" /></a> <input type="text" name="usercode"
			id="usercode" reg="^[0-9]{6}$" tip="请查看你的邮箱信件 输入正确的验证码" value=""
			onblur="checkUserEmailCodes();" placeholder="请输入6位数验证码" /> <input
			type="text" name="userkey" id="userkey" reg="^[a-zA-Z0-9]{5}$"
			tip="请输入正确的图片验证码" value="" onblur="checkUserkey();"
			placeholder="请输入图片验证码" />
		<div class="getVerificationCode">
			<div class="getCode">
				<img id="codeImg" alt="看不清?换一张" src="/user/outputimagecode"
					onclick="toChange();">
			</div>
			<div class="reset">
				<p>
					<a href="javaScript:toChange();">看不清?</a>
				</p>
			</div>
		</div>
		<input type="submit" value="注册小璨" />
		<p>
			<a href="index-not-get-code.html">收不到验证码?</a> <span>|</span> <a
				href="index-user-manual.html">用户手册</a> <span>|</span> <a
				href="index-feedback.jsp">界面意见反馈</a>
		</p>
		<p>
			<a href="index.jsp">已有账户? 去登陆</a>
		</p>
	</form>
</body>
</html>
