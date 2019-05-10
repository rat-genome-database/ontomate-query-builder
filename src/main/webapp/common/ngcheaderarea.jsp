<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="chinchilla genome database,chinchilla genome,rgd">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta name="author" content="NGC">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><meta name="generator" content="WebGUI 7.9.16" /><meta http-equiv="Content-Script-Type" content="text/javascript" /><meta http-equiv="Content-Style-Type" content="text/css" /><script type="text/javascript">function getWebguiProperty (propName) {var props = new Array();props["extrasURL"] = "/extras/";props["pageURL"] = "/wg/ngc/template";props["firstDayOfWeek"] = "0";return props[propName];}</script><link href="/wg/layout.css" rel="stylesheet" type="text/css" /><!--page layout--><meta http-equiv="Pragma" content="no-cache" /><meta http-equiv="Cache-Control" content="no-cache, must-revalidate, max-age=0, private" /><meta http-equiv="Expires" content="0" />

<link rel="stylesheet" href="https://rgd.mcw.edu/rgdweb/css/jquery/jquery-ui-1.8.18.custom.css">
<link rel="SHORTCUT ICON" href="https://rgd.mcw.edu/favicon.ico" />
<link rel="stylesheet" type="text/css" href="/https://rgd.mcw.educommon/modalDialog/subModal.css" />
<link rel="stylesheet" type="text/css" href="https://rgd.mcw.edu/common/modalDialog/style.css" />
<link href="https://rgd.mcw.edu/common/style/ngc_styles.css" rel="stylesheet" type="text/css" />
<!-- CSS for Tab Menu #4 -->
<link rel="stylesheet" type="text/css" href="https://rgd.mcw.edu/common/style/ddcolortabsNGC.css" />

    <script
            src="http://code.jquery.com/jquery-1.9.1.min.js"
            integrity="sha256-wS9gmOZBqsqWxgIVgA8Y9WcQOa7PgSIX+rPA0VL2rbQ="
            crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/js/elasticsearch/elasticsearchcommon.js"></script>
<!--script src="/rgdweb/js/jquery/jquery-1.7.1.min.js"></script-->
<script src="https://rgd.mcw.edu/rgdweb/js/jquery/jquery-ui-1.8.18.custom.min.js"></script>
<script src="https://rgd.mcw.edu/rgdweb/js/jquery/jquery_combo_box.js"></script>
<script type="text/javascript" src="https://rgd.mcw.edu/common/js/ddtabmenu.js">

/***********************************************
* DD Tab Menu script- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>


<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-2739107-4', 'auto');
  ga('send', 'pageview');

</script>


<script type="text/javascript" src="https://rgd.mcw.edu/common/js/rgdHomeFunctions-3.js">
</script>

</head>

<body>

<table class="wrapperTable" cellpadding="0" cellspacing="0" border="0">
<tr>
<td>
<div class="wrapper">

<div id="main">

<div id="headWrapper">
    <div class="top-bar">
<table width="100%" border="0" class="headerTable"> <tr><td align="left" style="color:white;">&nbsp;&nbsp;&nbsp;
</td><td align="right" style="color:white;">
    <a href="ftp://ftp.rgd.mcw.edu/pub/chinchilla">FTP Download</a>
</td></tr></table>
    </div>

<table width="100%" border=0>
<tr>
    <td>
    <table><tr><td>
<a class="homeLink" href="https://rgd.mcw.edu/rgdweb/ngcindex.jsp"><img border="0" src="https://rgd.mcw.edu/common/images/ngcLogo.jpg"></a>
</td>
        <td style="font-size:26; font-style:italic; font-weight:700;color:#9D0F15;">Chinchilla&nbsp;Research&nbsp;Resource&nbsp;Database</td>
</tr>
</table>

</td>
<td width=200 align="right">&nbsp;</td>
<td width=200 align="center">&nbsp;</td>
<td align="right">

<div class="searchBorder">
<table border=0 cellpadding=0 cellspacing=0 >
<form method="post" action='https://rgd.mcw.edu/rgdweb/search/search.html' onSubmit="return verify(this);">
<input type="hidden" name="type" value="nav" />
<tr>
     <td class="searchKeywordLabel">Keyword</td>
<td class="atitle" align="right"> <input type=text name=term size=12 value="" onFocus="document.forms[0].term.value=''" class="searchKeywordSmall">
</td>
<td>
<input type="image" src="https://rgd.mcw.edu/common/images/searchGlass.gif" class="searchButtonSmall"/>
</td>
</tr>
</form>
</table>
</div>
</td>
<td>&nbsp;&nbsp;</td>
</tr>
</table>

<div id="ddtabs4" class="ddcolortabs">
<ul>
<li class="current" style="margin-left: 1px"><a href="https://rgd.mcw.edu/rgdweb/ngcindex.jsp" rel="ct1"><span>Home</span></a></li>
<li><a href="https://rgd.mcw.edu/rgdweb/search/genes.html" rel="ct2"><span>Genes</span></a></li>
<li><a href="https://rgd.mcw.edu/rgdweb/ga/start.jsp" rel="ct3"><span>Gene Annotator</span></a></li>
<li><a href="https://rgd.mcw.edu/rgdweb/ontology/search.html" rel="ct4"><span>Ontology Browser</span></a></li>
    <li><a href="https://rgd.mcw.edu/jbrowse/?data=data_cl1_0&tracks=GFF3_track" rel="ct4"><span>Genome Browser</span></a></li>
   <!-- <li><a href="/phenotypesChin" rel="ct5"><span>Phenominer</span></a></li>-->
</ul>
</div>
<div class="ddcolortabsline"><img src="https://rgd.mcw.edu/common/images/squareBullet.gif" /></div>

<!--<div style="width:100%; height:5px; font-size:1px; background-color: #2865a3">&nbsp;</div>-->

<DIV class="tabcontainer">

<div id="ct1" class="tabcontent">
</div>
<div id="ct2" class="tabcontent">
</div>
<div id="ct3" class="tabcontent">
</div>
<div id="ct4" class="tabcontent">
</div>
<div id="ct5" class="tabcontent">
</div>
<div id="ct6" class="tabcontent">
</div>
<div id="ct7" class="tabcontent">
</div>


</DIV>
<!--end headwrapper -->
</div>

<script>
ddtabmenu.definemenu("ddtabs4", getTabIndex()); //initialize Tab Menu
</script>

    <div id="mainBody">
        <div id="contentArea" class="content-area">
            <div id="layout0a089e09a4c2dd32774d9563ff8b0067" class="layout default">

<a name="idCgieCaTC3TJ3TZVj-4sAZw" id="idCgieCaTC3TJ3TZVj-4sAZw"></a>

<!-- begin position 1 -->
<div class="wg-content-position">