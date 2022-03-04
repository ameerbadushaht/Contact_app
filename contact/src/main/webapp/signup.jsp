<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <% 

    if(request.getParameter("submit")!=null)
    {
        String email = request.getParameter("eml");
        String password = request.getParameter("pswd");
        String scrt = request.getParameter("secrt");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/add","root","");
        pst = con.prepareStatement("insert into user(email,password,scrt)values(?,?,?)");
        pst.setString(1, email);
        pst.setString(2, password);
        pst.setString(3, scrt);
        pst.executeUpdate();  
        %> 
    <script>   
        alert("Record Added");     
    </script> 
    <%
    response.sendRedirect("login.jsp");%>
    <% 
    
    }
   %>
   
   
   <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style >
       input[type=submit] {
   border-radius: 5px;
  background-color:#008CBA;
  border: none;
  
  color: white;
  padding: 10px 105px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
div.a{
font-size:14px;
color:#737170
}
	
       </style>
    </head>
    <body>
    <div >
    <table align="center">	<th>
        <h1>Sign Up</h1></th>
        </br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <div alight="left">
                   <tr><td style=font-size:14px align="center" > <br> <br>Do you have already an account? <a href=login.jsp>Sign In</a><br></td></tr>
                        <tr><td><br><br> <br><label class="form-label">Email</label></td></tr>
                        <tr><td><input type="email" class="form-control"  name="eml" id="email" size="40" required ></td></tr>
                     </div>
                        
                    <div alight="left">
                       <tr><td><br> <label class="form-label">Password</label></td></tr>
                        <tr><td><input type="password" class="form-control" name="pswd" id="pswd" size="40"  required ></td></tr>
                     </div>
                        
                     <div alight="left">
                       <tr><td><br> <label class="form-label">Secret code</label></td></tr>
                        <tr><td><input type="password" class="form-control"  name="secrt" id="scrt" size="40"  required ></td></tr>
                     </div>
                  </table>
                   <div align="center">
                        <br> <input type="submit" id="submit" value="Sign Up" name="submit" class="btn btn-info" i class="fa fa-lock">
                         
                     </div >  
                     </form>
                        <div class="a" align="center" >
                        By clicking the 'Sign Up' button,you are creating <br> an account,and you agree to the Terms of Use.
                        </div>
                        
                
            </div>
</div>
</div>
</body>
</html>