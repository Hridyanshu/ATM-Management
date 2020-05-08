<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<% HttpSession session3 = request.getSession();
   int login = (int)session3.getAttribute("login");
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhibank","root","2001hridya");
   Statement st = con.createStatement();
   ResultSet rs =st.executeQuery("SELECT * FROM accountholders WHERE accountid="+login+"");
   rs.next();
   int balance = rs.getInt(3);
   out.println(balance);
   %>