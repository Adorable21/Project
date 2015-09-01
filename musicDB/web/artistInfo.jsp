<%-- 
    Document   : artistInfo
    Created on : Apr 13, 2015, 2:14:15 PM
    Author     : vinnie
--%>
<%@page import="java.util.PriorityQueue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
 <%String artistId = request.getParameter("artistId");%>
<%;

 Class.forName("com.mysql.jdbc.Driver");
ResultSet artistInfo = null;
ResultSet artistSongInfo = null;
ResultSet songCount = null;
 ArrayList info=new ArrayList();
 ArrayList lang = new ArrayList();
 double value=0.0;
        String artistName =null;
         ArrayList country = new ArrayList();
         PriorityQueue release = new PriorityQueue();
        try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
  // Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_project_db2?user=root&password=");
    Connection connection = DriverManager.getConnection("jdbc:mysql://db541.cqnjoukfuc0e.us-west-2.rds.amazonaws.com:3306/database_project_db2?user=vineeta&password=database541");
            Statement statement = connection.createStatement() ;
       Statement statement1 = connection.createStatement() ;
              Statement statement2 = connection.createStatement() ;
       String sql = "SELECT artistName,MAX(artistPopularityAll) FROM artists where artistId = "+artistId+" LIMIT 1"; 
         // sql = sql +" And s.artistId =  "+artistId; 
    //  }
         String sql1 = "SELECT songName,songLanguage,songCountry,rating,viewCount,releaseDate,decade,youtubeId FROM songs where artistId = "+artistId+"  Order by viewCount desc LIMIT 10"; 
          String sql2 = "SELECT count(*) FROM songs where artistId = "+artistId; 
        
         artistInfo = statement.executeQuery(sql);
         artistSongInfo= statement1.executeQuery(sql1);
        songCount=statement2.executeQuery(sql2);
        while(artistSongInfo.next()){
           
           info.add(artistSongInfo.getString(1));
           String language =artistSongInfo.getString(2);
           String songCountry =artistSongInfo.getString(3);
           if(!lang.contains(language)){
               lang.add(language);
           }
            if(!country.contains(songCountry)){
               country.add(songCountry);
           }
            info.add(language);
             info.add(songCountry);
              info.add(artistSongInfo.getString(4));
               info.add(artistSongInfo.getString(5));
               release.add(artistSongInfo.getString(6));
        }
        
       
          while(artistInfo.next()){ 
       artistName =artistInfo.getString(1);
       
        
         value =((artistInfo.getInt(2))/188999857.0)*100 ;
        
          }
        
        
    }catch(Exception sqlex){
        sqlex.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style_2.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Score Card</title>
         <style>
             progress{
                 background-color: red;
                 color: palegreen;
                 border-radius: 2px;
                 box-shadow: 0 2px 5px rgba(0, 0, 0, 0.25) inset;
                 -moz-box-shadow: 4px 4px 14px #000;
                -webkit-box-shadow: 4px 4px 4px #000;
                 box-shadow: 4px 4px 4px #000;
                 -moz-border-radius: 2px;
                 -webkit-border-radius: 2px;
                  border-radius: 2px;
             }

     </style>
    </head>
    <body>
        <h1 style="height: 20px;color: navy"><%=artistName%></h1>
        <table class="newtable">
              <tr>
              <td>
                  <table class="newtable">
          <tr>
              <td>  Languages </td><td> : </td>
          <% if(lang !=null){%>
         <td>  <%=lang.get(0)%>
        <% for(int l=1;l<lang.size();l++){%>
             , <%=lang.get(l)%>
      <%  } %>
      </td>
         <% }%>
          
       
</tr>

        

<tr>
    <td>  Countries </td><td> : </td>
          <% if(country !=null){%>
         <td>  <%=country.get(0)%>
        <% for(int c=1;c<country.size();c++){%>
       , <%=country.get(c)%>
      <%  } %>
         </td>
       <%   }%>
          
       
</tr>
          
<tr>
              <td> Started in </td><td> : </td>
          <% if(release !=null){%>
         <td>  <%=release.peek()%></td>
       
          <%}%>
          
        
</tr>
<tr>
              <td> Number of songs </td><td> : </td>
           <%  while(songCount.next()){ %>  
           <td>  <%=songCount.getString(1)%></td>
       
          <%}%>
          
       
</tr>
</td>
                  </table>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>



              <td> <strong style="font-size: 25px;font-family: Aerial"> POPULARITY</strong>
                <br>
                <br>
               
                
                    <progress max="100" value="<%=value%>">
  
</progress>
                
            </td>
              </tr>
          </table>
<br>  <br> 
       <div class="CSSTableGenerator" width="100%">
   <table border="0">
              <th>Song Name</th>
              <th>Language</th>
              <th>Country</th>
              <th>Rating</th>
              <th>View Count</th>
              
              <%  for(int i=0;i<info.size();i+=5){
                  double width= (Double.parseDouble(info.get(i + 3).toString()))/5*100;
                  
              %>  
                <tr>

                      
                      
                    <td>  <%=info.get(i)%></td>
            <td>  <%=info.get(i + 1)%></td>
              <td>  <%=info.get(i + 2)%></td>
                <td>  <span style="display: block; width: 65px; height: 13px; background: url(star-rating-sprite.png) 0 0;">
   <span style="display: block; width: <%=width%>%; height: 13px; background: url(star-rating-sprite.png) 0 -13px;"></span>
</span></td>
                  <td>  <%=info.get(i + 4)%></td>
                </tr>     
                            
               
                 <% } %> 
                 
                 
                 
   </table> </div>
    </body>
</html>
