<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<%
	Connection con =null;
	Statement st =null;
	ResultSet rs = null;
	
	//query to be executed
	String query = "select * from accountholders";

	try
	{
		//storing credentials entered by user
		int loginid = Integer.parseInt(request.getParameter("uname"));
		int loginPass = Integer.parseInt(request.getParameter("pass"));
		
		//registering the driver class
		Class.forName("com.mysql.jdbc.Driver");
		//connection to the database
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhibank","root","2001hridya");
		st = con.createStatement();
		//executing query to fetch the database records
		rs =st.executeQuery(query);
		
		//validation of credentials
		while(rs.next())
		{
			//getting account id and pin from database
			int accountid = rs.getInt(1);
			int pin = rs.getInt(2);
			
			if(accountid == loginid)
			{
				if(pin == loginPass) //credentials verified
				{
					//passing control to home page
					RequestDispatcher reqdisp1 = request.getRequestDispatcher("home.jsp");
					reqdisp1.forward(request, response);
				}
			}
		}
		
		out.println("Wrong Credentials!!<br>");
	}
	
	catch(Exception e)
	{
		//in case of any exception
		out.println("Problem encountered.<br> Your request cannot be processed.<br>");
	}
	
	//redirection to login page
%>


<!DOCTYPE html>
<html>

	<head>
	
		<link rel="stylesheet" href="style.css">
		
		<script type="text/javascript">
	        //redirection to login page 
			function Redirect() {
	            window.location = "index.html";
	         }            
	         document.write("You will be redirected to main page in 5 sec.");
	         setTimeout('Redirect()', 5000);
			 
	         //eliminating backtracking
	         window.history.forward();
			function noBack() { window.history.forward(); }
		</script>
	
	</head>
	
	<body class="body-all" id="withdraw-body" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
	</body>
	
</html>