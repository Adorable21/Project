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
<%

    String country1 = request.getParameter("countryval1");
    String country2 = request.getParameter("countryval2");
    String lang1 = request.getParameter("languageval1");
    String lang2 = request.getParameter("languageval2");
    String genre1 = request.getParameter("genreval1");
    String genre2 = request.getParameter("genreval2");
    // out.println(country1);
    // out.println(country2);
    // out.println(lang1);
    // out.println(lang2);
    // out.println(genre1);
    // out.println(genre2);
%> 
<%;
    Class.forName("com.mysql.jdbc.Driver");
    ResultSet data = null;
    ResultSet data1 = null;
    ArrayList doubleComp = new ArrayList();
    ArrayList singleComp = new ArrayList();
    try {
//Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_project_db2?user=root&password=");

        Statement statement = connection.createStatement();
        //Statement statement1 = connection.createStatement() ;

        String sql = null;
        if ((country1 != null && country2 != null && country1 != "" && country2 != "" && !country1.equals("") && !country2.equals("")) || (genre1 != null && genre2 != null && genre1 != "" && genre2 != "" && !genre1.equals("") && !genre2.equals("")) || (lang1 != null && lang2 != null && lang1 != "" && lang2 != "" && !lang1.equals("") && !lang2.equals(""))) {
            if (country1 != null && country2 != null && country1 != "" && country2 != "" && !country1.equals("") && !country2.equals("")) {
                //out.println("country not null");
                if (lang1 != null && lang2 != null && lang1 != "" && lang2 != "" && !lang1.equals("") && !lang2.equals("")) {
                    //  out.println("lang not null");
                    sql = "SELECT songLanguage,songCountry,AVG(viewCount) FROM songs Where (songLanguage='" + lang1 + "' OR songLanguage='" + lang2 + "') AND (songCountry='" + country1 + "' OR songCountry='" + country2 + "') GROUP BY songCountry,songLanguage";
                    //sql = "SELECT songLanguage,songCountry FROM songs Where  songCountry='" + country1 + "'";
                   data = statement.executeQuery(sql);
                } else if (genre1 != null && genre2 != null && genre1 != "" && genre2 != "" && !genre1.equals("") && !genre2.equals("")) {
                    sql = "SELECT g.name,s.songCountry,AVG(s.viewCount) FROM songs s,genres g Where s.youtubeId=g.songId AND (g.name='" + genre1 + "' OR g.name='" + genre2 + "') AND (s.songCountry='" + country1 + "' OR s.songCountry='" + country2 + "') GROUP BY s.songCountry,g.name";
                    data = statement.executeQuery(sql);
                } else {
                    sql = "SELECT songCountry,AVG(viewCount) FROM songs Where  (songCountry='" + country1 + "' OR songCountry='" + country2 + "') GROUP BY songCountry";
                    data1 = statement.executeQuery(sql);
                }

            } else if (lang1 != null && lang2 != null && lang1 != "" && lang2 != "" && !lang1.equals("") && !lang2.equals("")) {
                if (genre1 != null && genre2 != null && genre1 != "" && genre2 != "" && !genre1.equals("") && !genre2.equals("")) {
                    sql = "SELECT g.name,s.songLanguage,AVG(s.viewCount) FROM songs s,genres g Where s.youtubeId=g.songId AND (g.name='" + genre1 + "' OR g.name='" + genre2 + "') AND (s.songLanguage='" + lang1 + "' OR s.songLanguage='" + lang2 + "') GROUP BY s.songLanguage,g.name";
                    data = statement.executeQuery(sql);
                } else {
                    //out.println("here");
                    sql = "SELECT songLanguage,AVG(viewCount) FROM songs Where  (songLanguage='" + lang1 + "' OR songLanguage='" + lang2 + "') GROUP BY songLanguage";
                    data1 = statement.executeQuery(sql);
                }
            } else if (genre1 != null && genre2 != null && genre1 != "" && genre2 != "" && !genre1.equals("") && !genre2.equals("")) {
                // out.println("genre");
                sql = "SELECT g.name,AVG(s.viewCount) FROM songs s,genres g Where s.youtubeId=g.songId AND (g.name='" + genre1 + "' OR g.name='" + genre2 + "')GROUP BY g.name";
               data1 = statement.executeQuery(sql);
            }

        }

        while (data.next()) {
            doubleComp.add(data.getString(1));
            doubleComp.add(data.getString(2));
            doubleComp.add(data.getString(3));
        }
        while (data1.next()) {
            singleComp.add(data1.getString(1));
            singleComp.add(data1.getString(2));
        }
    } catch (Exception sqlex) {
        // out.println("sql exception");
        sqlex.printStackTrace();

    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Music DB Compare Page</title>
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

       <script src="http://code.highcharts.com/maps/modules/map.js"></script>

<script src="http://code.highcharts.com/mapdata/custom/world.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
<script src="http://code.highcharts.com/highcharts.js" type="text/javascript"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<script src="http://code.highcharts.com/modules/data.js"></script>
        <script>
            $(function () {
                $('#container').highcharts({
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Compare Reults',
                        x: -20 //center
                    },
                    xAxis: {
                        categories: ['United Kingdom', 'Austria']
                    },
                    yAxis: {
                        title: {
                            text: 'Number of views'
                        },
                        plotLines: [{
                                value: 0,
                                width: 1,
                                color: '#808080'
                            }]
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: [{
                            name: 'English',
                            data: [157614, 75963]
                        },
                        {
                            name: 'Spanish',
                            data: [179592, 6327]
                        }

                    ]
                });

                
            });
        </script>
    </head>
    <body>

        <table border="0">

            <tbody>
               
        </tbody>
    </table>
    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto;margin-top: 100px"></div>
    
</body>
</html>
