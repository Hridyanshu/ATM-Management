<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="style.css">
		<script type="text/javascript">
			window.history.forward();
			function noBack() { window.history.forward(); }
		</script>
	</head>
	<body class="body-all" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
		<form action="withdraw.html">
			<input class="submit-button" id="withdraw-button" type="submit" value="WITHDRAW">
		</form>
		<form action="pin.html">
			<input class="submit-button" id="pin-button" type="submit" value="PIN CHANGE">
		</form>
		<form action="balance.jsp">
			<input class="submit-button" id="balance-button" type="submit" value="BALANCE ENQUIRY">
		</form>
		<form action="index.html">
			<input class="submit-button" id="cancel-button" type="submit" value="CANCEL">
		</form>
		<% int login = Integer.parseInt(request.getParameter("uname"));
			HttpSession session1 = request.getSession();
			session1.setAttribute("login", login); %>
	</body>
</html>
