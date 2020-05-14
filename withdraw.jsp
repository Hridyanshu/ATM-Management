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
	   if(amount<0)
		   throw new Exception();
	   double rem = (double)(amount%100);
	   if(amount<=balance && amount<=15000 && rem==0)
	   {
		   int newbalance = balance - amount;
		   st.executeUpdate("UPDATE accountholders SET balance = '"+newbalance+"' WHERE accountid="+login+"");
		   out.println("<p><h2>Transaction Successful</h2></p>");
	   }
	   else if(amount>balance)
		   out.println("Insufficient Funds<br>");
	   else
	   {
		   out.println("Invalid Amount<br>");
	   }
   }
   catch(Exception e)
   { 
	   out.println("Problem encountered while processing the request.<br>");
   }
%> 
<html>
   <head>
   	<link rel="stylesheet" href="style.css">
      <script type = "text/javascript">
         <!--
            function Redirect() {
               window.location = "index.html";
            }            
            document.write("You will be redirected to main page in 5 sec.");
            setTimeout('Redirect()', 5000);
         //-->
         window.history.forward();
			function noBack() { window.history.forward(); }
		</script>
   </head>
   <body class="body-all" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
   </body>
</html>
