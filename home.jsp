<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<%
	int login = Integer.parseInt(request.getParameter("uname"));
	HttpSession session1 = request.getSession();
	//This method binds an object to this session, using the name specified.
	session1.setAttribute("login", login);
%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" href="style.css">
		
		<script type="text/javascript">
			//eliminating backtracking
			window.history.forward();
			function noBack() { window.history.forward(); }
		</script>
	
	</head>
	
	<body class="body-all" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
		
		<form action="withdraw.html">
			<input class="home-button" type="submit" value="WITHDRAW">
		</form>
		
		<form action="pin.html">
			<input class="home-button" type="submit" value="PIN CHANGE">
		</form>
		
		<form action="balance.jsp">
			<input class="home-button" type="submit" value="BALANCE ENQUIRY">
		</form>
		
		<form action="index.html">
			<input class="home-button" type="submit" value="CANCEL">
		</form>
		
	</body>
	
</html>