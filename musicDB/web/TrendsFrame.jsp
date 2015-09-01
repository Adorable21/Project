<%-- 
    Document   : TrendsFrame
    Created on : Apr 19, 2015, 10:42:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        a{
            display: block;
            width: 100%;
            font-size: 20px;
            color: #777;
            text-decoration: none;
            font:  italics bold  Georgia, serif;
            
        }
        a:hover{
            color: #000;
            background: transparent;
            border-color: #aaab9c #fff #fff #ccc;
            font-weight: 900;
            
            font: italics bold;
        }

    </style>
    <body>
        <h2 style="color: burlywood">Trends</h2>
        <a href="linechart.jsp" id="current" target="_top">
        <p>Find out who is leading the charts</p>
        
        </a>
        <a href="mapfromcsv.jsp" id="current" target="_top">
        <p>Find out the trends in countries</p>
        
        </a>
    </body>
</html>
