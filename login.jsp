<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%! //DECLARATION TAG  
Connection con =null;
Statement st =null;
ResultSet rs = null;
//Login to database details
//String url ="jdbc:mysql://localhost:3306/demo";
//String uname="root";
//String pass="2001hridya";
//SQL Queries to be implemented
String query1="select * from accountholders"; //display values
%>
<%
//getting parameters
try
{
	int loginid = Integer.parseInt(request.getParameter("uname"));
	int loginPass = Integer.parseInt(request.getParameter("pass"));
	//Initializations =
	//1.General initializations
	Class.forName("com.mysql.jdbc.Driver"); //class forname
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhibank","root","2001hridya");
	//Query2 initializations
	st = con.createStatement();
	rs =st.executeQuery(query1);
	while(rs.next())
	{
		int accountid = rs.getInt(1);
		int pin = rs.getInt(2);
		if(accountid == loginid)
		{
			if(pin == loginPass)
			{
				RequestDispatcher reqdisp1 = request.getRequestDispatcher("home.jsp");
				reqdisp1.forward(request, response);
			}
			else
			{
				out.println("Wrong Credentials!!<br>");
			}
		}
	}
}
catch(Exception e)
{
	  	out.println("Problem encountered. Your request cannot be processed.<br>");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="style.css">
		<script type="text/javascript">
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
