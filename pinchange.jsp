<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<% 
	HttpSession session4 = request.getSession();
	/*This method returns the object bound with the specified name in this session,
	or null if no object is bound under the name.*/
	int login = (int)(session4.getAttribute("login"));
	
	try
	{
		//registering the driver class
		Class.forName("com.mysql.jdbc.Driver");
		//establishing connection to the database
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhibank","root","2001hridya");
		Statement st = con.createStatement();
		
		//values eneterd by user
		int pin1 = Integer.parseInt(request.getParameter("newpin1"));
		int pin2 = Integer.parseInt(request.getParameter("newpin2"));
		String pin = Integer.toString(pin1);
		
		if(pin1==pin2 && (pin.length() == 4))
		{
			st.executeUpdate("UPDATE accountholders SET pin = '"+pin1+"' WHERE accountid="+login+"");
			out.println("<h3>Pin changed successfully!!</h3><br>");
		}
		
		else
			out.println("<h3>Pin Mismatch</h3><br>");
	}
	
	catch(Exception e)
	{
		out.println("Problem encountered while changing the pin.<br>");
	}
	
	//redirecting to login page
%>

<html>

	<head>
   
		<link rel="stylesheet" href="style.css">
      
    	<script type = "text/javascript">
            //redirecting to home page
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