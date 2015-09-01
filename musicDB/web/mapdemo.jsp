


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : mapdemo
    Created on : Apr 15, 2015, 7:16:28 PM
    Author     : Admin
--%>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%;
 /* Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_project_db?user=root&password=root");
  out.println("Hello");
  Statement st=connection.createStatement();
  //String id=request.getParameter("artistid");
  String sql="SELECT distinct artistName FROM artists where artistId=478672";
  ResultSet rs=st.executeQuery(sql);
  rs.next();
  out.println(rs.getString(1));*/

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="ammap.js" type="text/javascript"></script>
<script src="http://cdn.amcharts.com/lib/3/maps/js/worldHigh.js" type="text/javascript"></script>
<script src="http://cdn.amcharts.com/lib/3/themes/dark.js" type="text/javascript"></script>
   

<script type="text/javascript">
var map = AmCharts.makeChart("mapdiv",{
type: "map",
theme: "dark",
pathToImages : "http://cdn.amcharts.com/lib/3/images/",
panEventsEnabled : true,
backgroundColor : "#535364",
backgroundAlpha : 0,

zoomControl: {
panControlEnabled : true,
zoomControlEnabled : true

},
dataProvider : {
map : "worldHigh",
getAreasFromMap : true,
areas :
[]
},
areasSettings : {
autoZoom : true,
color : "#FFFFFF",
colorSolid : "#84ADE9",
selectedColor : "#3176D6",
outlineColor : "#666666",
rollOverColor : "#A1BDE6",
rollOverOutlineColor : "#000000"
}
});

function say(){
    var con=AmCharts.country;
   //alert(con);
   //request.setParameter()
  var str="countryInfo.jsp?c="+con;
  var frame=document.getElementById("myframe");
  frame.style.display="";
  frame.src=str;
  
}
  

</script>


    </head>
    <body>
        <h1 style="color:burlywood;">Explore
        <a href="homepage.jsp" style="float: right; text-decoration: none; color: burlywood; font-size: 20px;">Back</a>
        </h1>
        <style>
    body {
    background: url("pic6.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    }
     </style>
         <!--h1  id="header" style="font-size: 75px; 
    color: burlywood;"> MusiLytics</h1-->
     
     
         <!--div id="mapdiv"  onclick="document.location.href='countryInfo.jsp'" style="width: 100%; height: 600px;"></div-->
        <div   id="mapdiv" class="side first" onclick="say()" style="width: 80%; height: 675px; float: left; border-width: 0px;
               background-color: rgba(25, 25, 25,0.35);
               border-top:  0px ;
    border-right:  2px ;
    border-left: 2px ;
    border-bottom: 4px ;
    margin-top: 0px;
    margin-bottom: 30px;
   
    -moz-border-radius: 20px;
    -webkit-border-radius: 20px;
    border-radius: 20px;

    -moz-box-shadow: 4px 4px 14px #000;
    -webkit-box-shadow: 4px 4px 14px #000;
    box-shadow: 4px 4px 14px #000;
"></div>
         <iframe  id="myframe" style="display: none; float:right; width: 18%;height:675px; 
                   
    background-color: rgba(161, 189, 230,0.35);
    border-top:  0px ;
    border-right:  2px ;
    border-left: 2px ;
    border-bottom: 4px ;
    margin-top: 0px;
    margin-bottom: 30px;
  

    -moz-border-radius: 12px;
    -webkit-border-radius: 12px;
    border-radius: 12px;

    -moz-box-shadow: 4px 4px 14px #000;
    -webkit-box-shadow: 4px 4px 14px #000;
    box-shadow: 4px 4px 14px #000;"></iframe>
       
    </body>
</html>
