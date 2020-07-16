<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<% 
	HttpSession session3 = request.getSession();
	/*This method returns the object bound with the specified name in this session, 
	or null if no object is bound under the name.*/
	int login = (int)session3.getAttribute("login");
	
	//registering the driver class
	Class.forName("com.mysql.jdbc.Driver");
	//establishing connection to the database
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhibank","root","2001hridya");
	Statement st = con.createStatement();
	//query execution to get a row from the database
	ResultSet rs = st.executeQuery("SELECT * FROM accountholders WHERE accountid="+login+"");
	rs.next();
	
	//getting balance corress to the given account id
	int balance = rs.getInt(3);
	//display balance
	out.println("<h3>Rs." + balance + "</h3>");
%>


<html>

	<head>

		<link rel="stylesheet" href="style.css">

	   	<script type = "text/javascript">
	   		//redirecting to login page
	       	function Redirect() {
		        window.location = "index.html";
	        }            
	        document.write("<br>You will be redirected to main page in 5 sec.");
	        setTimeout('Redirect()', 5000);
	        
	        //eliminating backtracking
	        window.history.forward();
			function noBack() { window.history.forward(); }
		</script>

	</head>
	
	<body class="body-all" id="withdraw-body" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
	</body>

</html>