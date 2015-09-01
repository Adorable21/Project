<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.sql.*"%>
<%-- 
    Document   : response
    Created on : Apr 8, 2015, 1:14:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
  
    
    String artist = request.getParameter("artistId");
    String country = request.getParameter("countryval");
    String language = request.getParameter("languageval");
     String genre = request.getParameter("genreval");
     
%>  


<%;
ResultSet songs = null;
ArrayList lists =new ArrayList();
        try{
            Class.forName("com.mysql.jdbc.Driver");
//Class.forName("com.mysql.jdbc.Driver").newInstance();
    //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_project_db2?user=root&password=");
Connection connection = DriverManager.getConnection("jdbc:mysql://db541.cqnjoukfuc0e.us-west-2.rds.amazonaws.com:3306/database_project_db2?user=vineeta&password=database541");
       Statement statement = connection.createStatement() ;
       String sql = "SELECT DISTINCT a.artistId,a.artistName FROM artists a ";
       
           
            if(genre!= null && genre !="" && !genre.equals("")){
               // out.println("hello art "+artist);
                sql = sql+",genres g,songs s where g.songId = s.youtubeId And a.artistId=s.artistId And  g.name = '"+genre+"'";
                    if(country!= null && country !="" && !country.equals("")){
                       // out.println("hello country "+country);
                       sql = sql+" And s.songCountry ='"+country+"'"; 
                    }
                    if(language!= null && language !="" && !language.equals("")){
                        //out.println("hello language "+language);
                          sql = sql+" And s.songLanguage ='"+language+"'"; 
                    }
                     if(artist!= null && artist !="" && !artist.equals("")){
                        // out.println("hello song "+artist);
                          sql = sql+" And a.artistName like '%"+artist+"%'"; 
                    }
                    
            }else{
                //out.println("i ma here");
       
                 if(country!= null && country !="" && !country.equals("")){
                    // out.println("i am here country "+country);
                       sql = sql+",songs s where a.artistId=s.artistId And s.songCountry ='"+country+"'"; 
                    
                    if(language!= null && language !="" && !language.equals("")){
                      //  out.println("i am here language "+language);
                          sql = sql+" And s.songLanguage ='"+language+"'"; 
                    }
                    if(artist!= null && artist !="" && !artist.equals("")){
                       //  out.println("hello song "+artist);
                          sql = sql+" And a.artistName like '%"+artist+"%'"; 
                    }
                    
                  }else{
                      if(language!= null && language !="" && !language.equals("")){
                       // out.println("i am here 1111 language "+language);
                          sql = sql+",songs s where a.artistId=s.artistId And s.songLanguage ='"+language+"'"; 
                 
                      if(country!= null && country !="" && !country.equals("")){
                   //  out.println("i am here 1111 country "+country);
                       sql = sql+" And s.songCountry ='"+country+"'"; 
                      }
                        if(artist!= null && artist !="" && !artist.equals("")){
                       //  out.println("hello song 1111 "+artist);
                          sql = sql+" And a.artistName like '%"+artist+"%'"; 
                    }
                    
                     }else{
                             if(artist!= null && artist !="" && !artist.equals("")){
                       //  out.println("hello song22222 "+artist);
                          sql = sql+" Where a.artistName like '%"+artist+"%'"; 
                    }
                 
           }
           
       }
            }
       sql = sql+" Order by a.artistPopularityAll desc LIMIT 13";
         songs = statement.executeQuery(sql);
         while(songs.next()){
             lists.add(songs.getString(1));
              lists.add(songs.getString(2));
         }
    }catch(Exception sqlex){
        sqlex.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artist</title>
    </head>
    <body>
       <style>
           a:link{
               text-decoration: none;
              height: 30px;
              font-size: 20px;
              color: #000000;
              font-family: italics bold  Georgia, serif;
              
           }
           a:hover{
               font-size: 30px;
               color: ivory;
           }
       </style>
        
        <%if(lists.size()>0){  
        for(int s=0;s<lists.size();s+=2){ %>
    <tr>
         
            
        <td>   <a href ="javascript:parentframe('<%= lists.get(s)%>');" id="artistId" ><%= lists.get(s + 1)%></a></td>
</tr>
    
    <br>
        <% } }else{%>
        <th> NO RESULTS FOUND FOR SELECTED COMBINATION</th>
       <% }%>
    <script type="text/javascript">
        function parentframe(artistId){
            var frame2=parent.parent.document.getElementById('artistframe_2');
             var url ='artistInfo.jsp?&artistId='+artistId;
             frame2.style.display="";
             frame2.src=url;
  
        }
          </script>
    </body>
</html>
