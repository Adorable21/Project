<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : linechart
    Created on : Apr 30, 2015, 11:22:30 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            title: {
                text: 'Popularity of Top Songs',
                x: -20 //center
            },
            xAxis: {
                categories: ['Feb 10', 'Feb 13', 'Feb 16', 'Feb 21']
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
                    name: 'Baby',
                    data: [210769, 368481, 282932, 307047]
                }, {
                    name: 'Dark Horse',
                    data: [1895086, 2070032, 1507489, 1458927]
                },
                {
                    name: 'Party Rock Anthem',
                    data: [409561, 665707, 491784, 564705]
                },
                {
                    name: 'Roar',
                    data: [0, 1686322, 1272860, 1256019]
                },
                {
                    name: 'Love the way you lie',
                    data: [448622, 605972, 496999, 567241]
                }

            ]
        });
});

    $.get('genre_distribution.csv', function (csv) {
        $('#container2').highcharts({
            chart: {
                type: 'column'
            },
            data: {
                csv: csv
            },
            title: {
                text: 'Distribution of Songs by Genres'
            },
            yAxis: {
                title: {
                    text: 'No of Songs'
                }
            }
        });
    });
    $.get('language_distribution.csv', function (csv) {
        $('#container3').highcharts({
            chart: {
                type: 'column'
            },
            data: {
                csv: csv
            },
            title: {
                text: 'Popular Album Languages'
            },
            yAxis: {
                title: {
                    text: 'Number of Albums'
                }
            }
        });
        
        

    // Prepare demo data
    //number of albums
   /* var data1 = [
        {
            "hc-key": "dz",
            "value": 146
        },
        {
            "hc-key": "ao",
            "value": 12
        },
        {
            "hc-key": "eg",
            "value": 669
        },
        {
            "hc-key": "bd",
            "value": 210
        },
        {
            "hc-key": "ne",
            "value": 12
        },
        {
            "hc-key": "qa",
            "value": 1
        },
        {
            "hc-key": "na",
            "value": 41
        },
        {
            "hc-key": "bg",
            "value": 898
        },
        {
            "hc-key": "bo",
            "value": 361
        },
        {
            "hc-key": "gh",
            "value": 33
        },
        {
            "hc-key": "pk",
            "value": 299
        },
        {
            "hc-key": "pa",
            "value": 80
        },
        {
            "hc-key": "jo",
            "value": 54
        },
        {
            "hc-key": "eh",
            "value": 4
        },
        {
            "hc-key": "ly",
            "value": 1
        },
        {
            "hc-key": "my",
            "value": 2369
        },
        {
            "hc-key": "pr",
            "value": 2663
        },
        {
            "hc-key": "kp",
            "value": 73
        },
        {
            "hc-key": "tz",
            "value": 19
        },
        {
            "hc-key": "pt",
            "value": 15078
        },
        {
            "hc-key": "kh",
            "value": 13
        },
        {
            "hc-key": "py",
            "value": 65
        },
        {
            "hc-key": "sa",
            "value": 79
        },
        {
            "hc-key": "me",
            "value": 29
        },
        {
            "hc-key": "si",
            "value": 9461
        },
        {
            "hc-key": "bf",
            "value": 1
        },
        {
            "hc-key": "ch",
            "value": 22760
        },
        {
            "hc-key": "mr",
            "value": 2
        },
        {
            "hc-key": "hr",
            "value": 9594
        },
        {
            "hc-key": "cl",
            "value": 7469
        },
        {
            "hc-key": "cn",
            "value": 4611
        },
        {
            "hc-key": "kn",
            "value": 3
        },
        {
            "hc-key": "jm",
            "value": 4704
        },
        {
            "hc-key": "dj",
            "value": 3
        },
        {
            "hc-key": "gn",
            "value": 16
        },
        {
            "hc-key": "fi",
            "value": 113085
        },
        {
            "hc-key": "uy",
            "value": 1523
        },
        {
            "hc-key": "va",
            "value": 37 
        },
        {
            "hc-key": "np",
            "value": 37
        },
        {
            "hc-key": "ma",
            "value": 68
        },
        {
            "hc-key": "ye",
            "value": 2
        },
        {
            "hc-key": "ph",
            "value": 5253
        },
        {
            "hc-key": "za",
            "value": 13301
        },
        {
            "hc-key": "ni",
            "value": 45
        },
        {
            "hc-key": "cyn",
            "value": 4
        },
        {
            "hc-key": "vi",
            "value": 321
        },
        {
            "hc-key": "sy",
            "value": 27
        },
        {
            "hc-key": "li",
            "value": 109
        },
        {
            "hc-key": "mt",
            "value": 143
        },
        {
            "hc-key": "kz",
            "value": 19
        },
        {
            "hc-key": "mn",
            "value": 79
        },
        {
            "hc-key": "sr",
            "value": 10
        },
        {
            "hc-key": "ie",
            "value": 8180
        },
        {
            "hc-key": "dm",
            "value": 7
        },
        {
            "hc-key": "bj",
            "value": 13
        },
        {
            "hc-key": "ng",
            "value": 234
        },
        {
            "hc-key": "be",
            "value": 64001
        },
        {
            "hc-key": "tg",
            "value": 16
        },
        {
            "hc-key": "de",
            "value": 695421
        },
        {
            "hc-key": "lk",
            "value": 47
        },
        {
            "hc-key": "gb",
            "value": 1058122
        },
        {
            "hc-key": "gy",
            "value": 2
        },
        {
            "hc-key": "cr",
            "value": 521
        },
        {
            "hc-key": "cm",
            "value": 21
        },
        {
            "hc-key": "kas",
            "value": 6
        },
        {
            "hc-key": "km",
            "value": 6
        },
        {
            "hc-key": "ug",
            "value": 36
        },
        {
            "hc-key": "tm",
            "value": 2
        },
        {
            "hc-key": "tt",
            "value": 147
        },
        {
            "hc-key": "nl",
            "value": 166638
        },
        {
            "hc-key": "td",
            "value": 7
        },
        {
            "hc-key": "ge",
            "value": 124
        },
        {
            "hc-key": "ro",
            "value": 5189
        },
        {
            "hc-key": "scr",
            "value": 7
        },
        {
            "hc-key": "lv",
            "value": 5551
        },
        {
            "hc-key": "bz",
            "value": 75
        },
        {
            "hc-key": "mm",
            "value": 7
        },
        {
            "hc-key": "af",
            "value": 45
        },
        {
            "hc-key": "bi",
            "value": 7
        },
        {
            "hc-key": "by",
            "value": 965
        },
        {
            "hc-key": "gd",
            "value": 10
        },
        {
            "hc-key": "lr",
            "value": 8
        },
        {
            "hc-key": "gr",
            "value": 12787
        },
        {
            "hc-key": "ls",
            "value": 8
        },
        {
            "hc-key": "gl",
            "value": 73
        },
        {
            "hc-key": "ad",
            "value": 142
        },
        {
            "hc-key": "mz",
            "value": 2
        },
        {
            "hc-key": "tj",
            "value": 2
        },
        {
            "hc-key": "th",
            "value": 1485
        },
        {
            "hc-key": "ht",
            "value": 132
        },
        {
            "hc-key": "mx",
            "value": 24548
        },
        {
            "hc-key": "zw",
            "value": 77
        },
        {
            "hc-key": "lc",
            "value": 2
        },
        {
            "hc-key": "in",
            "value": 3995
        },
        {
            "hc-key": "vc",
            "value": 10
        },
        {
            "hc-key": "bt",
            "value": 2
        },
        
        {
            "hc-key": "vn",
            "value": 1314
        },
        {
            "hc-key": "no",
            "value": 24679
        },
        {
            "hc-key": "cz",
            "value": 22760
        },
        {
            "hc-key": "ag",
            "value": 2
        },
        {
            "hc-key": "fj",
            "value": 1
        },
        {
            "hc-key": "hn",
            "value": 41
        },
        {
            "hc-key": "mu",
            "value": 2
        },
        {
            "hc-key": "do",
            "value": 679
        },
        {
            "hc-key": "lu",
            "value": 1644
        },
        {
            "hc-key": "il",
            "value": 15127
        },
        {
            "hc-key": "sm",
            "value": 104
        },
        {
            "hc-key": "pe",
            "value": 2161
        },
        {
            "hc-key": "id",
            "value": 6760
        },
        {
            "hc-key": "vu",
            "value": 14
        },
        {
            "hc-key": "mk",
            "value": 414
        },
        {
            "hc-key": "cd",
            "value": 9
        },
        {
            "hc-key": "cg",
            "value": 9
        },
        {
            "hc-key": "is",
            "value": 2066
        },
        {
            "hc-key": "et",
            "value": 14
        },
        {
            "hc-key": "um",
            "value": 88
        },
        {
            "hc-key": "co",
            "value": 6302
        },
        {
            "hc-key": "ser",
            "value": 1
        },
        {
            "hc-key": "bw",
            "value": 19
        },
        {
            "hc-key": "md",
            "value": 72
        },
        {
            "hc-key": "mg",
            "value": 11
        },
        {
            "hc-key": "ec",
            "value": 499
        },
        {
            "hc-key": "sn",
            "value": 39
        },
        {
            "hc-key": "tl",
            "value": 3
        },
        {
            "hc-key": "fr",
            "value": 295695
        },
        {
            "hc-key": "lt",
            "value": 3631
        },
        {
            "hc-key": "rw",
            "value": 1
        },
        {
            "hc-key": "zm",
            "value": 20
        },
        {
            "hc-key": "gm",
            "value": 1
        },
        {
            "hc-key": "fo",
            "value": 178
        },
        {
            "hc-key": "gt",
            "value": 180
        },
        {
            "hc-key": "dk",
            "value": 29799
        },
        {
            "hc-key": "ua",
            "value": 2821
        },
        {
            "hc-key": "au",
            "value": 138435
        },
        {
            "hc-key": "at",
            "value": 27032
        },
        {
            "hc-key": "ve",
            "value": 1975
        },
        {
            "hc-key": "pw",
            "value": 1
        },
        {
            "hc-key": "ke",
            "value": 40
        },
        {
            "hc-key": "la",
            "value": 1
        },
        {
            "hc-key": "bjn",
            "value": 1
        },
        {
            "hc-key": "tr",
            "value": 22762
        },
        {
            "hc-key": "jp",
            "value": 342282
        },
        {
            "hc-key": "al",
            "value": 109
        },
        {
            "hc-key": "om",
            "value": 20
        },
        {
            "hc-key": "it",
            "value": 136307
        },
        {
            "hc-key": "bn",
            "value": 10
        },
        {
            "hc-key": "tn",
            "value": 28
        },
        {
            "hc-key": "hu",
            "value": 20221
        },
        {
            "hc-key": "ru",
            "value": 43630
        },
        {
            "hc-key": "lb",
            "value": 169
        },
        {
            "hc-key": "bb",
            "value": 45
        },
        {
            "hc-key": "br",
            "value": 82788
        },
        {
            "hc-key": "ci",
            "value": 1
        },
        {
            "hc-key": "rs",
            "value": 2498
        },
        {
            "hc-key": "gq",
            "value": 1
        },
        {
            "hc-key": "us",
            "value": 1738395
        },
        {
            "hc-key": "se",
            "value": 92173
        },
        {
            "hc-key": "az",
            "value": 31
        },
        {
            "hc-key": "gw",
            "value": 2
        },
        {
            "hc-key": "sz",
            "value": 8
        },
        {
            "hc-key": "ca",
            "value": 116938
        },
        {
            "hc-key": "kv",
            "value": 1
        },
        {
            "hc-key": "kr",
            "value": 19280
        },
        {
            "hc-key": "mw",
            "value": 4
        },
        {
            "hc-key": "sk",
            "value": 5798
        },
        {
            "hc-key": "cy",
            "value": 135
        },
        {
            "hc-key": "ba",
            "value": 364
        },
        {
            "hc-key": "pga",
            "value": 1
        },
        {
            "hc-key": "sg",
            "value": 2172
        },
        {
            "hc-key": "tw",
            "value": 19124
        },
        {
            "hc-key": "so",
            "value": 4
        },
        {
            "hc-key": "sol",
            "value": 1
        },
        {
            "hc-key": "uz",
            "value": 6
        },
        {
            "hc-key": "cf",
            "value": 1
        },
        {
            "hc-key": "pl",
            "value": 60995
        },
        {
            "hc-key": "kw",
            "value": 19
        },
        {
            "hc-key": "er",
            "value": 1
        },
        {
            "hc-key": "ga",
            "value": 33
        },
        {
            "hc-key": "ee",
            "value": 12726
        },
        {
            "hc-key": "es",
            "value": 105126
        },
        {
            "hc-key": "iq",
            "value": 13
        },
        {
            "hc-key": "sv",
            "value": 35
        },
        {
            "hc-key": "ml",
            "value": 12
        },
        {
            "hc-key": "st",
            "value": 3
        },
        {
            "hc-key": "ir",
            "value": 276
        },
        {
            "hc-key": "sl",
            "value": 1
        },
        {
            "hc-key": "cnm",
            "value": 1
        },
        {
            "hc-key": "bs",
            "value": 34
        },
        {
            "hc-key": "sb",
            "value": 1
        },
        {
            "hc-key": "nz",
            "value": 15914
        },
        {
            "hc-key": "mc",
            "value": 64
        },
        {
            "hc-key": "ss",
            "value": 1
        },
        {
            "hc-key": "kg",
            "value": 1
        },
        {
            "hc-key": "ae",
            "value": 429
        },
        {
            "hc-key": "ar",
            "value": 34983
        },
        {
            "hc-key": "sd",
            "value": 2
        },
        {
            "hc-key": "bh",
            "value": 1
        },
        {
            "hc-key": "am",
            "value": 79
        },
        {
            "hc-key": "pg",
            "value": 1
        },
        {
            "hc-key": "cu",
            "value": 1490
        }
    ];
    $('#map1').highcharts('Map', {

        title : {
            text : 'Pick a country'
        },

        subtitle : {
            text : 'Source map: <a href="http://code.highcharts.com/mapdata/custom/world.js">World</a>'
        },

        mapNavigation: {
            enabled: true,
            buttonOptions: {
                verticalAlign: 'bottom'
            }
        },

        colorAxis: {
            min: 0
        },

        series : [{
            data : data1,
            mapData: Highcharts.maps['custom/world'],
            joinBy: 'hc-key',
            
            states: {
                hover: {
                    color: '#BADA55'
                }
            },
            dataLabels: {
                enabled: true,
                format: '{point.name}'
            }
        }]
    });*/
    });

</script>
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
        <h1 style="color: burlywood;">Trends
            <a href="homepage.jsp" style="float: right; text-decoration: none; color: burlywood; font-size: 20px;">Back</a>
        </h1>
        
        <div id="container" style="min-width: 310px; background: transparent; height: 400px; margin: 0 auto"></div>
        <div style="height: 30px;"></div>
        <div id="container2" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
        <div style="height: 30px;"></div>
        <div id="container3" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
        <!--div id="map1" style="min-width: 600px; max-width: 1200px ;min-height:600px"></div-->
    </body>
</html>
