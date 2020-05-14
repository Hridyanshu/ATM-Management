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
		   out.println("<h2>Pin changed successfully!!</h2><br>");
	   }
	   else
	   {
		   out.println("Pin Mismatch<br>");
	   }
   }
   catch(Exception e)
   {
	   out.println("Problem encountered while changing the pin.<br>");
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
