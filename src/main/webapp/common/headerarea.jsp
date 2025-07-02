<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="Rat Genome Database">
    <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE, NO-STORE, MUST-REVALIDATE">
    <meta name="author" content="RGD">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="referrer" content="origin">
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate, max-age=0, private" />
    <meta http-equiv="Expires" content="0" />

    <meta name="description" content="The Rat Genome Database houses genomic, genetic, functional, physiological, pathway and disease data for the laboratory rat as well as comparative data for mouse and human.  The site also hosts data mining and analysis tools for rat genomics and physiology" />



    <title>Rat Genome Database</title>

    <link rel="stylesheet" href="/rgdweb/css/jquery/jquery-ui-1.8.18.custom.css">
    <link rel="SHORTCUT ICON" href="/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="/rgdweb/common/modalDialog/subModal.css" />
    <link rel="stylesheet" type="text/css" href="/rgdweb/common/modalDialog/style.css" />
    <link href="/rgdweb/common/rgd_styles-3.css?v=1" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/rgdweb/OntoSolr/jquery.autocomplete.css" type="text/css" />
    <link rel="stylesheet" href="/rgdweb/css/webFeedback.css" type="text/css"/>

    <script type="text/javascript" src="/rgdweb/common/modalDialog/common.js"></script>
    <script type="text/javascript" src="/rgdweb/common/modalDialog/subModal.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.12/dist/vue.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.1.3/axios.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <script src="/rgdweb/js/webFeedback.js" defer></script>

    <!--script src="/rgdweb/js/jquery/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="/rgdweb/js/jquery/jquery_combo_box.js"></script-->

    <script src="https://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript">
        _uacct = "UA-2739107-2";
        urchinTracker();
    </script>
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-BTF869XJFG"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-BTF869XJFG');
    </script>
    <script type="text/javascript" src="/rgdweb/js/rgdHomeFunctions-3.js"></script>



    <script>
        function getLoadedObject() {
            return "";
        }
        function getGeneWatchAttributes() {
            //return ["Nomenclature Changes","New GO Annotation","New Disease Annotation","New Phenotype Annotation","New Pathway Annotation","New PubMed Reference","Altered Strains","New NCBI Transcript/Protein","New Protein Interaction","RefSeq Status Has Changed"];
            return ["Nomenclature Changes","RefSeq Status Has Changed","New GO Annotation","New Disease Annotation","New Phenotype Annotation","New Pathway Annotation","New Strain Annotation","New PubMed Reference","New NCBI Transcript/Protein","New Protein Interaction","New External Database Link"]
        }
        function getTermWatchAttributes() {
            return ["Nomenclature Changes","RefSeq Status Has Changed","New GO Annotation","New Disease Annotation","New Phenotype Annotation","New Pathway Annotation","New Strain Annotation","New PubMed Reference","New NCBI Transcript/Protein","New Protein Interaction","New External Database Link"]
        }
    </script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/rgdweb/css/elasticsearch/elasticsearch.css">
    <script src="/QueryBuilder/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    <script type="text/javascript" src="/rgdweb/common/angular/1.4.8/angular.js"></script>
    <script type="text/javascript" src="/rgdweb/common/angular/1.4.8/angular-sanitize.js"></script>
    <script type="text/javascript" src="/rgdweb/my/my.js?5"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/rgdweb/common/jquery-ui/jquery-ui.css">
    <script src="/rgdweb/common/jquery-ui/jquery-ui.js"></script>

    <script type="text/javascript" src="/rgdweb/js/elasticsearch/elasticsearchcommon.js"></script>
</head>

<style>
    a {
        color:#0C1D2E;
        olor:#073C66;
        text-decoration:underline;
        ont-weight:700;
    }
    .speciesCardOverlay {
        position:absolute;
        background-color:#2865a3;
        minWidth:63px;
        width:63px;
        height:63px;
        z-index:30;
        opacity:0;
    }
    .speciesCardOverlay:hover {
        opacity:.9;
        cursor:pointer;
        color:white;
    }
    .speciesIcon {
        border:1px solid black;
        padding:3px;
    }
</style>

<link href="https://fonts.googleapis.com/css?family=Marcellus+SC|Merienda+One&display=swap" rel="stylesheet">


<body  ng-cloak ng-app="rgdPage"  data-spy="scroll" data-target=".navbar" data-offset="10" style="position: relative;">


<div ng-controller="RGDPageController as rgd" id="RGDPageController">


    <div class="container-fluid">
        <!-- Modal -->
        <div class="modal fade" id="my-modal" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" id="rgd-modal" >

                    <!-- twitter boot strap model -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <table align="center">
                            <tr>
                                <td style="padding:20px;"><img src="/rgdweb/common/images/rgd_LOGO_blue_rgd.gif" border="0"/></td>
                            </tr>
                        </table>

                    </div>
                    <div class="modal-body">

                        <div style="padding-bottom:20px;">
                            <div style="float:left; margin-right:10px; min-width: 600px;">Welcome <span style="font-weight:700; font-size:16px;">{{ username}}</span></div>
                            <input  value="Update Account" type="button"  style="margin-right:10px;border:0px solid black; background-color:#4584ED; color:white; font-weight:700;padding:8px;" onClick="location.href='/rgdweb/my/account.html'"/>
                            <input  value="Sign Out" type="button"  ng-click="rgd.logout()"  data-dismiss="modal" style="margin-right:10px;border:0px solid black; background-color:#4584ED; color:white; font-weight:700;padding:8px;"/>
                        </div>

                        <div style="text-decoration:underline;font-weight:700; background-color:#e0e2e1;min-width:690px;">Message Center</div>
                        <div style="display:table-row;">
                            <div style="display: table-cell; float:left; margin-right:10px; min-width: 600px;font-size:13px;padding-bottom: 10px;">{{ messageCount }} Messages</div>
                            <div style="display: table-cell; float:left; margin-right:10px;min-width: 90px"><a href="/rgdweb/my/account.html">Go to Message Center</a></div>
                        </div>

                        <div style="text-decoration:underline;font-weight:700; background-color:#e0e2e1;">Watched Genes</div>
                        <div ng-repeat="watchedObject in watchedObjects" style="display:table-row;">

                            <div style="display: table-cell; float:left; margin-right:10px; min-width: 600px;">{{$index + 1}}. <span style="font-weight:700;">{{ watchedObject.symbol }} (RGD ID:{{watchedObject.rgdId}})</span></div>
                            <div style="display: table-cell; float:left;  margin-right:10px; min-width: 40px;"><a href="javascript:return false;" ng-click="rgd.addWatch(watchedObject.rgdId)">Update Watcher</a></div>
                            <div style="display: table-cell; float:left;  margin-right:10px; min-width: 50px;" ><a href="javascript:return false;" ng-click="rgd.removeWatch(watchedObject.rgdId)">Remove Watcher</a></div>
                        </div>
                        <div style="margin-top:20px;text-decoration:underline;font-weight:700;background-color:#e0e2e1;">Watched Ontology Terms</div>
                        <div ng-repeat="watchedTerm in watchedTerms" style="display:table-row;">

                            <div style="display: table-cell; float:left; margin-right:10px; min-width: 600px;">{{$index + 1}}. <span style="font-weight:700;">{{ watchedTerm.term }} ({{watchedTerm.accId}})</span></div>
                            <div style="display: table-cell; float:left;  margin-right:10px; min-width: 40px;"><a href="javascript:return false;" ng-click="rgd.addWatch(watchedTerm.accId)">Update Watcher</a></div>
                            <div style="display: table-cell; float:left;  margin-right:10px; min-width: 50px;" ><a href="javascript:return false;" ng-click="rgd.removeWatch(watchedTerm.accId)">Remove Watcher</a></div>
                        </div>


                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close Window</button>
                    </div>




                    <div ng-repeat="gene in geneList" style="padding-left:10px;">
                        <span style="font-weight:700; ">{{gene.symbol}}:</span> {{ gene.description }}
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- twitter bootstrap modal Save List to RGD-->

    <div class="container-fluid" >

        <!-- Modal -->
        <div class="modal fade" id="name-desc-modal" role="dialog">
            <div class="modal-dialog modal-small">
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Save List to My RGD</h4>
                    </div>
                    <div class="modal-body">
                        <table align="center">
                            <tr>
                                <td>Create Name:&nbsp;&nbsp;</td>
                                <td><input id="myRgdListName" size="40" type="text" value="{{listName}}" ng-model="listName"/></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Description:&nbsp;&nbsp;</td>
                                <td><input id="myRgdListDesc" size="40" type="text" value="{{listDescription}}" ng-model="listDescription"/></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" ng-click="rgd.saveList($event)" class="btn btn-default" data-dismiss="modal">Save List</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!--  Login box -------------->
    <div class="ontainer-fluid" >

        <!-- Modal -->
        <div class="modal fade" id="login-modal" role="dialog">
            <div class="modal-dialog modal-small">
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <table align="center">
                            <tr>
                                <td style="padding:20px;"><img src="/rgdweb/common/images/rgd_LOGO_blue_rgd.gif" border="0"/></td>
                            </tr>
                        </table>

                    </div>
                    <div class="modal-body">

                        <table align="center" style="padding-bottom:20px;">
                            <tr>
                                <td align="center" style="font-size:30px;color:#55556D;">Save what matters to you</td>
                            </tr>
                            <tr>
                                <td style="color:red;font-weight:700; font-size:18px;">{{ loginError }}</td>
                            </tr>
                        </table>



                        <table align="center">
                            <tr>
                                <td style="font-size:20px;">Sign in with your RGD account</td>
                            </tr>
                        </table>


                        <form>
                            <table align="center" border=0 style="border:2px outset lightgrey;background-color:#F7F7F7;padding:40px;">
                                <tr>
                                    <td>Email Address:</td>
                                    <td><input type='text' size='30' id="j_username" name='j_username' value="" value=''</td></tr>
                                <tr><td>Password:</td><td><input  size='30' type='password' id="j_password" name='j_password' value=""></td></tr>

                                <tr>
                                    <td align="center" colspan="2">
                                        <table cellpadding="5">
                                            <tr>
                                                <td><input name="submit"  data-dismiss="modal" type="button" value="Cancel" style="font-size:16px; margin-top:20px;"></td>
                                                <td><input name="submit" type="submit" value="Log In" style="font-size:16px; margin-top:20px;" ng-click="rgd.login()"  nClick="doLogin()" ></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                </tr>
                            </table>

                        </form>


                        <table align="center" border="0">
                            <tr>
                                <td>
                                    <a href="/rgdweb/my/account.html?submit=Create" style="font-size:16px; margin-right:10px;">Create New Account</a>
                                </td>
                                <td>
                                    <a href="/rgdweb/my/lookup.html" style="font-size:16px;">Recover Password</a>
                                </td>
                            </tr>
                        </table>


                    </div>
                </div>
            </div>
        </div>

        <!-- watch object select window-->

        <div class="container-fluid" >

            <!-- Modal -->
            <div class="modal fade" id="watch-modal" role="dialog">
                <div class="modal-dialog modal-small">
                    <div class="modal-content" >
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">{{ watchLinkText }}</h4>
                        </div>
                        <div class="modal-body">

                            <div style="padding-bottom:10px;">Select categories you would like to watch.  Updates to this gene will be send to {{ username }}</div>

                            <label ng-repeat="geneWatchAttr in geneWatchAttributes">
                                <input
                                        type="checkbox"
                                        name="geneWatchSelection[]"
                                        value="{{geneWatchAttr}}"
                                        ng-checked="geneWatchSelection.indexOf(geneWatchAttr) > -1"
                                        ng-click="toggleGeneWatchSelection(geneWatchAttr)"
                                > {{geneWatchAttr}}
                                <br>
                            </label>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                            <span ng-if="watchLinkText == 'Update Watcher'">
                        <button type="button" ng-click="rgd.removeWatch(activeObject)" class="btn btn-default" data-dismiss="modal">Stop Watching</button>
                    </span>
                            <button type="button" ng-click="rgd.saveWatch(activeObject)" class="btn btn-default" data-dismiss="modal">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--  tool navigation -->
        <!-- twitter bootstrap modal Save List to RGD-->

        <div class="container-fluid" >

            <!-- Modal -->
            <div class="modal fade" id="tools-modal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" >
                        <div class="modal-header">
                            <table width="100%">
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;</td>
                                    <td><h4 style="font-size:16px;" class="modal-title">Analyze <span ng-if="oKey==1">Gene</span><span ng-if="oKey==5">Strain</span><span ng-if="oKey==6">QTL</span>  List</h4></td>
                                    <td align="right"><button type="button" class="close" data-dismiss="modal">&times;</button></td>
                                    <td>&nbsp;&nbsp;&nbsp;</td>
                                </tr>
                            </table>



                        </div>
                        <div class="modal-body">

                            <table width="90%" align="center" border="0">
                                <tr>
                                    <td align="center"><div ng-if="oKey==1"><img src="/rgdweb/common/images/functionalAnnotation.png" border="0"  style="cursor:pointer;padding:5px; margin-right:0px;margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('ga')"/></div><div ng-if="oKey!=1">Gene Annotator (Functional Annotation)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="oKey==1"> <img src="/rgdweb/common/images/annotDist.PNG" border="0" style="cursor:pointer;padding:5px; margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('distribution')"/></div><div ng-if="oKey!=1">Gene Annotator (Annotation Distribution)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="oKey==1"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==6" ><img src="/rgdweb/common/images/variantVisualizer.png" border="0"  style="cursor:pointer;padding:5px; margin-right:0px;margin-bottom:5px; border:1px solid black;"  ng-click="rgd.toolSubmit('vv')"/></div><div ng-if="speciesTypeKey!=1 && speciesTypeKey!=3 && speciesTypeKey !=6">Variant Visualizer (Genomic Variants)<br> unavailble</div></div><div ng-if="oKey!=1">Variant Visualizer (Genomic Variants)<br>unavailable</div></td>
                                </tr>
                                <tr>
                                    <td align="center"  style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('ga')"><div ng-if="oKey==1">Gene Annotator (Functional Annotation)</div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('distribution')"><div ng-if="oKey==1">Gene Annotator (Annotation Distribution)</div></td>

                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('vv')"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==6" ><div ng-if="oKey==1">Variant Visualizer (Genomic Variants)</div></div></td>

                                </tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr>
                                    <td align="center"><div ng-if="oKey==1"><img src="/rgdweb/common/images/interviewer.png" border="0" style="cursor:pointer;padding:5px; margin-right:0px; border:1px solid black;" ng-click="rgd.toolSubmit('interviewer')"/></div><div ng-if="oKey!=1">InterViewer (Protein-Protein Interactions)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==2 || speciesTypeKey==5 || speciesTypeKey==6 || speciesTypeKey==9" ><div ng-if="oKey==1"> <img src="/rgdweb/common/images/gviewer.png" border="0" style="cursor:pointer;padding:5px; margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('gviewer')"/></div></div><div ng-if="oKey!=1 || speciesTypeKey == 4 || speciesTypeKey==7 || speciesTypeKey==8">Gviewer (Genome Viewer)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="oKey==1"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==6" > <img src="/rgdweb/common/images/damaging.png" border="0" style="cursor:pointer;padding:5px; margin-right:0px; border:1px solid black;" ng-click="rgd.toolSubmit('damage')"/></div><div ng-if="speciesTypeKey!=1 && speciesTypeKey!=3 && speciesTypeKey!=6">Variant Visualizer (Damaging Variants) unavailble</div></div><div ng-if="oKey!=1">Variant Visualizer (Damaging Variants)<br>unavailable</div></td>
                                </tr>
                                <tr>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('interviewer')"><div ng-if="oKey==1">InterViewer (Protein-Protein Interactions)</div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('gviewer')"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==2 || speciesTypeKey==5 || speciesTypeKey==6 || speciesTypeKey==9" ><div ng-if="oKey==1">GViewer (Genome Viewer)</div></div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('excel')"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==6" ><div ng-if="oKey==1">Variant Visualizer (Damaging Variants)</div></div></td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr>
                                    <td align="center"><div ng-if="oKey==1"> <img src="/rgdweb/common/images/annotCompare.png" border="0" style="cursor:pointer;padding:5px; margin-right:0px; border:1px solid black;" ng-click="rgd.toolSubmit('annotCompare')"/></div><div ng-if="oKey!=1">Gene Annotator (Annotation Comparison)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="oKey==1"> <img src="/rgdweb/common/images/olga.png" border="0" style="cursor:pointer;padding:5px; margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('olga')"/></div><div ng-if="oKey!=1">OLGA (Gene List Generator)<br>unavailable</div></td>
                                    <td align="center"> <img src="/rgdweb/common/images/excel.png" border="0" style="cursor:pointer;padding:5px; margin-right:0px; border:1px solid black;" ng-click="rgd.toolSubmit('excel')"/></td>
                                </tr>
                                <tr>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('annotCompare')"><div ng-if="oKey==1">Gene Annotator (Annotation Comparison)</div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('olga')"><div ng-if="oKey==1">OLGA (Gene List Generator)</div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('excel')">Excel (Download)</td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr>
                                    <td align="center"><div ng-if="oKey==1"> <img src="/rgdweb/images/MOET.png" border="0" style="cursor:pointer;padding:5px; margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('enrichment')"/></div><div ng-if="oKey!=1">MOET (Multi-Ontology Enrichement)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="oKey==1"> <img src="/rgdweb/images/GOLF.png" border="0" style="cursor:pointer;padding:5px; margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('golf')"/></div><div ng-if="oKey!=1">GOLF (Gene-Ortholog Location Finder)<br>unavailable</div></td>
                                </tr>
                                <tr>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('enrichment')"><div ng-if="oKey==1">MOET (Multi-Ontology Enrichement)</div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('golf')"><div ng-if="oKey==1">GOLF (Gene-Ortholog Location Finder)</div></td>

                                </tr>
                            </table>

                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>


        <!-- end tool navigation -->









        <!--
                            <div style="font-weight:700;text-decoration: underline;">Saved Lists</div>

                                            <div ng-repeat="list in myLists" style="display:table-row;">

                                             <div style="display: table-cell; float:left; margin-right:10px; min-width: 50px; font-weight:700;">{{ list.name }}:</div> <div style="width:100%;"> {{ list.desc }}</div>
                                             <div style="display: table-cell; float:left; margin-right:10px; min-width: 50px;"><a href="javascript:void(0)" ng-click="rgd.loadGeneList(list.id)">Preview</a></div>
                                             <div style="display: table-cell; float:left;  margin-right:10px; min-width: 40px;"><a href="{{ list.link }}&lid={{list.id}}">Edit</a></div>
                                             <div style="display: table-cell; float:left;  margin-right:10px; min-width: 50px;" ><a href="javascript:void(0)" ng-click="rgd.removeList(list.id)">Remove</a></div>
                                             <div style="display: table-cell; float:left;  margin-right:10px; min-width: 50px; padding-bottom:10px;" ><input type="button" value="Import" ng-click="rgd.import(list.id)" data-dismiss="modal"/></div>



                                            </div>
                            </div>
                            -->
        <html>
        <script src="/rgdweb/js/webFeedback.js"></script>

        <body>
        <div id="divButtons" class="btnDiv">
            <button type="button" class="hideMe" id="hideDiv" onclick="hideButtons()">x</button>
            <button class="thumbsDown" v-on:click="dislikedPage"></button>
            <button class="open-button" onclick="openForm()">Send Message</button>
            <button class="thumbsUp" v-on:click="likedPage"></button>
        </div>
        <div id="hiddenBtns" class="hiddenBtns" style="display: none">
            <button type="button" class="openLikeBtn" onclick="hideButtons()"></button>
        </div>

        <div class="chat-popup" id="messageVue">
            <form class="form-container">
                <button type="button" id="close" onclick="closeForm()" class="closeForm">x</button>
                <h2 id="headMsg">Send us a Message</h2>
                <input type="hidden" name="subject" value="Help and Feedback Form">
                <input type="hidden" name="found" value="0">

                <label><b>Your email</b></label>
                <br><input type="email" name="email" v-model="email">
                <br><label><b>Message</b></label>
                <textarea placeholder="Type message.." name="comment" v-model="message"></textarea>

                <button type="button" id="sendEmail" class="btn" v-on:click="sendMail">Send</button>

            </form>
        </div>
        </body>
        </html>
        <script>
            checkCookie();
        </script>



        <table class="wrapperTable" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>

                    <div id="headWrapper">




                        <div class="top-bar">
                            <table width="100%" border="0" class="headerTable" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" style="color:white;" rowspan="3" width="10">

                                        <div ><a class="homeLink" href="/wg/home"><img style="border:3px solid #2865A3;" border="0" src="/rgdweb//common/images/rgd_logo.jpg"></a></div>

                                    </td>

                                    <td align="right" style="color:white;" valign="center" colspan="3">
                                        <a href="/wg/registration-entry/">Submit Data</a>&nbsp;|&nbsp;
                                        <a href="/wg/help3">Help</a>&nbsp;|&nbsp;
                                        <a href="/wg/home/rgd_rat_community_videos/">Video Tutorials</a>&nbsp;|&nbsp;
                                        <a href="/wg/news2/">News</a>&nbsp;|&nbsp;
                                        <a href="/wg/home/rat-genome-database-publications">Publications</a>&nbsp;|&nbsp;

                                        <a href="https://download.rgd.mcw.edu">Download</a>&nbsp;|&nbsp;
                                        <a href="https://rest.rgd.mcw.edu/rgdws/swagger-ui/index.html">REST API</a>&nbsp;|&nbsp;
                                        <a href="/wg/citing-rgd">Citing RGD</a>&nbsp;|&nbsp;
                                        <a href="/rgdweb/contact/contactus.html">Contact</a>&nbsp;&nbsp;&nbsp;

                                        <%-- <input type="button" class="btn btn-info btn-sm"  value="{{username}}" ng-click="rgd.loadMyRgd($event)" style="background-color:#2B84C8;padding:1px 10px;font-size:12px;line-height:1.5;border-radius:3px"/> --%>
                                    </td>

                                </tr>

                                <tr>
                                    <td colspan="2">



                                        <div class="rgd-navbar">
                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/wg'">Home
                                                    <i class="fa fa-caret-down"></i>
                                                </button>

                                                <div class="rgd-dropdown-content">
                                                    <a href="/rgdweb/search/searchByPosition.html">Search RGD</a><!---RGDD-1856 New Search By Position added -->
                                                    <a href="/wg/grants/">Grant Resources</a>
                                                    <a href="/wg/citing-rgd/">Citing RGD</a>
                                                    <a href="/wg/about-us/">About Us</a>
                                                    <a href="/rgdweb/contact/contactus.html">Contact Us</a>
                                                </div>
                                            </div>
                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/wg/data-menu/'">Data
                                                    <i class="fa fa-caret-down"></i>
                                                </button>

                                                <div class="rgd-dropdown-content">
                                                    <a href="/rgdweb/search/genes.html?100">Genes</a>
                                                    <a href="/rgdweb/search/variants.html">Variants <span style="color:red;">(beta)</span></a>
                                                    <a href="/rgdweb/projects/project.html">Community Projects</a>
                                                    <a href="/rgdweb/search/qtls.html?100">QTLs</a>
                                                    <a href="/rgdweb/search/strains.html?100">Strains</a>
                                                    <a href="/rgdweb/search/markers.html?100">Markers</a>
                                                    <a href="/rgdweb/report/genomeInformation/genomeInformation.html">Genome Information</a>
                                                    <a href="/rgdweb/ontology/search.html">Ontologies</a>
                                                    <a href="/rgdweb/search/cellLines.html">Cell Lines</a>
                                                    <a href="/rgdweb/search/references.html?100">References</a>
                                                    <a href="https://download.rgd.mcw.edu">Download</a>
                                                    <a href="/wg/registration-entry/">Submit Data</a>
                                                </div>
                                            </div>
                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/wg/tool-menu/'">Analysis & Visualization
                                                    <i class="fa fa-caret-down"></i>
                                                </button>

                                                <div class="rgd-dropdown-content">
                                                    <a href="/QueryBuilder" >OntoMate (Literature Search)</a>
                                                    <a href="/rgdweb/jbrowse2/listing.jsp">JBrowse (Genome Browser)</a>
                                                    <a href="/vcmap">Synteny Browser (VCMap)</a>
                                                    <a href="/rgdweb/front/config.html">Variant Visualizer</a>

                                                    <a href="/rgdweb/enrichment/start.html">Multi-Ontology Enrichment (MOET)</a>
                                                    <a href="/rgdweb/ortholog/start.html">Gene-Ortholog Location Finder (GOLF)</a>
                                                    <a href="/rgdweb/cytoscape/query.html">InterViewer (Protein-Protein Interactions)</a>
                                                    <a href="/rgdweb/phenominer/ontChoices.html?species=3">PhenoMiner (Quatitative Phenotypes)</a>
                                                    <a href="/rgdweb/ga/start.jsp">Gene Annotator</a>
                                                    <a href="/rgdweb/generator/list.html">OLGA (Gene List Generator)</a>
                                                    <a href="https://www.alliancegenome.org/bluegenes/alliancemine">AllianceMine</a>
                                                    <a href="/rgdweb/gTool/Gviewer.jsp">GViewer (Genome Viewer)</a>
                                                </div>
                                            </div>
                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/rgdweb/portal/index.jsp'">Diseases
                                                    <i class="fa fa-caret-down"></i>
                                                </button>
                                                <div class="rgd-dropdown-content">
                                                    <a href="/rgdweb/portal/home.jsp?p=1">Aging & Age-Related Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=2">Cancer & Neoplastic Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=3">Cardiovascular Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=14">Coronavirus Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=12">Developmental Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=4">Diabetes</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=5">Hematologic Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=6">Immune & Inflammatory Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=15">Infectious Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=13">Liver Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=7">Neurological Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=8">Obesity & Metabolic Syndrome</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=9">Renal Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=10">Respiratory Disease</a>
                                                    <a href="/rgdweb/portal/home.jsp?p=11">Sensory Organ Disease</a>
                                                </div>

                                            </div>
                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/wg/physiology/'">Phenotypes & Models
                                                    <i class="fa fa-caret-down"></i>
                                                </button>

                                                <div class="rgd-dropdown-content">
                                                    <a href="/rgdweb/models/findModels.html">Find Models&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;color:red">new</span></a>
                                                    <a href="/rgdweb/models/allModels.html">Genetic Models</a>
                                                    <a href="/wg/autism-rat-model-resource/">Autism Models</a>
                                                    <a href="/rgdweb/phenominer/ontChoices.html?species=3">Rat PhenoMiner (Quantitative Phenotypes)</a>
                                                    <a href="/rgdweb/phenominer/ontChoices.html?species=4">Chinchilla PhenoMiner</a>
                                                    <a href="/rgdweb/phenominer/phenominerExpectedRanges/views/home.html">Expected Ranges (Quantitative Phenotype)</a>
                                                    <a href="/rgdweb/pa/termCompare.html?term1=RS%3A0000457&term2=CMO%3A0000000&countType=rec&species=3">PhenoMiner Term Comparison</a>
                                                    <a href="/wg/hrdp_panel/">Hybrid Rat Diversity Panel</a>
                                                    <a href="/wg/phenotype-data13/">Phenotypes</a>
                                                    <a href="/wg/physiology/additionalmodels/">Phenotypes in Other Animal Models</a>
                                                    <a href="/wg/strain-maintenance/">Animal Husbandry</a>
                                                    <a href="/wg/physiology/strain-medical-records/">Strain Medical Records</a>
                                                    <a href="/wg/phylogenetics/">Phylogenetics</a>
                                                    <a href="/wg/strain-availability/">Strain Availability</a>
                                                    <a href="https://download.rgd.mcw.edu/pub/data_release/Hi-res_Rat_Calendars/">Calendar</a>
                                                    <a href="/wg/physiology/rats101/">Rats 101</a>
                                                    <a href="/wg/photos-and-images/community-submissions/">Submissions</a>
                                                    <a href="/wg/photos-and-images/physgen-photo-archive2/">Photo Archive</a>
                                                </div>
                                            </div>

                                            <a href="/wg/home/pathway2/">Pathways</a>

                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/wg/com-menu/'">Community
                                                    <i class="fa fa-caret-down"></i>
                                                </button>

                                                <div class="rgd-dropdown-content">
                                                    <a href="http://mailman.mcw.edu/mailman/listinfo/rat-forum">Rat Community Forum</a>
                                                    <a href="/wg/com-menu/directory-of-rat-laboratories2/">Directory of Rat Laboratories</a>
                                                    <a href="/wg/home/rgd_rat_community_videos/">Video Tutorials</a>
                                                    <a href="/wg/news2/">News</a>
                                                    <a href="/wg/home/rat-genome-database-publications/">RGD Publications</a>
                                                    <a href="/wg/com-menu/poster_archive/">RGD Presentations Archive</a>
                                                    <a href="/wg/nomenclature-guidelines/">Nomenclature Guidelines</a>
                                                    <a href="/wg/resource-links/">Resource Links</a>
                                                    <a href="/wg/resource-links/laboratory-resources/">Laboratory Resources</a>
                                                    <a href="/wg/resource-links/employment-resources/">Employment Resources</a>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td >


                                        <div id="app">

                                            <div id="test" style="width:100%;height:10px">

                                            </div>

                                            <div class="container-fluid" id="container" style="height:36px;">

                                                <div class="row" style=";margin-top:2px;margin-left:35%;margin-bottom:2px;">
                                                    <form  name="elasticSearchForm" class="form-inline" action="/rgdweb/elasticResults.html" id="elasticSearchForm" role="search" method="post">
                                                        <input type="hidden" name="log" value="true"/>
                                                        <input type="hidden" name="category" id="category" value="General"/>

                                                        <div class="form-row row">
                                                            <div class="form-group">
                                                                <div class="input-group" >
                                                                    <input   class="searchgroup" id="term" name=term size="50" placeholder="Enter Search Term..." value="" type="search"  />

                                                                    <div class="input-group-append">

                                                                        <button class="btn btn-primary" type="submit">
                                                                            <i class="fa fa-search"></i>
                                                                        </button>&nbsp;&nbsp;
                                                                    </div>
                                                                </div>
                                                                <small class="form-text text-muted"><a href="/rgdweb/generator/list.html" >Advanced Search (OLGA)</a></small>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>


                                            </div>

                                        </div>

                                    </td>
                                    <td>
                                        <a href="https://www.facebook.com/pg/RatGenomeDatabase/posts/"><img src="/rgdweb/common/images/social/facebook-20.png"/></a>
                                        <a href="https://twitter.com/ratgenome"><img src="/rgdweb/common/images/social/twitter-20.png"/></a>
                                        <a href="https://www.linkedin.com/company/rat-genome-database"><img src="/rgdweb/common/images/social/linkedin-20.png"/></a>
                                        <a href="https://www.youtube.com/channel/UCMpex8AfXd_JSTH3DIxMGFw?view_as=subscriber"><img src="/rgdweb/common/images/social/youtube-20.png"/></a>
                                        <a href="https://github.com/rat-genome-database"><img src="/rgdweb/common/images/GitHub_Logo_White-20.png"/></a>

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

</td>
</tr>
<tr>
    <link href="https://fonts.googleapis.com/css?family=Source+Code+Pro&display=swap" rel="stylesheet">
    <td colspan=1 align="right" width="100%">

    </td>
</tr>
</table>



<div id="mainBody">
    <div id="contentArea" class="content-area">
        <table cellpadding="5" border=0 align="center" width="100%">
            <tr>
                <td colspan="3" align="left" valign="top">

