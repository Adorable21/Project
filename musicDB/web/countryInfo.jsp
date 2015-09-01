<%-- 
    Document   : countryInfo
    Created on : Apr 27, 2015, 5:34:37 PM
    Author     : Admin
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%;
    Class.forName("com.mysql.jdbc.Driver");
String con=request.getParameter("c");
//Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_project_db2?user=root&password=");
Connection connection = DriverManager.getConnection("jdbc:mysql://db541.cqnjoukfuc0e.us-west-2.rds.amazonaws.com:3306/database_project_db2?user=vineeta&password=database541");  
//out.println("Hello");
  Statement st1=connection.createStatement();
  Statement st2=connection.createStatement();
  Statement st3=connection.createStatement();
  Statement st4=connection.createStatement();
  Statement st5=connection.createStatement();
  String numlangs="select count(*) from (select distinct albumLanguage from albums where albumCountry=\""+con+"\")A";
  String numalbums="select count(*) from (select distinct albumName from albums where albumCountry=\""+con+"\")A";
  String numsongs="select count(*) from (select distinct songId from albums where albumCountry=\""+con+"\")A";
  String popartists="select distinct artistName from artists,songs where artists.artistId=songs.artistId and songs.songCountry=\""+con+"\" order by viewCount desc limit 5";
  String popGenres="select distinct genres.name from songs, genres where songCountry=\""+con+"\" and genres.songId=songs.youtubeId limit 7";
  ResultSet rs1=st1.executeQuery(numlangs);
  ResultSet rs2=st2.executeQuery(numalbums);
  ResultSet rs3=st3.executeQuery(numsongs);
  ResultSet rs4=st4.executeQuery(popartists);
  ResultSet rs5=st5.executeQuery(popGenres);
 // rs1.next();
  //rs2.next();
  //rs3.next();
  //rs4.next();
  //rs5.next();
  //out.println("Number of languages"+rs1.getString(1)+"\n");
  
  //out.println("Number of Albums"+rs2.getString(1)+"\n");
 // out.println("Number of Songs"+rs3.getString(1)+"\n");
  //out.println("Popular Artists"+rs4.getString(1));
  
  /* while(rs5.next()){
  out.println(rs5.getString(1));
  }*/
  //out.println(rs4.getString(2));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style_2.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color: navy"><%=con%></h1>
        <table class="newtable">
            <tr>
                <td>Number of Languages </td><td> : </td>
                <%while(rs1.next()){ %>
                <td><%=rs1.getString(1)%></td>
                    
               <% }
                %>
                
            </tr>
             <tr>
               <td>Number of Albums </td><td> : </td>
                <%while(rs2.next()){ %>
                <td><%=rs2.getString(1)%></td>
                    
               <% }
                %>
                
            </tr>
             <tr>
                <td>Number of Songs </td><td> : </td>
                <%while(rs3.next()){ %>
                <td><%=rs3.getString(1)%></td>
                    
               <% }
                %>
                
            </tr>
            
            
        
            </table>   
    <div style="margin-left: 5px;vertical-align:middle;
text-align:left;
padding:7px;
font-size:18px;
font-family:Arial;
font-weight:normal;
color:#000000;"><% out.println("Popular Artists ");%></div>
        <%  while(rs4.next()){%>
    <div style="margin-left: 5px;vertical-align:middle;
text-align:left;
padding:7px;
font-size:15px;
font-family:Arial;
font-weight:normal;
color:#000000;"><% out.println(rs4.getString(1));%><br></div>
    
    <%}
    %>
   <div style="margin-left: 5px;vertical-align:middle;
text-align:left;
padding:7px;
font-size:18px;
font-family:Arial;
font-weight:normal;
color:#000000;"><% out.println("Popular Genres ");%></div>
        <%  while(rs5.next()){%>
    <div style="margin-left: 5px;vertical-align:middle;
text-align:left;
padding:7px;
font-size:15px;
font-family:Arial;
font-weight:normal;
color:#000000;"><% out.println(rs5.getString(1));%><br></div>
    
    <%}
    %>
        
    </body>
</html>
