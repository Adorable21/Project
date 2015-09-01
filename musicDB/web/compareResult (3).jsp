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
    String val1 = null;
    String val2 = null;
    String val3 = null;
    String val4 = null;
    try {
//Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_project_db?user=root&password=root");

        Statement statement = connection.createStatement();
        //Statement statement1 = connection.createStatement() ;

        String sql = null;
        if ((country1 != null && country2 != null && country1 != "" && country2 != "" && !country1.equals("") && !country2.equals("")) || (genre1 != null && genre2 != null && genre1 != "" && genre2 != "" && !genre1.equals("") && !genre2.equals("")) || (lang1 != null && lang2 != null && lang1 != "" && lang2 != "" && !lang1.equals("") && !lang2.equals(""))) {
            if (country1 != null && country2 != null && country1 != "" && country2 != "" && !country1.equals("") && !country2.equals("")) {
                //out.println("country not null");
                if (lang1 != null && lang2 != null && lang1 != "" && lang2 != "" && !lang1.equals("") && !lang2.equals("")) {
                    val1 = lang1;
                    val2 = lang2;
                    val3 = country1;
                    val4 = country2;
                    sql = "SELECT songLanguage,songCountry,AVG(viewCount) FROM songs Where (songLanguage='" + lang1 + "' OR songLanguage='" + lang2 + "') AND (songCountry='" + country1 + "' OR songCountry='" + country2 + "') GROUP BY songCountry,songLanguage";
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
        if (data != null) {
            while (data.next()) {
                doubleComp.add(data.getString(1));
                doubleComp.add(data.getString(2));
                doubleComp.add(data.getString(3));
            }
        }
        if (data1 != null) {
            while (data1.next()) {
                singleComp.add(data1.getString(1));
                singleComp.add(data1.getString(2));
            }
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
                    data: {table: 'datatable1'},
                    title: {
                        text: 'Compare Reults'

                    }
                });



            });
        </script>
    </head>
    <body>

        <table border="0" hidden="true">

            <tbody>
                <% ArrayList crit1 = new ArrayList();
                    ArrayList crit2 = new ArrayList();
                    ArrayList vals = new ArrayList();
                    boolean flag = false;
                    if (doubleComp.size() > 0) {
                        if (doubleComp.size() < 12) {
                            for (int i = doubleComp.size(); i < 12; i += 3) {
                                doubleComp.add(" ");
                                doubleComp.add(" ");
                                doubleComp.add(0);

                            }
                        }
                        //out.println(doubleComp.size());
                        for (int d = 0; d < doubleComp.size(); d += 3) {%>

                <tr>

                    <td><%=doubleComp.get(d)%></td>
                    <%
                        if (!crit1.contains(doubleComp.get(d))) {
                            crit1.add(doubleComp.get(d));
                        }%>
                    <td><%=doubleComp.get(d + 1)%></td>
                    <%
                        if (!crit2.contains(doubleComp.get(d + 1))) {
                            crit2.add(doubleComp.get(d + 1));
                        }%>
                    <td><%=doubleComp.get(d + 2)%></td>
                    <%
                        vals.add(doubleComp.get(d + 2));%>


            <br>
            </tr>

            <% }

            } else if (singleComp.size() > 0) {

                // out.println("data 111 not null");
                for (int s = 0; s < singleComp.size(); s += 2) {%>

            <tr>
                <td><%=singleComp.get(s)%></td>
                <td><%=singleComp.get(s + 1)%></td>

            <br>
            </tr>

            <% }
            } else {%>
            <th style="color:red"> NO DATA FOUND FOR SELECTED VALUES....PLEASE TRY SOME DIFFERENT COMPARISON</th>
                <% }

                    if (crit1.size() == 2 && crit2.size() == 2 && vals.size() == 4) {
                        flag = true;
                    }
                %>


        </tbody>
    </table>
    <%if (doubleComp.size() > 0) {%>
    <table id="datatable1" hidden="true">
        <% if (flag) {%>
        <tr>
            <td></td>
            <td><%=crit1.get(0)%></td>
            <td><%=crit1.get(1)%></td>
        </tr>
        <tr>
            <td><%=crit2.get(0)%></td>
            <td><%=vals.get(0)%></td>
            <td><%=vals.get(1)%></td>
        </tr>
        <tr>
            <td><%=crit2.get(1)%></td>
            <td><%=vals.get(2)%></td>
            <td><%=vals.get(3)%></td>
        </tr>
        <% }%>
    </table>
    <%
    } else if (singleComp.size() > 0) {%>


    <table id="datatable1"  hidden="true">


        <tr>
            <td></td>
            <td>viewcount</td>

        </tr>
        <tr>
            <td><%=singleComp.get(0)%></td>
            <td><%=singleComp.get(1)%></td>

        </tr>
        <tr>
            <td><%=singleComp.get(2)%></td>
            <td><%=singleComp.get(3)%></td>

        </tr>
    </table>

    <% } else { %>
    <h2 style="color: navy; margin-top: 250px"> </h2>
    <%        }
    %>
    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
    <!--div id="singlecomp" style="min-width: 310px; height: 400px; margin: 0 auto"></div-->
</body>
</html>
