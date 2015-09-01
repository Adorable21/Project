<%@page import="java.util.ArrayList"%>
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
ResultSet genre = null;
ResultSet data = null;
ArrayList countryList=new ArrayList();
 ArrayList languageList = new ArrayList();
 ArrayList genreList = new ArrayList();
        try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
   // Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_project_db2?user=root&password=");
Connection connection = DriverManager.getConnection("jdbc:mysql://db541.cqnjoukfuc0e.us-west-2.rds.amazonaws.com:3306/database_project_db2?user=vineeta&password=database541");
       Statement statement = connection.createStatement() ;
        Statement statement1 = connection.createStatement() ;
        Statement statement2 = connection.createStatement() ;
        Statement statement3 = connection.createStatement() ;
         language =statement.executeQuery("SELECT distinct songLanguage FROM songs");
         country = statement1.executeQuery("SELECT distinct songCountry FROM songs");
         genre = statement2.executeQuery("SELECT distinct name FROM genres");
         while(language.next()){
             languageList.add(language.getString(1));
         }
          while(country.next()){
             countryList.add(country.getString(1));
         }
          while(genre.next()){
             genreList.add(genre.getString(1));
         }
           
        
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
        <title>Music DB Compare Page</title>
    </head>
    <body>
        <style>
   body {
   
    background-size: cover;
    background-repeat: no-repeat;
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
     
      
     <div style="height: 100px; "></div>
                        

            <form name="searchForm" method="POST" >
                <table class="newtable">
               
                    <th>Select Criteria</th>
                    <th></th>
                   <th>Select Criteria</th>
              
                <tr>
                   
                          <td> <div class="dropdown"> <select name="languageval1" id="languageval1" class="dropdown-select">
                                 
                                  <option value="" >Select Language</option> 
                                 <% for(int l=0;l<languageList.size();l++){ %>
                                      <option value="<%= languageList.get(l)%>"><%= languageList.get(l)%></option>
                                 <% } %>
                                
                            </select>
                              </div>
                     </td>
                     <td></td>
                          <td> <div class="dropdown"> <select name="languageval2" id="languageval2" class="dropdown-select">
                                 
                                  <option value="">Select Language</option> 
                                 <% for(int l=0;l<languageList.size();l++){ %>
                                      <option value="<%= languageList.get(l)%>"><%= languageList.get(l)%></option>
                                 <% } %>
                                
                            </select>
                              </div>
                     </td>
                </tr> 
                <tr>
                    
                         <td> <div class="dropdown">  <select name="countryval1" id ="countryval1" class="dropdown-select">
                                 
                                 <option value="">Select Country</option>
                                  <% for(int c=0;c<countryList.size();c++){ %>
                                      <option value="<%= countryList.get(c)%>"><%= countryList.get(c)%></option>
                                 <% } %>
                                
                            </select>
                             </div>
                     </td>
                     <td></td>
                         <td>  <div class="dropdown"> <select name="countryval2" id ="countryval2" class="dropdown-select">
                                 
                                 <option value="">Select Country</option>
                                <% for(int c=0;c<countryList.size();c++){ %>
                                      <option value="<%= countryList.get(c)%>"><%= countryList.get(c)%></option>
                                 <% } %>
                                
                            </select>
                             </div>
                     </td>
                </tr> 
                 <tr>
                   
                         <td>  <div class="dropdown"> <select name="genreval1" id ="genreval1" class="dropdown-select">
                                 
                                 <option value="">Select Genre</option>
                                  <% for(int g=0;g<genreList.size();g++){ %>
                                      <option value="<%= genreList.get(g)%>"><%= genreList.get(g)%></option>
                                 <% } %>
                                
                            </select>
                             </div>
                     </td>
                     <td></td>
                         <td> <div class="dropdown">  <select name="genreval2" id ="genreval2" class="dropdown-select">
                                 
                                 <option value="">Select Genre</option>
                                <% for(int g=0;g<genreList.size();g++){ %>
                                      <option value="<%= genreList.get(g)%>"><%= genreList.get(g)%></option>
                                 <% } %>
                                
                            </select>
                             </div>
                     </td>
                </tr> 
                <tr> 
                  
                    <td></td>
                    <td><input type="button" value="Compare" class="button" name="Compare" onclick="make_URL()"></td>
                </tr>
                </table> 
            </form>
    
                                 <script type="text/javascript">
                                     function make_URL(){
                                         var countryval1,countryval2,genreval1,genreval2,languageval1,languageval2,url;
                                         var count=0;
                                                 countryval1=document.getElementById("countryval1").value;
                                                 countryval2=document.getElementById("countryval2").value;
                                                 languageval1=document.getElementById("languageval1").value;
                                                 languageval2=document.getElementById("languageval2").value;
                                                  genreval1=document.getElementById("genreval1").value;
                                                 genreval2=document.getElementById("genreval2").value;
                                                if((countryval1 !== null && countryval1 !=="") && (countryval2 !== null && countryval2 !=="")){
                                                    count=count+2;
                                                   
                                                }else if((countryval1 === null || countryval1 ==="") && (countryval2 !== null && countryval2 !=="")){
                                                    count=count+1;
                                                    alert('please select value for country in both criteria');
                                                }else if((countryval1 !== null && countryval1 !=="") && (countryval2 === null || countryval2 ==="")){
                                                    count=count+1;
                                                    alert('please select value for country in both criteria');
                                                }
                                                
                                                 if((languageval1 !== null && languageval1 !=="") && (languageval2 !== null && languageval2 !=="")){
                                                    count=count+2;
                                                    
                                                }else if((languageval1 !== null && languageval1 !=="") && (languageval2 === null || languageval2 ==="")){
                                                    count=count+1;
                                                    alert('please select value for language in both criteria');
                                                }else if((languageval1 === null || languageval1 ==="") && (languageval2 !== null && languageval2 !=="")){
                                                    count=count+1;
                                                    alert('please select value for language in both criteria');
                                                }
                                                
                                                 if((genreval1 !== null && genreval1 !=="") && (genreval2 !== null && genreval2 !=="")){
                                                    count=count+2;
                                                   
                                                }else if((genreval1 === null || genreval1 ==="") && (genreval2 !== null && genreval2 !=="")){
                                                     count=count+1;
                                                     alert('please select value for genre in both criteria');
                                                }else if((genreval1 !== null && genreval1 !=="") && (genreval2 === null || genreval2 ==="")){
                                                    count=count+1;
                                                    alert('please select value for genre in both criteria');
                                                }
                                                
                                                if(count===2 || count === 4){
                                                  url ="compareResult.jsp?&countryval1="+countryval1+"&countryval2="+countryval2+"&languageval1="+languageval1+"&languageval2="+languageval2+"&genreval1="+genreval1+"&genreval2="+genreval2;
                                                  var frame2=parent.document.getElementById('compareframe_2');
                                                 
                                                  
                                                  
                                                 frame2.style.display="";
                                                 frame2.src=url;  
                                                }else if(count===0){
                                                    alert('please select at lease one criteria for comparison');
                                                }else if(count === 6){
                                                    alert('please select at most two criteri for comparison');
                                                }
                                         
                                     }
                                 </script>
            
            </tbody>
        </table>

    </body>
</html>
