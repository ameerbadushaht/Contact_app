<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
Connection con;
String dbUrl= "jdbc:mysql://localhost:3306/";
String dbName = "add";
String usrName = "root";
String pass = "";
String dbDriver = "com.mysql.jdbc.Driver";
Class.forName(dbDriver);
con = DriverManager.getConnection(dbUrl+dbName, usrName, pass);
String uname = request.getParameter("email");
String pswd = request.getParameter("password");
String sql = "select * from user where email = ? and password = ?";
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1, uname);
ps.setString(2, pswd);

ResultSet rs = ps.executeQuery();

if(rs.next()) {
	//session.setAttribute("username", uname);
	response.sendRedirect("NewFile.jsp");
}
else { 
	
%>

<script >
	alert("Enter only the correct Email & Password");
</script>


<%}    	
		%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign In</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<style>
input[type=submit] {
	border-radius: 5px;
	background-color: #008CBA;
	border: none;
	color: white;
	padding: 10px 79px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	
	cursor: pointer;
	width:"50%";
}
input[type=submit]:hover {
  background-color: #0cc0f2;
}

</style>
</head>
<body>
	<div >
		<table align="center">	<th>
		<h1> Sign In<br> <br></h1></th>
	
		<div class="row">
			<div class="col-sm-4">
				<form method="POST" action="#">
					<div >
						<br> <br><tr><td style=font-size:14px align="center">Don't have an account? <a href=signup.jsp>Sign Up</a><br> <br></td> </tr>
					
						<tr><td>
						<label class="form-label">Email</label></td></tr><br>
						 <tr><td><input type="email" class="form-control" name="email" id="sname" size="30" required><br> <br></td></tr>
					</div>

					<div alight="left">
						<br> <tr><td><label class="form-label">Password</label> </td></tr><br>
						</div>
						<tr><td><input type="password" class="form-control" name="password" id="course" size="30" required><br> <br></td></tr>
					
					
					<div >

						<tr><td align="right"><a href="#">Forgot your password?</a><br> </td></tr>
					</div>
					</table>
					<div align="center">
						<br> <input type="submit" id="submit" value="Sign In" name="submit" class="btn btn-info">
				</div>
						
				</form>
			</div>
		</div>
	</div>
</body>
</html>