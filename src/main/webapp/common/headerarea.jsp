
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="rgd.mcw.edu">
    <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE, NO-STORE, MUST-REVALIDATE">
    <meta name="author" content="RGD">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate, max-age=0, private" />
    <meta http-equiv="Expires" content="0" />
    <%
        if (!pageDescription.equals("")) {
    %>
    <meta name="description" content="<%=pageDescription%>" />
    <% } %>

    <%=headContent%>
    <title><%=pageTitle%></title>

    <link rel="stylesheet" href="/QueryBuilder/js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" media="all" />
    <link rel="SHORTCUT ICON" href="https://rgd.mcw.edu/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="https://rgd.mcw.edu/rgdweb/common/modalDialog/subModal.css" />
    <link rel="stylesheet" type="text/css" href="https://rgd.mcw.edu/rgdweb/common/modalDialog/style.css" />
    <link href="/QueryBuilder/common/rgd_styles-3.css" rel="stylesheet" type="text/css" />

    <!-- adding link for OntoSolr (Pushkala) -->
    <link rel="stylesheet" href="https://rgd.mcw.edu/OntoSolr/files/jquery.autocomplete.css" type="text/css" />


    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/common/modalDialog/common.js"></script>
    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/common/modalDialog/subModal.js"></script>
    <script type="text/javascript" src="/QueryBuilder/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/QueryBuilder/js/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script src="https://rgd.mcw.edu/rgdweb/js/jquery/jquery_combo_box.js"></script>

    <script src="https://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript">
        _uacct = "UA-2739107-2";
        urchinTracker();
    </script>

    <script type="text/javascript" src="/QueryBuilder/js/rgdHomeFunctions-3.js"></script>




    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://rgd.mcw.edu/rgdweb/css/elasticsearch/elasticsearch.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/common/angular/1.4.8/angular.js"></script>
    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/common/angular/1.4.8/angular-sanitize.js"></script>
    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/my/my.js?5"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://rgd.mcw.edu/rgdweb/common/jquery-ui/jquery-ui.css">
    <script src="https://rgd.mcw.edu/rgdweb/common/jquery-ui/jquery-ui.js"></script>

    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/js/elasticsearch/elasticsearchcommon.js"></script>
</head>

<style>
    a {
        color:#0000EE;
    }
</style>


<body  ng-cloak ng-app="rgdPage">
<%--@ include file="/common/angularTopBodyInclude.jsp" --%>




<table class="wrapperTable" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td>

            <div id="headWrapper">
                <div class="top-bar">
                    <table width="100%" border="0" class="headerTable" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" style="color:white;" rowspan="3" width="10">

                                <div ><a class="homeLink" href="https://rgd.mcw.edu/wg/home"><img style="border:3px solid #2865A3;" border="0"  src="https://rgd.mcw.edu/rgdweb/common/images/rgd_logo.jpg"></a></div>

                            </td>

                            <td align="right" style="color:white;" valign="center" colspan="3">

                                <a href="https://rgd.mcw.edu//tu">Help</a>&nbsp;|&nbsp;
                                <a href="https://rgd.mcw.edu//wg/home/rgd_rat_community_videos/">Video Tutorials</a>&nbsp;|&nbsp;
                                <a href="https://rgd.mcw.edu//wg/com-menu/poster_archive/">News</a>&nbsp;|&nbsp;
                                <a href="https://rgd.mcw.edu//wg/home/rat-genome-database-publications">Publications</a>&nbsp;|&nbsp;

                                <a href="ftp://ftp.rgd.mcw.edu/pub">FTP Download</a>&nbsp;|&nbsp;
                                <a href="https://rest.rgd.mcw.edu/rgdws/swagger-ui.html">REST API</a>&nbsp;|&nbsp;
                                <a href="https://rgd.mcw.edu//wg/citing-rgd">Citing RGD</a>&nbsp;|&nbsp;
                                <a href="https://rgd.mcw.edu/wg/contact/">Contact</a>&nbsp;&nbsp;&nbsp;

                                <input type="button" class="btn btn-info btn-sm"  value="{{username}}" ng-click="rgd.loadMyRgd($event)" style="background-color:#2B84C8;padding:1px 10px;font-size:12px;line-height:1.5;border-radius:3px"/>
                            </td>

                        </tr>

                        <tr>
                            <td colspan="2">



                                <div class="rgd-navbar">
                                    <div class="rgd-dropdown">
                                        <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='https://rgd.mcw.edu/wg'">Home
                                            <i class="fa fa-caret-down"></i>
                                        </button>

                                        <div class="rgd-dropdown-content">
                                            <a href="https://rgd.mcw.edu/wg/general-search/">Search RGD</a>
                                            <a href="https://rgd.mcw.edu/wg/grants/">Grant Resources</a>
                                            <a href="https://rgd.mcw.edu/wg/citing-rgd/">Citing RGD</a>
                                            <a href="https://rgd.mcw.edu/wg/about-us/">About Us</a>
                                            <a href="https://rgd.mcw.edu/wg/contact/">Contact Us</a>
                                        </div>
                                    </div>
                                    <div class="rgd-dropdown">
                                        <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='https://rgd.mcw.edu/wg/data-menu/'">Data
                                            <i class="fa fa-caret-down"></i>
                                        </button>

                                        <div class="rgd-dropdown-content">
                                            <a href="https://rgd.mcw.edu/rgdweb/search/genes.html?100">Genes</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/search/qtls.html?100">QTLs</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/search/strains.html?100">Strains</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/search/markers.html?100">Markers</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/report/genomeInformation/genomeInformation.html">Genome Information</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/ontology/search.html">Ontologies</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/search/cellLines.html">Cell Lines</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/search/references.html?100">References</a>
                                            <a href="ftp://ftp.rgd.mcw.edu/pub/">FTP Download</a>
                                            <a href="https://rgd.mcw.edu/registration-entry.shtml">Submit Data</a>
                                        </div>
                                    </div>
                                    <div class="rgd-dropdown">
                                        <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='https://rgd.mcw.edu/wg/tool-menu/'">Analysis & Visualization
                                            <i class="fa fa-caret-down"></i>
                                        </button>

                                        <div class="rgd-dropdown-content">
                                            <a href="/QueryBuilder" >OntoMate (Literature Search) </a>
                                            <a href="https://rgd.mcw.edu/jbrowse/">JBrowse (Genome Browser)</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/front/config.html">Variant Visualizer</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/cytoscape/query.html">InterViewer (Protein-Protein Interactions)</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/phenominer/home.jsp">PhenoMiner (Quatitative Phenotypes)</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/ga/start.jsp">Gene Annotator</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/generator/list.html">OLGA (Gene List Generator)</a>
                                            <a href="http://ratmine.mcw.edu/ratmine/begin.do">RatMine</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/gTool/Gviewer.jsp">GViewer (Genome Viewer)</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/overgo/find.html">Overgo Probe Designer</a>
                                            <a href="https://rgd.mcw.edu/ACPHAPLOTYPER/">ACP Haplotyper</a>
                                            <a href="https://rgd.mcw.edu/GENOMESCANNER/">Genome Scanner</a>
                                        </div>
                                    </div>
                                    <div class="rgd-dropdown">
                                        <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='https://rgd.mcw.edu/wg/portals/'">Diseases
                                            <i class="fa fa-caret-down"></i>
                                        </button>

                                        <div class="rgd-dropdown-content">
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=aging">Aging & Age-Related Disease</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=cancer">Cancer</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=cardio">Cardiovascular Disease</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=develop">Developmental Disease</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=diabetes">Diabetes</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=blood">Hematologic Disease</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=immune">Immune & Inflammatory Disease</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=nuro">Neurological Disease</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=obesity">Obesity & Metabolic Syndrome</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=renal">Renal Disease</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=respir">Respiratory Disease</a>
                                            <a href="https://rgd.mcw.edu/rgdCuration/?module=portal&func=show&name=sensory">Sensory Organ Disease</a>
                                        </div>
                                    </div>
                                    <div class="rgd-dropdown">
                                        <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='https://rgd.mcw.edu/wg/physiology/'">Phenotypes & Models
                                            <i class="fa fa-caret-down"></i>
                                        </button>

                                        <div class="rgd-dropdown-content">
                                            <a href="https://rgd.mcw.edu/rgdweb/models/findModels.html">Find Models&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;color:red">new</span></a>
                                            <a href="https://rgd.mcw.edu/rgdweb/models/allModels.html">Genetic Models</a>
                                            <a href="https://rgd.mcw.edu/wg/autism-rat-model-resource/">Autism Models</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/phenominer/home.jsp">PhenoMiner (Quantitative Phenotypes)</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/phenominer/phenominerExpectedRanges/views/home.html">Expected Ranges (Quantitative Phenotype)</a>
                                            <a href="https://rgd.mcw.edu/rgdweb/pa/termCompare.html?term1=RS%3A0000457&term2=CMO%3A0000000&countType=rec&species=3">Phenominer Term Comparison</a>
                                            <a href="https://rgd.mcw.edu/wg/phenotype-data13/">Phenotypes</a>
                                            <a href="https://rgd.mcw.edu/wg/gerrc/">GERRC (Gene Editing Rat Resource Center)</a>
                                            <a href="https://rgd.mcw.edu/wg/physiology/additionalmodels/">Phenotypes in Other Animal Models</a>
                                            <a href="https://rgd.mcw.edu/wg/strain-maintenance/">Animal Husbandry</a>
                                            <a href="https://rgd.mcw.edu/wg/physiology/strain-medical-records/">Strain Medical Records</a>
                                            <a href="https://rgd.mcw.edu/wg/phylogenetics/">Phylogenetics</a>
                                            <a href="https://rgd.mcw.edu/wg/strain-availability/">Strain Availability</a>
                                            <a href="ftp://ftp.rgd.mcw.edu/pub/data_release/Hi-res_Rat_Calendars/">Calendar</a>
                                            <a href="https://rgd.mcw.edu/wg/physiology/rats101/">Rats 101</a>
                                            <a href="https://rgd.mcw.edu/wg/photos-and-images/community-submissions/">Community</a>
                                            <a href="https://rgd.mcw.edu/wg/photos-and-images/physgen-photo-archive2/">Photo Archive</a>
                                        </div>
                                    </div>

                                    <a href="/wg/home/pathway2/">Pathways</a>

                                    <div class="rgd-dropdown">
                                        <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='https://rgd.mcw.edu/wg/com-menu/'">Community
                                            <i class="fa fa-caret-down"></i>
                                        </button>

                                        <div class="rgd-dropdown-content">
                                            <a href="http://mailman.mcw.edu/mailman/listinfo/rat-forum">Rat Community Forum</a>
                                            <a href="https://rgd.mcw.edu/wg/com-menu/directory-of-rat-laboratories2/">Directory of Rat Laboratories</a>
                                            <a href="https://rgd.mcw.edu/wg/home/rgd_rat_community_videos/">Video Tutorials</a>
                                            <a href="https://rgd.mcw.edu/wg/news2/">News</a>
                                            <a href="https://rgd.mcw.edu/wg/home/rat-genome-database-publications/">RGD Publications</a>
                                            <a href="https://rgd.mcw.edu/wg/com-menu/poster_archive/">RGD Poster Archive</a>
                                            <a href="https://rgd.mcw.edu/nomen/nomen.shtml">Nomenclature Guidelines</a>
                                            <a href="https://rgd.mcw.edu/wg/resource-links/">Resource Links</a>
                                            <a href="https://rgd.mcw.edu/wg/resource-links/laboratory-resources/">Laboratory Resources</a>
                                            <a href="https://rgd.mcw.edu/wg/resource-links/employment-resources/">Employment Resources</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" id="search-td">


                                <form  name="elasticSearchForm" class="form-inline" action="https://rgd.mcw.edu/rgdweb/elasticResults.html" id="elasticSearchForm" role="search" method="post">
                                    <input type="hidden" name="log" value="true" />
                                    <table border="0">
                                        <tr>

                                            <td>
                                                <input type="hidden" name="category" id="category" value="General"/>
                                                <input  type=text class="form-control searchgroup" id="term" name=term size="50" placeholder="Enter Search Term..." value="" style="border:1px solid #2865A3">
                                            </td>
                                            <td>
                                                <!--<input type="image" src="/rgdweb/common/images/searchGlass.gif" class="searchButtonSmall"/>-->
                                                <input class="btn btn-info btn-sm form-control" style="background-color:#2B84C8;padding:1px 10px;font-size:12px;line-height:1.5;border-radius:3px" type="submit" value="Search RGD"/>

                                            </td>
                                            <td colspan="2"  align="center"><br><a href="https://rgd.mcw.edu/rgdweb/generator/list.html" >Advanced Search (OLGA)</a></td>
                                        </tr>
                                    </table>

                                </form>




                            </td>
                            <td>
                                <a href="https://www.facebook.com/pg/RatGenomeDatabase/posts/"><img src="https://rgd.mcw.edu/rgdweb/common/images/social/facebook-20.png"/></a>
                                <a href="https://twitter.com/ratgenome"><img src="https://rgd.mcw.edu/rgdweb/common/images/social/twitter-20.png"/></a>
                                <a href="https://www.linkedin.com/company/ratgenome/about/"><img src="https://rgd.mcw.edu/rgdweb/common/images/social/linkedin-20.png"/></a>
                                <a href="https://www.youtube.com/channel/UCMpex8AfXd_JSTH3DIxMGFw?view_as=subscriber"><img src="https://rgd.mcw.edu/rgdweb/common/images/social/youtube-20.png"/></a>

                            </td>
                        </tr>


                    </table>
                </div>

                <input type="hidden" id="speciesType" value="">




            </div>
            </DIV>
            <!--end headwrapper -->
            </div>

            <script>
                if (location.href.indexOf("") == -1 &&
                        location.href.indexOf("https://www.rgd.mcw.edu") == -1 &&
                        location.href.indexOf("osler") == -1 &&
                        location.href.indexOf("horan") == -1 &&
                        location.href.indexOf("owen") == -1 &&
                        location.href.indexOf("hancock") == -1 &&
                        location.href.indexOf("preview.rgd.mcw.edu") == -1) {

                    document.getElementById("curation-top").style.visibility='visible';
                }
            </script>

        </td></tr>
</table>



<div id="mainBody">
    <div id="contentArea" class="content-area">
        <table cellpadding="5" border=0 align="center" width="100%">
            <tr>
                <td colspan="3" align="left" valign="top">

