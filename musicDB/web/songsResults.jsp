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
    
    String albumName = request.getParameter("albumId");
    String artist = request.getParameter("artistId");
    String country = request.getParameter("countryval");
    String language = request.getParameter("languageval");
     String song = request.getParameter("songId");
      
%>  


<%;
ResultSet songs = null;
ArrayList lists =new ArrayList();
        try{
            Class.forName("com.mysql.jdbc.Driver");
//Class.forName("com.mysql.jdbc.Driver").newInstance();
   // Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_project_db2?user=root&password=");
Connection connection = DriverManager.getConnection("jdbc:mysql://db541.cqnjoukfuc0e.us-west-2.rds.amazonaws.com:3306/database_project_db2?user=vineeta&password=database541");
       Statement statement = connection.createStatement() ;
       String sql = "SELECT s.youtubeId,s.songName FROM songs s ";
       if(albumName != null && albumName !="" && !albumName.equals("")){
           
            if(artist!= null && artist !="" && !artist.equals("")){
                //out.println("hello art "+artist);
                sql = sql+",albums al,artists a where s.youtubeId = al.songId And a.artistId=s.artistId And  al.albumName like '%"+albumName+"%' And a.artistName like '%"+ artist +"%'";
                    if(country!= null && country !="" && !country.equals("")){
                       // out.println("hello country "+country);
                       sql = sql+" And s.songCountry ='"+country+"'"; 
                    }
                    if(language!= null && language !="" && !language.equals("")){
                        //out.println("hello language "+language);
                          sql = sql+" And s.songLanguage ='"+language+"'"; 
                    }
                     if(song!= null && song !="" && !song.equals("")){
                        // out.println("hello song "+song);
                          sql = sql+" And s.songName like '%"+song+"%'"; 
                    }
                    
            }else{
                //out.println("i ma here");
                sql = sql+",albums al where al.songId=s.youtubeId And al.albumName like '%"+albumName+"%'";
                 if(country!= null && country !="" && !country.equals("")){
                    // out.println("i am here country "+country);
                       sql = sql+" And s.songCountry ='"+country+"'"; 
                    }
                    if(language!= null && language !="" && !language.equals("")){
                       // out.println("i am here language "+language);
                          sql = sql+" And s.songLanguage ='"+language+"'"; 
                    }
                    if(song!= null && song !="" && !song.equals("")){
                       // out.println("i am here song "+song);
                          sql = sql+" And s.songName like '%"+song+"%'"; 
                    }
                    
            }
       }else{
           if(artist!= null && artist !="" && !artist.equals("")){
              // out.println("no album  artist ????? "+artist);
               sql = sql+",artists a where a.artistId=s.artistId And a.artistName like '%"+artist+"%'";
                 if(country!= null && country !="" && !country.equals("")){
                    // out.println("no album  country "+country);
                       sql = sql+" And s.songCountry ='"+country+"'"; 
                    }
                    if(language!= null && language !="" && !language.equals("")){
                       // out.println("no album  language "+language);
                          sql = sql+" And s.songLanguage ='"+language+"'"; 
                    }
                    if(song!= null && song !="" && !song.equals("")){
                       // out.println("no album  song "+song);
                          sql = sql+" And s.songName like '%"+song+"%'"; 
                    }
                    
       }else{
               if(country!= null && country !="" && !country.equals("")){
                  // out.println("no album  no artist country "+country);
                      sql = sql+" Where s.songCountry ='"+country+"'"; 
                   
                    if(language!= null && language !="" && !language.equals("")){
                      //  out.println("no album  no artist language "+language);
                            sql = sql+" And s.songLanguage ='"+language+"'"; 
                          if(song!= null && song !="" && !song.equals("")){
                           //   out.println("no album  no artist song "+song);
                             sql = sql+" And s.songName like '%"+song+"%'"; 
                            }
                    }
               }else{
                 //  out.println("in else");
                        if(language!= null && language !="" && !language.equals("")){
                           // out.println("none but language"+language);
                            sql = sql+" Where s.songLanguage ='"+language+"'"; 
                          if(song!= null && song !="" && !song.equals("")){
                             // out.println("none but song"+song);
                             sql = sql+" And s.songName like '%"+song+"%'"; 
                            }
                    }
                        else{
                           if(song!= null && song !="" && !song.equals("")){
                              // out.println("only song"+song);
                             sql = sql+" Where s.songName like '%"+song+"%'"; 
                            }  
                        }
                   
               }
                 
           }
           
       }
       sql = sql+" Order by s.viewCount desc LIMIT 12";
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
        <link rel="stylesheet" type="text/css" href="style_1.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <style>
           a:link{
               text-decoration: none;
              height: 30px;
              font-size: 20px;
              color: #000000;
              
           }
           a:hover{
               font-size: 30px;
               color: ivory;
           }
       </style>
        
        <%if(lists.size()>0){  
        for(int s=0;s<lists.size();s+=2){ %>
    
    <td>   <a href ="javascript:parentframe('<%= lists.get(s)%>');" id="songId" ><%= lists.get(s + 1)%></a></td>
       

    
    <br>
        <% } }else{%>
        <th> NO RESULTS FOUND FOR SELECTED COMBINATION</th>
       <% }%>
    
    <script type="text/javascript">
        function parentframe(songId){
        var frame3=parent.parent.document.getElementById('iframe_3');
        var url ='songsInfo.jsp?&songId='+songId;
        var frame2=parent.parent.document.getElementById('iframe_2');
        var youtubeurl ='https://www.youtube.com/embed/'+songId;
        frame3.style.display="";
        frame3.src=url;
        frame2.style.display="";
        frame2.src=youtubeurl;
  
        }
 
    </script>
    </body>
</html>
