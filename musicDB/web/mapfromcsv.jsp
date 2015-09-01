

<%-- 
    Document   : mapdemo
    Created on : Apr 15, 2015, 7:16:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
       <script src="http://code.highcharts.com/maps/modules/map.js"></script>
<script src="http://code.highcharts.com/maps/modules/exporting.js"></script>
<script src="http://code.highcharts.com/mapdata/custom/world.js"></script>



        <script>
          $(function () {

    // Prepare demo data
    //number of albums
    var data1 = [
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
    var data2 = [
        {
            "hc-key": "dz",
            "value": 5
        },
        {
            "hc-key": "ao",
            "value": 3
        },
        {
            "hc-key": "eg",
            "value": 4
        },
        {
            "hc-key": "bd",
            "value": 3
        },
        {
            "hc-key": "ne",
            "value": 1
        },
        {
            "hc-key": "qa",
            "value": 1
        },
        {
            "hc-key": "na",
            "value": 2
        },
        {
            "hc-key": "bg",
            "value": 5
        },
        {
            "hc-key": "bo",
            "value": 3
        },
        {
            "hc-key": "gh",
            "value": 3
        },
        {
            "hc-key": "pk",
            "value": 6
        },
        {
            "hc-key": "pa",
            "value": 2
        },
        {
            "hc-key": "jo",
            "value": 2
        },
        {
            "hc-key": "eh",
            "value": 2
        },
        {
            "hc-key": "ly",
            "value": 0
        },
        {
            "hc-key": "my",
            "value": 10
        },
        {
            "hc-key": "pr",
            "value": 3
        },
        {
            "hc-key": "kp",
            "value": 2
        },
        {
            "hc-key": "tz",
            "value": 2
        },
        {
            "hc-key": "pt",
            "value": 16
        },
        {
            "hc-key": "kh",
            "value": 2
        },
        {
            "hc-key": "py",
            "value": 2
        },
        {
            "hc-key": "sa",
            "value": 2
        },
        {
            "hc-key": "me",
            "value": 2
        },
        {
            "hc-key": "si",
            "value": 10
        },
        {
            "hc-key": "bf",
            "value": 1
        },
        {
            "hc-key": "ch",
            "value": 26
        },
        {
            "hc-key": "mr",
            "value": 0
        },
        {
            "hc-key": "hr",
            "value": 7
        },
        {
            "hc-key": "cl",
            "value": 7
        },
        {
            "hc-key": "cn",
            "value": 14
        },
        {
            "hc-key": "kn",
            "value": 0
        },
        {
            "hc-key": "jm",
            "value": 4
        },
        {
            "hc-key": "dj",
            "value": 0
        },
        {
            "hc-key": "gn",
            "value": 3
        },
        {
            "hc-key": "fi",
            "value": 26
        },
        {
            "hc-key": "uy",
            "value": 3
        },
        {
            "hc-key": "va",
            "value": 0
        },
        {
            "hc-key": "np",
            "value": 3
        },
        {
            "hc-key": "ma",
            "value": 4
        },
        {
            "hc-key": "ye",
            "value": 0
        },
        {
            "hc-key": "ph",
            "value": 8
        },
        {
            "hc-key": "za",
            "value": 16
        },
        {
            "hc-key": "ni",
            "value": 1
        },
        {
            "hc-key": "cyn",
            "value": 0
        },
        {
            "hc-key": "vi",
            "value": 1
        },
        {
            "hc-key": "sy",
            "value": 2
        },
        {
            "hc-key": "li",
            "value": 1
        },
        {
            "hc-key": "mt",
            "value": 4
        },
        {
            "hc-key": "kz",
            "value": 2
        },
        {
            "hc-key": "mn",
            "value": 3
        },
        {
            "hc-key": "sr",
            "value": 1
        },
        {
            "hc-key": "ie",
            "value": 10
        },
        {
            "hc-key": "dm",
            "value": 2
        },
        {
            "hc-key": "bj",
            "value": 2
        },
        {
            "hc-key": "ng",
            "value": 1
        },
        {
            "hc-key": "be",
            "value": 30
        },
        {
            "hc-key": "tg",
            "value": 2
        },
        {
            "hc-key": "de",
            "value": 78
        },
        {
            "hc-key": "lk",
            "value": 4
        },
        {
            "hc-key": "gb",
            "value": 92
        },
        {
            "hc-key": "gy",
            "value": 0
        },
        {
            "hc-key": "cr",
            "value": 3
        },
        {
            "hc-key": "cm",
            "value": 3
        },
        {
            "hc-key": "kas",
            "value": 0
        },
        {
            "hc-key": "km",
            "value": 0
        },
        {
            "hc-key": "ug",
            "value": 3
        },
        {
            "hc-key": "tm",
            "value": 1
        },
        {
            "hc-key": "tt",
            "value": 2
        },
        {
            "hc-key": "nl",
            "value": 44
        },
        {
            "hc-key": "td",
            "value": 0
        },
        {
            "hc-key": "ge",
            "value": 3
        },
        {
            "hc-key": "ro",
            "value": 11
        },
        {
            "hc-key": "scr",
            "value": 0
        },
        {
            "hc-key": "lv",
            "value": 9
        },
        {
            "hc-key": "bz",
            "value": 0
        },
        {
            "hc-key": "mm",
            "value": 0
        },
        {
            "hc-key": "af",
            "value": 2
        },
        {
            "hc-key": "bi",
            "value": 0
        },
        {
            "hc-key": "by",
            "value": 11
        },
        {
            "hc-key": "gd",
            "value": 0
        },
        {
            "hc-key": "lr",
            "value": 0
        },
        {
            "hc-key": "gr",
            "value": 18
        },
        {
            "hc-key": "ls",
            "value": 0
        },
        {
            "hc-key": "gl",
            "value": 2
        },
        {
            "hc-key": "ad",
            "value": 1
        },
        {
            "hc-key": "mz",
            "value": 2
        },
        {
            "hc-key": "tj",
            "value": 1
        },
        {
            "hc-key": "th",
            "value": 7
        },
        {
            "hc-key": "ht",
            "value": 4
        },
        {
            "hc-key": "mx",
            "value": 13
        },
        {
            "hc-key": "zw",
            "value": 3
        },
        {
            "hc-key": "lc",
            "value": 0
        },
        {
            "hc-key": "in",
            "value": 18
        },
        {
            "hc-key": "vc",
            "value": 1
        },
        {
            "hc-key": "bt",
            "value": 0
        },
        {
            "hc-key": "vn",
            "value": 3
        },
        {
            "hc-key": "no",
            "value": 23
        },
        {
            "hc-key": "cz",
            "value": 28
        },
        {
            "hc-key": "ag",
            "value": 0
        },
        {
            "hc-key": "fj",
            "value": 0
        },
        {
            "hc-key": "hn",
            "value": 2
        },
        {
            "hc-key": "mu",
            "value": 0
        },
        {
            "hc-key": "do",
            "value": 3
        },
        {
            "hc-key": "lu",
            "value": 5
        },
        {
            "hc-key": "il",
            "value": 10
        },
        {
            "hc-key": "sm",
            "value": 1
        },
        {
            "hc-key": "pe",
            "value": 5
        },
        {
            "hc-key": "id",
            "value": 7
        },
        {
            "hc-key": "vu",
            "value": 2
        },
        {
            "hc-key": "mk",
            "value": 5
        },
        {
            "hc-key": "cd",
            "value": 3
        },
        {
            "hc-key": "cg",
            "value": 3
        },
        {
            "hc-key": "is",
            "value": 10
        },
        {
            "hc-key": "et",
            "value": 1
        },
        {
            "hc-key": "um",
            "value": 1
        },
        {
            "hc-key": "co",
            "value": 4
        },
        {
            "hc-key": "ser",
            "value": 0
        },
        {
            "hc-key": "bw",
            "value": 1
        },
        {
            "hc-key": "md",
            "value": 3
        },
        {
            "hc-key": "mg",
            "value": 3
        },
        {
            "hc-key": "ec",
            "value": 4
        },
        {
            "hc-key": "sn",
            "value": 4
        },
        {
            "hc-key": "tl",
            "value": 0
        },
        {
            "hc-key": "fr",
            "value": 75
        },
        {
            "hc-key": "lt",
            "value": 9
        },
        {
            "hc-key": "rw",
            "value": 0
        },
        {
            "hc-key": "zm",
            "value": 1
        },
        {
            "hc-key": "gm",
            "value": 0
        },
        {
            "hc-key": "fo",
            "value": 5
        },
        {
            "hc-key": "gt",
            "value": 2
        },
        {
            "hc-key": "dk",
            "value": 22
        },
        {
            "hc-key": "ua",
            "value": 11
        },
        {
            "hc-key": "au",
            "value": 30
        },
        {
            "hc-key": "at",
            "value": 26
        },
        {
            "hc-key": "ve",
            "value": 4
        },
        {
            "hc-key": "pw",
            "value": 0
        },
        {
            "hc-key": "ke",
            "value": 2
        },
        {
            "hc-key": "la",
            "value": 0
        },
        {
            "hc-key": "bjn",
            "value": 0
        },
        {
            "hc-key": "tr",
            "value": 13
        },
        {
            "hc-key": "jp",
            "value": 34
        },
        {
            "hc-key": "al",
            "value": 2
        },
        {
            "hc-key": "om",
            "value": 3
        },
        {
            "hc-key": "it",
            "value": 40
        },
        {
            "hc-key": "bn",
            "value": 1
        },
        {
            "hc-key": "tn",
            "value": 2
        },
        {
            "hc-key": "hu",
            "value": 14
        },
        {
            "hc-key": "ru",
            "value": 31
        },
        {
            "hc-key": "lb",
            "value": 3
        },
        {
            "hc-key": "bb",
            "value": 1
        },
        {
            "hc-key": "br",
            "value": 19
        },
        {
            "hc-key": "ci",
            "value": 0
        },
        {
            "hc-key": "rs",
            "value": 8
        },
        {
            "hc-key": "gq",
            "value": 0
        },
        {
            "hc-key": "us",
            "value": 103
        },
        {
            "hc-key": "se",
            "value": 31
        },
        {
            "hc-key": "az",
            "value": 2
        },
        {
            "hc-key": "gw",
            "value": 1
        },
        {
            "hc-key": "sz",
            "value": 1
        },
        {
            "hc-key": "ca",
            "value": 35
        },
        {
            "hc-key": "kv",
            "value": 0
        },
        {
            "hc-key": "kr",
            "value": 14
        },
        {
            "hc-key": "mw",
            "value": 1
        },
        {
            "hc-key": "sk",
            "value": 10
        },
        {
            "hc-key": "cy",
            "value": 2
        },
        {
            "hc-key": "ba",
            "value": 7
        },
        {
            "hc-key": "pga",
            "value": 0
        },
        {
            "hc-key": "sg",
            "value": 7
        },
        {
            "hc-key": "tw",
            "value": 12
        },
        {
            "hc-key": "so",
            "value": 1
        },
        {
            "hc-key": "sol",
            "value": 0
        },
        {
            "hc-key": "uz",
            "value": 2
        },
        {
            "hc-key": "cf",
            "value": 0
        },
        {
            "hc-key": "pl",
            "value": 26
        },
        {
            "hc-key": "kw",
            "value": 2
        },
        {
            "hc-key": "er",
            "value": 0
        },
        {
            "hc-key": "ga",
            "value": 2
        },
        {
            "hc-key": "ee",
            "value": 15
        },
        {
            "hc-key": "es",
            "value": 28
        },
        {
            "hc-key": "iq",
            "value": 2
        },
        {
            "hc-key": "sv",
            "value": 2
        },
        {
            "hc-key": "ml",
            "value": 2
        },
        {
            "hc-key": "st",
            "value": 1
        },
        {
            "hc-key": "ir",
            "value": 4
        },
        {
            "hc-key": "sl",
            "value": 0
        },
        {
            "hc-key": "cnm",
            "value": 0
        },
        {
            "hc-key": "bs",
            "value": 2
        },
        {
            "hc-key": "sb",
            "value": 0
        },
        {
            "hc-key": "nz",
            "value": 14
        },
        {
            "hc-key": "mc",
            "value": 1
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
            "value": 4
        },
        {
            "hc-key": "ar",
            "value": 15
        },
        {
            "hc-key": "sd",
            "value": 1
        },
        {
            "hc-key": "bh",
            "value": 1
        },
        {
            "hc-key": "am",
            "value": 5
        },
        {
            "hc-key": "pg",
            "value": 0
        },
        {
            "hc-key": "cu",
            "value": 5
        }
    ];

    // Initiate the chart
    $('#container1').highcharts('Map', {

        title : {
            text : 'Distribution of Number of Albums'
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
    });
    $('#container2').highcharts('Map', {

        title : {
            text : 'Language Diversity'
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
            data : data2,
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
    });
    
});

</script>
    </head>
    <body>
        <style>
            body {
                background: url("pic6.jpg");
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
        <h1 style="color: burlywood;">Country-Wise Trends
        <a href="homepage.jsp" style="float: right; text-decoration: none; color: burlywood; font-size: 20px;">Back</a>
        </h1>
        

        <div id="container1" style="width:1500px ;min-height:600px; margin-left: 10px;"></div>
        <div style="height: 30px;"></div>
        <div id="container2" style="width:1500px ;min-height:600px; margin-left: 10px;" ></div>
    </body>
</html>
