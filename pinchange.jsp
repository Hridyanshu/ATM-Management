<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<% HttpSession session4 = request.getSession();
   int login = (int)(session4.getAttribute("login"));
   try
   {
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhibank","root","2001hridya");
	   Statement st = con.createStatement();
	   int pin1 = Integer.parseInt(request.getParameter("newpin1"));
	   int pin2 = Integer.parseInt(request.getParameter("newpin2"));
	   String pin = Integer.toString(pin1);
	   if(pin1==pin2 && (pin.length() == 4))
	   {
		   st.executeUpdate("UPDATE accountholders SET pin = '"+pin1+"' WHERE accountid="+login+"");
		   out.println("Pin changed successfully");
	   }
	   else
	   {
		   out.println("Pin Mismatch<br>");
	   }
	   out.println("<a href='index.html'><button>Exit</button></a>");
   }
   catch(Exception e)
   {
	   out.println(e);
   }
%>