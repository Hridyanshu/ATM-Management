<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<% 
	HttpSession session2 = request.getSession();
	/*This method returns the object bound with the specified name in this session,
	or null if no object is bound under the name.*/
	int login = (int)(session2.getAttribute("login"));
   	
	try
   	{
		//registering the driver class
		Class.forName("com.mysql.jdbc.Driver");
		//establishing connection to the database
	   	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhibank","root","2001hridya");
	   	Statement st = con.createStatement();
	  	//getting the records corres to a particular account id
	   	ResultSet rs =st.executeQuery("SELECT * FROM accountholders WHERE accountid="+login+"");
	   	rs.next();
	   	
	   	//getting balance for the account id
	   	int balance = rs.getInt(3);
	   	//amount entered by the user
	   	int amount = Integer.parseInt(request.getParameter("amount"));
	   	
	   	if(amount<0)
			throw new Exception();
	   	double rem = (double)(amount%100);
	   	
	   	if(amount<=15000)
	   	{
			if(amount<=balance && rem==0)
		   	{
				int newbalance = balance - amount;
			   	st.executeUpdate("UPDATE accountholders SET balance = '"+newbalance+"' WHERE accountid="+login+"");
			   	out.println("<p><h2>Transaction Successful</h2></p>");
		   	}
		   	else
				out.println("<b>Insufficient Funds</b><br>");
	   	}
	   	
	   	else
			out.println("<b>Invalid Amount</b><br>");
   	}
	
   	catch(Exception e)
   	{ 
		out.println("Problem encountered while processing the request.<br>");
   	}
	
	//redirecting to login page
%> 


<html>

	<head>
   
	<link rel="stylesheet" href="style.css">
    	
    	<script type = "text/javascript">
      		//redirecting to login page	
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