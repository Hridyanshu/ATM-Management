<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%> <%--import database package --%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! //DECLARATION TAG  
Connection con =null;
PreparedStatement pst =null;
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
int loginid = Integer.parseInt(request.getParameter("uname"));
int loginPass = Integer.parseInt(request.getParameter("pass"));
//Initializations =
//1.General initializations
Class.forName("com.mysql.jdbc.Driver"); //class forname
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhibank","root","2001hridya");
//Query2 initializations
st = con.createStatement();
rs =st.executeQuery(query1);
while(rs.next()){
int accountid = rs.getInt(1);
int pin = rs.getInt(2);
if(accountid == loginid){
if(pin == loginPass){
	
	RequestDispatcher reqdisp1 = request.getRequestDispatcher("home.jsp");
	reqdisp1.forward(request, response);
}
else
{
	out.println("Wrong Credentials!!");
	out.println("<a href='index.html'><button>Re-enter</button></a>");
}
}
}
%>
</body>
</html>