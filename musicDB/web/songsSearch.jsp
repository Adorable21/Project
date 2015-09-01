<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Apr 8, 2015, 1:02:11 AM
    Author     : Admin
--%>

<%;
Class.forName("com.mysql.jdbc.Driver");
ResultSet language = null;
ResultSet country = null;
        try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
    //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_project_db2?user=root&password=");
Connection connection = DriverManager.getConnection("jdbc:mysql://db541.cqnjoukfuc0e.us-west-2.rds.amazonaws.com:3306/database_project_db2?user=vineeta&password=database541");
       Statement statement = connection.createStatement() ;
        Statement statement1 = connection.createStatement() ;
         language =statement.executeQuery("SELECT distinct songLanguage FROM songs");
         country = statement1.executeQuery("SELECT distinct songCountry FROM songs");
    }catch(Exception sqlex){
        sqlex.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="style_1.css">
         <link rel="stylesheet" type="text/css" href="style_2.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Music DB Search Page</title>
        
    </head>
    <body>
       <style>
    body {
   
    background-size: cover;
    background-repeat: no-repeat;
    }
    h1 {
     font-size: 75px; 
    color: burlywood;
    }
     p {
     font-size: 20px; 
    color: red;
    }
   
    table {
    border-spacing: 20px 0;
    }
    input{
     border-right:  2px ;
    border-left: 2px ;
    border-bottom: 10px ;
    margin-top: 2px;
    margin-bottom: 8px;
    height:20px;
    width:250px;
    

    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;

    -moz-box-shadow: 4px 4px 14px #000;
    -webkit-box-shadow: 4px 4px 4px #000;
    box-shadow: 4px 4px 4px #000;
}
select{
     border-right:  2px ;
    border-left: 2px ;
    border-bottom: 10px ;
    margin-top: 2px;
    margin-bottom: 8px;
    height:20px;
    width:250px;
    

    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;

    -moz-box-shadow: 4px 4px 14px #000;
    -webkit-box-shadow: 4px 4px 4px #000;
    box-shadow: 4px 4px 4px #000;
}
.button {
   border-top: 1px solid #96d1f8;
   background: #2c8bc7;
   background: -webkit-gradient(linear, left top, left bottom, from(#0a6fa6), to(#2c8bc7));
   background: -webkit-linear-gradient(top, #0a6fa6, #2c8bc7);
   background: -moz-linear-gradient(top, #0a6fa6, #2c8bc7);
   background: -ms-linear-gradient(top, #0a6fa6, #2c8bc7);
   background: -o-linear-gradient(top, #0a6fa6, #2c8bc7);
   padding: 8.5px 17px;
   -webkit-border-radius: 22px;
   -moz-border-radius: 22px;
   border-radius: 22px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: #000000;
   font-size: 16px;
   font-family: Georgia, serif;
   text-decoration: none;
   vertical-align: middle;
   width: 150px;
   height:30px;
   }
.button:hover {
   border-top-color: #28597a;
   background: #28597a;
   color: #ccc;
   }
.button:active {
   border-top-color: #1b435e;
   background: #1b435e;
   }

       </style>
       <script type="text/javascript">
       function say(){
          var albumId,songId,artistId,languageval,countryval;
                                                 albumId=document.getElementById("albumId").value;
                                                 songId=document.getElementById("songId").value;
                                                 artistId=document.getElementById("artistId").value;
                                                 languageval=document.getElementById("languageval").value;
                                                  countryval=document.getElementById("countryval").value;
                                                 
   alert(languageval);
   //request.setParameter()
  var str="songsResults.jsp?&albumId="+albumId+"&songId"+songId+"&artistId="+artistId+"&languageval"+languageval+"&countryval="+countryval;
  var frame=document.getElementById("iframe_2");
  
  frame.style.display="true";
  frame.src=str;
    //alert('no'+frame);
  
}
  

</script>
<table>
    <td>
    <tr>
        <table class="newtable">
            
            <tbody>
               
            <form name="searchForm" method="POST" action="songsResults.jsp" target='myframe'>
                <tr>
                   
                          <td>  <strong>Album Name</strong></td>
                          <td> <input type="text" name="albumId" id="albumId"></td>
                            
                </tr> 
                <tr>
                    <td><strong>Song Name</strong></td>
                          <td>  <input type="text" name="songId" id="songId" /></td>
                            
                     
                </tr> 
                <tr>
                    <td> <strong>Artist</strong></td>
                           <td> <input type="text" name="artistId" id="artistId" /> </td>
                </tr> 
                
                
<tr>
                   <td><strong>Language</strong></td>
                         <td> <div class="dropdown">
                       <select name="languageval" id ="languageval" class="dropdown-select" >
                                
                                 <option value="" >Select Language</option> 
                                <%  while(language.next()){ %>
                                     <option><%= language.getString(1)%></option>
                                <% } %>
                               
                           </select>
                             </div>  
                    </td>
               </tr>  
                <tr>
                    <td> <strong>Country</strong></td>
                         <td>  <div class="dropdown"> <select name="countryval" id ="countryval" class="dropdown-select">
                                 
                                 <option value="">Select Country</option>
                                 <%  while(country.next()){ %>
                                      <option><%= country.getString(1)%></option>
                                 <% } %>
                                
                                 </select></div>
                            
                     </td>
                </tr> 
                <tr> 
                    <td></td>
                    <td><input type="submit" value="Submit" name="Submit" class="button" /></td>
                </tr>
                
            </form>
            </tbody>
      </table>  
    </tr>
    <br>
    <br>
    
    <tr><iframe width="100%" height="310px" src="" frameborder="0" name="myframe" id="myframe" ></iframe></tr></td>

        
</table>
   
                                 
  
    </body>
</html>
