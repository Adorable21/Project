<%-- 
    Document   : homepage
    Created on : Apr 19, 2015, 3:17:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="./newcss.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >
     <style>
    body {
    background: url("pic2.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    }
     </style>
    
     

     <!--h1  id="header" > MusiLytics</h1-->
  <table> 
      <tr></tr>
   <tr>
  <td><iframe src="SearchFrame.jsp" scrolling="no"></iframe></td>
  
 <td> <iframe src="CountryFrame.jsp"></iframe></td>
 
   <td><iframe src="ArtistFrame.jsp"> </iframe></td>
    <td><iframe src="TrendsFrame.jsp"> </iframe></td>
   <td><iframe src="CompareFrame.jsp"></iframe></td>
  </tr>
  <tr>
      <td><h1 style="color: coral; font-size: 100px;font-weight: 900;height: 0px;
            
            font: italics bold; font-family: cursive;float:right; text-shadow: 10px 10px #000 ">Musi</h1></td>
      <td><h1 style="color: indianred; font-size: 100px;font-weight: 900; height: 40px;
            
            font: italics bold;  font-family: cursive;text-shadow: 10px 10px #000">Lytics</h1></td>
   </tr>
   <tr>
    <td></td>
    <td><h4 style="color: white;font-style:  italic; font-family: Segoe Marker;text-shadow: 5px 5px #000">Search, Play and Explore Music</h4></td>
   <tr>
  </table>
</body>
</html>
