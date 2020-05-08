<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>

<body>
	<form action="withdraw.html">
		<input type="submit" value="withdraw">
	</form>
	<form action="pin.html">
		<input type="submit" value="pin change">
	</form>
	<form action="balance.jsp">
		<input type="submit" value="balance enquiry">
	</form>
	<form action="index.html">
		<input type="submit" value="cancel">
	</form>
	<% int login = Integer.parseInt(request.getParameter("uname"));
		HttpSession session1 = request.getSession();
		session1.setAttribute("login", login); %>
</body>
</html>