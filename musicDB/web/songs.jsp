<%-- 
    Document   : songs
    Created on : May 2, 2015, 1:26:51 PM
    Author     : vinnie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
    body {
    background: url("pic6.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    }
     </style>
     <h1 style="height:10px; color:  burlywood">Search and Play Songs
      <a href="homepage.jsp" style="float: right; text-decoration: none; color: burlywood; font-size: 20px;">Back</a>
     </h1>
        <iframe  id="iframe_1" src="songsSearch.jsp" style=" float:left; width: 38%;height:675px; 
                   
    background-color: rgba(161, 189, 230,0.35);
    border-top:  1px ;
    border-right:  2px ;
    border-left: 2px ;
    border-bottom: 4px ;
    margin-top: 20px;
    margin-bottom: 30px;
  

    -moz-border-radius: 12px;
    -webkit-border-radius: 12px;
    border-radius: 12px;

    -moz-box-shadow: 4px 4px 14px #000;
    -webkit-box-shadow: 4px 4px 14px #000;
    box-shadow: 4px 4px 14px #000;"></iframe>
      <iframe  id="iframe_2" style="display: none; float:right; width: 60%;height:400px; 
                   
    background-color: rgba(161, 189, 230,0.35);
    border-top:  1px ;
    border-right:  2px ;
    border-left: 2px ;
   border-bottom: 0px;
    margin-top: 20px;
    margin-bottom: 5px;
  margin-right: 5px;

    -moz-border-radius: 12px;
    -webkit-border-radius: 12px;
    border-radius: 12px;

    -moz-box-shadow: 4px 4px 14px #000;
    -webkit-box-shadow: 4px 4px 14px #000;
    box-shadow: 4px 4px 14px #000;"></iframe>
      
       <iframe  id="iframe_3" style="display: none; float:right; width: 60%;height:265px; 
                   
    background-color: rgba(161, 189, 230,0.35);
    
    border-right:  2px ;
    border-left: 2px ;
    border-bottom: 0px;
    
    margin-top: 0px;
    margin-bottom: 5px;
    margin-right: 5px;

    -moz-border-radius: 12px;
    -webkit-border-radius: 12px;
    border-radius: 12px;

    -moz-box-shadow: 4px 4px 14px #000;
    -webkit-box-shadow: 4px 4px 14px #000;
    box-shadow: 4px 4px 14px #000;"></iframe>
    </body>
</html>
