<%-- 
    Document   : artistInfo
    Created on : Apr 13, 2015, 2:14:15 PM
    Author     : vinnie
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.PriorityQueue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
 <%String songId = request.getParameter("songId");%>
<%;
 Class.forName("com.mysql.jdbc.Driver");
ResultSet genreInfo = null;
ResultSet songInfo = null;
 ResultSet artist = null;
  ResultSet albumInfo = null;

         ArrayList songsList = new ArrayList();
         ArrayList genres = new ArrayList();
         ArrayList albums = new ArrayList();
        
         
        try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
    //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_project_db2?user=root&password=");
            Connection connection = DriverManager.getConnection("jdbc:mysql://db541.cqnjoukfuc0e.us-west-2.rds.amazonaws.com:3306/database_project_db2?user=vineeta&password=database541");
//out.println("hello ");
       Statement statement = connection.createStatement() ;
       Statement statement1 = connection.createStatement() ;
        Statement statement2 = connection.createStatement() ;
        Statement statement3 = connection.createStatement() ;
       String sql = "SELECT DISTINCT name FROM genres where songId = '"+songId+"' "; 
       String sql3 = "SELECT DISTINCT albumName FROM albums where songId = '"+songId+"'"; 
         // sql = sql +" And s.artistId =  "+artistId; 
    //  }
         String sql1 = "SELECT artistId,songName,songLanguage,songCountry,rating,viewCount,releaseDate,decade,youtubeId FROM songs where youtubeId = '"+songId+"' LIMIT 1"; 
        albumInfo=statement3.executeQuery(sql3);
         genreInfo = statement.executeQuery(sql);
         songInfo= statement1.executeQuery(sql1);
        while(songInfo.next()){
            songsList.add(songInfo.getString(1));
             songsList.add(songInfo.getString(2));
              songsList.add(songInfo.getString(3));
               songsList.add(songInfo.getString(4));
                songsList.add(songInfo.getString(5));
                songsList.add(songInfo.getString(6));
                songsList.add(songInfo.getString(7));
        }
        while(genreInfo.next()){
           
           genres.add(genreInfo.getString(1));
        }
        while(albumInfo.next()){
           
           albums.add(albumInfo.getString(1));
        }
        if(songsList.size() >0){
            //out.println(songsList.get(0));
       String sql2 = "SELECT DISTINCT artistName FROM artists where artistId = '"+songsList.get(0)+"'";
        artist= statement2.executeQuery(sql2);
        }
    }catch(Exception sqlex){
        sqlex.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Songs Information</title>
     <link rel="stylesheet" type="text/css" href="style_2.css">
    </head>
    <body>
        <h2 style="height: 20px;color: navy"><%=songsList.get(1) %></h2>
         <table class="newtable">
       <tr>
           <td>  <strong>Album of Song </strong></td><td> : </td>
          <% if(albums !=null){%>
         <td>  <%=albums.get(0)%> 
        <% for(int l=1;l<albums.size();l++){%>
             , <%=albums.get(l)%> 
      <%  } %>
     </td>
        <%  }%>
       
       </tr>  
        <tr>
            <td>  <strong>Genre of Song </strong></td><td> : </td>
         <% if(genres !=null){%>
         <td> <%=genres.get(0)%>
        <% for(int l=1;l<genres.size();l++){%>
            , <%=genres.get(l)%>
      <%  } %>
      </td>
        <%  }%>
      
       </tr>  
       
       <% if(songsList.size() >0){%>
        <tr>
            <td>  <strong>Artist of Song  </strong></td><td> : </td>
            
            <%while(artist.next()){%>
            <td> 
                
               <%=artist.getString(1) %>
        
                
            </td>
        

          <% } %>  
       </tr>  
        <tr>
            <td>  <strong>Language of Song </strong></td><td> : </td>
            
             <td>  <%=songsList.get(2) %></td>
         
        
       </tr>  
      
        <tr>
            <td>  <strong>Release Country </strong></td><td> : </td>
            
             <td>  <%=songsList.get(3) %></td>
         
         
       </tr>  
        <tr>
            <td>  <strong>Release Year </strong></td><td> : </td>
            
             <td>  <%=songsList.get(6) %></td>
         
         
       </tr>  
       <tr>
            <td>  <strong>Overall Rating </strong></td><td> : </td>
            
             <td> <%=songsList.get(4) %></td>
         
        
       </tr>  
       <tr>
            <td>  <strong>View Count  </strong></td><td> : </td>
            
             <td> <%=songsList.get(5) %></td>
         
         
       </tr>  
       <%}%>
        </table>
              </body>
</html>
