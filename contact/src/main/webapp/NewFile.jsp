
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% 

    if(request.getParameter("submit")!=null)
    {
        String name = request.getParameter("name");
        String phone = request.getParameter("phn");
        String email = request.getParameter("email");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/add","root","");
        pst = con.prepareStatement("insert into addc(name,phone,email)values(?,?,?)");
        pst.setString(1, name);
        pst.setString(2, phone);
        pst.setString(3, email);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Added");     
    </script> 
    <%             
    }
   %>
  

 
 
 
 
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Contacts</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style >
         th{
           background-color:#838687;
           
           }
        table, th,td{  
       border: 1px solid black;
       border-collapse: collapse; 
       text-align:center;
       padding:20px 30px;}
      
       input[type=submit] {
  
  background-color:#008CBA;
  border: none;
  width:7%;
  color: white;
  padding: 8px 15px;
  marginal-left:100px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  position:left;
}
       input[type=submit]:hover {
  background-color: #0cc0f2;
}
       </style>
    </head>
    <body>
    <div align="center">
   
        <h2>Add Contacts</h2>
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <div >
                        <br><label class="form-label">Name</label>
                        <input type="text" class="form-control"  name="name" id="sname" required >
                     </div>
                        
                    <div >
                      <br> <br> <label class="form-label">Ph No</label>
                        <input type="text" class="form-control" name="phn" id="course" required >
                     </div>
                        
                     <div >
                      <br> <br> <label class="form-label">Email</label>
                        <input type="email" class="form-control"  name="email" id="fee" required >
                     </div>
                         </br>
                        
                     <div align="center">
                        <br> <input type="submit" id="submit" value="save" name="submit" class="btn btn-info">
                         
                     </div>  
                        
                </form>
            </div>
            
             <div class="col-sm-8">
                 <div class="panel-body">
                 <h2>My Contacts</h2>
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="50%">
                         <thead>
                             <tr>
                                    <th style=color:white; >Name</th>
                                    <th style=color:white;>Ph No</th>
                                    <th style=color:white;>Email</th>
                                    
                             </tr>  
                            
                             <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/add","root","");
                                
                                  String query = "select * from addc";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
            
                             <tr>
                                 <td><%=rs.getString("name") %></td>
                                  <td><%=rs.getString("phone") %></td>
                                 <td><%=rs.getString("email") %></td>
                                
                             </tr>
                            
                            
                                <%
                                
                                 }
                               %>
                            
                     </table>    
                 </div>
 
            </div>  
        </div>
 	</div>
    </body>
</html>