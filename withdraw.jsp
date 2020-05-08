<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<% HttpSession session2 = request.getSession();
   int login = (int)(session2.getAttribute("login"));
   try
   {
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhibank","root","2001hridya");
	   Statement st = con.createStatement();
	   ResultSet rs =st.executeQuery("SELECT * FROM accountholders WHERE accountid="+login+"");
	   rs.next();
	   int balance = rs.getInt(3);
	   int amount = Integer.parseInt(request.getParameter("amount"));
	   if(amount<=balance && amount<15000)
	   {
		   int newbalance = balance - amount;
		   st.executeUpdate("UPDATE accountholders SET balance = '"+newbalance+"' WHERE accountid="+login+"");
	   }
   }
   catch(Exception e)
   {
	   out.println(e);
   }
%>